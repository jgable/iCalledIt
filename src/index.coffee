express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
fs = require "fs"

app = express()

# Add Connect Assets
app.use assets()

# Set the public folder as static assets
console.log "Static Dir: " + process.cwd() + '/public'
app.use express.static(process.cwd() + '/public')

# Set View Engine
app.set 'view engine', 'jade'

# Prime the connect-assets to make all the js/coffee files available
loadJSFile = (file) ->
  stat = fs.statSync file
  if stat?.isDirectory()
    loadJSDir file
  else
    assetName = (((file.replace "assets/js", "").replace ".coffee", "").replace ".js", "").slice 1
    console.log "Assetizing #{assetName}"
    js assetName
loadJSDir = (dirPath) ->
  files = fs.readdirSync dirPath

  loadJSFile "#{dirPath}/#{file}" for file in files
  true

loadJSFile "assets/js"

# TODO: Move route registration elsewhere
# TODO: Create a controller pattern

# Get root_path return index view
app.get '/', (req, resp) -> 
  resp.render 'index'
# Define Port
port = process.env.PORT or process.env.VMC_APP_PORT or 3000
# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."