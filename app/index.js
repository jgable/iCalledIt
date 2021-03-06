// Generated by CoffeeScript 1.3.3
var app, assets, controller, controllerName, controllers, express, jsAssetPrimer, port, stylus,
  __hasProp = {}.hasOwnProperty;

express = require('express');

stylus = require('stylus');

assets = require('connect-assets');

jsAssetPrimer = require("./jsAssetPrimer");

controllers = require("./controllers");

app = express();

app.use(assets());

app.use(express["static"](process.cwd() + '/public'));

app.set('view engine', 'jade');

jsAssetPrimer.init(js);

for (controllerName in controllers) {
  if (!__hasProp.call(controllers, controllerName)) continue;
  controller = controllers[controllerName];
  controller.init(app);
}

port = process.env.PORT || process.env.VMC_APP_PORT || 3000;

app.listen(port, function() {
  return console.log("Listening on " + port + "\nPress CTRL-C to stop server.");
});
