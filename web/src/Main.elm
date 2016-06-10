module Main exposing (..)

import Html exposing (..)
import String
import Html.App as Html
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Task
import Http
import Json.Decode exposing (..)
import Json.Encode


type alias Model =
  { input : String
  , count : Int
  , upperReturn : String
  }


model =
  { input = ""
  , count = 0
  , upperReturn = ""
  }



-- Update


type Msg
  = Uppercase
  | Count
  | Input String
  | NoOp
  | RequestUpper
  | OnFail Http.Error


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Input s ->
      --  let (newModel, newCmd) = update Uppercase model in
      --  ({ newModel | input = s }, newCmd)
      let
        apiURL =
          "http://string.groob.io:8000/uppercase"

        msgBody =
          Http.string """{ "s": "hello" }"""

        postToAPI =
          Http.post (Json.Decode.object1 ("v" := Json.Decode.string)) apiURL msgBody

        cmd =
          Task.perform OnFail (\_ -> Uppercase) (postToAPI)
      in
        ( { model | input = s }, cmd )

    Uppercase ->
      ( { model | upperReturn = String.toUpper model.input }, Cmd.none )

    Count ->
      ( { model | count = String.length model.input }, Cmd.none )

    NoOp ->
      ( model, Cmd.none )

    RequestUpper ->
      ( model, Cmd.none )

    OnFail err ->
      let
        log =
          Debug.log "errmsg" err
      in
        ( model, Cmd.none )



--


view : Model -> Html Msg
view model =
  div
    []
    [ div
        []
        [ Html.input
            [ onInput Input
            , Html.Attributes.placeholder "hi"
            ]
            []
        ]
    , div [] [ text <| toString <| String.length model.input ]
    , div [] [ text model.upperReturn ]
    , button [ onClick Uppercase ] [ text "uppercase" ]
    , button [ onClick Count ] [ text "count" ]
    ]


main : Program Never
main =
  Html.program
    { init = ( model, Cmd.none )
    , subscriptions = (\_ -> Sub.none)
    , view = view
    , update = update
    }
