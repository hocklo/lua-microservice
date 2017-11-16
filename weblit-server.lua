local weblit = require('weblit')
local json = require('json').use_lpeg()

weblit.app
  .bind({host = "127.0.0.1", port = 1337})

  -- Configure weblit server
  .use(weblit.logger)
  .use(weblit.autoHeaders)

  -- A custom route that sends back method and part of url.
  .route({ path = "/:name"}, function (req, res)
    local tbl = { name = req.params.name }
    res.body = json.stringify( tbl )
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)
  .route({ path = "/:name/:surname"}, function (req, res)
    local tbl = { name = req.params.name, surname = req.params.surname}
    res.body = json.stringify( tbl )
    res.code = 200
    res.headers["Content-Type"] = "application/json"
  end)

  -- Start the server
  .start()
