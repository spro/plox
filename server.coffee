http = require 'http'
request = require 'request'
url = require 'url'

server = http.createServer (req, res) ->
    target = url.parse(req.url).path.slice(1)
    options = url.parse(target)
    res.setHeader 'Access-Control-Allow-Origin', '*'

    console.log "[#{req.method}] " + target
    request.get(target).pipe(res)

server.listen(10992)
