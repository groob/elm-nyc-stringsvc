# Purpose
This repo contains an API intended as an exercise to learn Elm. I set this example up for the Elm-NYC meetup. 
During the meetup, we implemented a frontend for the API as a group, where one person coded and others gave suggestions. 
We used a single keyboard but many people took turns to code.

Here are the requirements:
* Use [http://elm-lang.org/try ](http://elm-lang.org/try) as your editor/compiler. I chose it because not everyone is familiar with vim/emacs/sublime etc. I also chose it because it has a limited set of libraries you can use.
* Try as much as possible to stick to http://guide.elm-lang.org/ followed by documentation of libraries http://package.elm-lang.org. We did not use any other resources except those and each other.

First create an `Html.begginerProgram` which takes a string as input and returns an UPPERCASE string as output.  
Then, also display the total number of characters in the input.  
Finaly, instead of using the standard library, use the remote API to perform `count` and `uppercase` requests, and display the results in your UI.  

Have fun. The service is live at `https://string.groob.io` and there are linux and mac binaries you can run localy on the release page. https://github.com/groob/elm-nyc-stringsvc/releases/tag/bin

Our almost finished elm code is checked in as we left it in the `meetup-final` branch of this repo.  

# String Service
Uppercase strings and Count characters of a string.

# Remote API
API Documentation
```
$ curl -XPOST -d'{"s":"hello, world"}' https://string.groob.io/uppercase
{"v":"HELLO, WORLD","err":null}
$ curl -XPOST -d'{"s":"hello, world"}' https://string.groob.io/count
{"v":12}
```

# running server localy

Run `./string` and the endpoints will be availabe at :8080
```
Usage of ./string:
  -listen string
        HTTP listen address (default ":8080")
  -proxy string
        Optional comma-separated list of URLs to proxy uppercase requests
        ```

# Backend code

Original code is an example from the go-kit project
https://github.com/go-kit/kit/tree/master/examples
