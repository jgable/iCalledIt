
class BaseRouteController
  constructor: ->
    # Init code
  
  # Routes should be of the form { "/": "index" } where index is a function on the controller.
  # Allows multiple functions to be passed (comma delimited) for handlers that will be executed in order.
  get: {}
  post: {}
  put: {}
  "delete": {}

  # Take the current app and register our defined routes.
  init: (app) ->
    @registerRoutes app
    true

  # Take the handlers and register them for the appropriate handlers
  registerRoute: (app, method, route, handlers) ->
    # Get all the handler methods referenced by the handlers string; e.g. this.handler1, this.handler2
    handlerFuncs = (@[handler] for handler in handlers.split ",")
    # Push the route into the parm array at the front; e.g. "/"
    handlerFuncs.splice 0, 0, route 

    # At the end of the day, this should match: app.get "/", handler1, handler2
    app[method]?.apply app, handlerFuncs

  # Pass in routes of the form { method: "get", route: "/", handlers: "hander1", "handler2" }, or the values in the @get, @post will be used
  registerRoutes: (app, routes) ->
    # A helper for registering a methods routes (e.g. "get")
    registerMethod = (method) =>
      @registerRoute app, method, route, handlers for own route, handlers of @[method]
      true

    if routes 
      # Handle passed in routes
      registerRoute app, route.method, route.route, route.handlers for route in routes
    else
      # Register each of the 4 major methods if we have no routes defined.
      registerMethod method for method in ["get", "post", "put", "delete"]

    true



# TODO: Authenticated user base controller

module.exports =
  BaseRouteController: BaseRouteController