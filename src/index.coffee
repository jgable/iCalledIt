express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
jsAssetPrimer = require "./jsAssetPrimer"
controllers = require "./controllers"

app = express()

# Add Connect Assets
app.use assets()

# Set the public folder as static assets
app.use express.static(process.cwd() + '/public')

# Set View Engine
app.set 'view engine', 'jade'

# Load all of our javascript and coffeescript files into the connect-assets middleware
# so that requireJS can pull them in asynch.
jsAssetPrimer.init js

# Initialize all our controllers (moves route registration out of here)
controller.init app for own controllerName, controller of controllers

# Define Port
port = process.env.PORT or process.env.VMC_APP_PORT or 3000
# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."