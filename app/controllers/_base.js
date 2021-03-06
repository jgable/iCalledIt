// Generated by CoffeeScript 1.3.3
var BaseRouteController,
  __hasProp = {}.hasOwnProperty;

BaseRouteController = (function() {

  function BaseRouteController() {}

  BaseRouteController.prototype.get = {};

  BaseRouteController.prototype.post = {};

  BaseRouteController.prototype.put = {};

  BaseRouteController.prototype["delete"] = {};

  BaseRouteController.prototype.init = function(app) {
    this.registerRoutes(app);
    return true;
  };

  BaseRouteController.prototype.registerRoute = function(app, method, route, handlers) {
    var handler, handlerFuncs, _ref;
    handlerFuncs = (function() {
      var _i, _len, _ref, _results;
      _ref = handlers.split(",");
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        handler = _ref[_i];
        _results.push(this[handler]);
      }
      return _results;
    }).call(this);
    handlerFuncs.splice(0, 0, route);
    return (_ref = app[method]) != null ? _ref.apply(app, handlerFuncs) : void 0;
  };

  BaseRouteController.prototype.registerRoutes = function(app, routes) {
    var method, registerMethod, route, _i, _j, _len, _len1, _ref,
      _this = this;
    registerMethod = function(method) {
      var handlers, route, _ref;
      _ref = _this[method];
      for (route in _ref) {
        if (!__hasProp.call(_ref, route)) continue;
        handlers = _ref[route];
        _this.registerRoute(app, method, route, handlers);
      }
      return true;
    };
    if (routes) {
      for (_i = 0, _len = routes.length; _i < _len; _i++) {
        route = routes[_i];
        registerRoute(app, route.method, route.route, route.handlers);
      }
    } else {
      _ref = ["get", "post", "put", "delete"];
      for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
        method = _ref[_j];
        registerMethod(method);
      }
    }
    return true;
  };

  return BaseRouteController;

})();

module.exports = {
  BaseRouteController: BaseRouteController
};
