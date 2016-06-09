# string
Uppercase strings and Count characters


API Documentation
```
$ curl -XPOST -d'{"s":"hello, world"}' https://string.groob.io/uppercase
{"v":"HELLO, WORLD","err":null}
$ curl -XPOST -d'{"s":"hello, world"}' https://string.groob.io/count
{"v":12}
```

# running server localy
just run `./string` and the endpoints will be availabe at :8080
```
Usage of ./string:
  -listen string
        HTTP listen address (default ":8080")
  -proxy string
        Optional comma-separated list of URLs to proxy uppercase requests
        ```

## Backend code
Original code is an example from the go-kit project
https://github.com/go-kit/kit/tree/master/examples
