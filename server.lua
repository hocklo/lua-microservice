local http = require('http')
local json = require('json').use_lpeg()

http.createServer(function (req, res)

  local tbl = { greeting = "Hello World!" }
  local body = json.stringify( tbl )
  res:setHeader("Content-Type", "application/json")
  res:setHeader("Content-Length", #body)
  res:finish(body)
end):listen(1337, '127.0.0.1')

print('Server running at http://127.0.0.1:1337/')
