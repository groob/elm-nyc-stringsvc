module Main exposing (..)

import Html exposing (..)
import String
import Html.App as Html
import Html.Events exposing (onClick, onInput)
import Html.Attributes
  exposing
    ( id
    , attribute
    , property
    , autofocus
    , class
    , href
    , placeholder
    , style
    , value
    , src
    , width
    , height
    )


main : Program Never
main =
  text "hello"



-- main : Program Never
-- main =
--   Html.program
--     { init = init
--     , view = view
--     , update = update
--     , subscriptions = subscriptions
--     }
