BaseControllers = require "./_base"

class HomeController extends BaseControllers.BaseRouteController
  get:
    "/": "default"
    "/about": "about"

  default: (req, resp) ->
    resp.render "index"

  about: (req, resp) ->
    resp.render "about"

module.exports = new HomeController