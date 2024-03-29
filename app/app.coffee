# Modules
express = require 'express'
http = require 'http'
partials = require 'express-partials'
app = express()
assets = require('connect-assets')
jsPaths = require('connect-assets-jspaths')

# Boot setup
require("#{__dirname}/../config/boot")(app)

# Configuration
app.configure ->
  port = process.env.PORT || 3000
  if process.argv.indexOf('-p') >= 0
    port = process.argv[process.argv.indexOf('-p') + 1]

  app.set 'port', port
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'ejs'
  app.use express.static("#{__dirname}/../public")
  app.use '/html', express.static("#{__dirname}/../app/assets/html")
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use partials()
  app.use assets(src: "#{__dirname}/assets")
  app.use app.router

  jsPaths assets

app.configure 'development', ->
  app.use express.errorHandler()

# Routes
require("#{__dirname}/routes")(app)

# Server
http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'} in #{app.settings.env} mode"
