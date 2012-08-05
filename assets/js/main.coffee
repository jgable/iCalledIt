require.config
  paths:
    cs: "/js/lib/cs"
    "coffee-script": "/js/lib/coffee-script"
    jQuery: "//cdnjs.cloudflare.com/ajax/libs/jquery/1.7.2/jquery.min"
    Underscore: "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.3.3/underscore-min",
    Bootstrap: "/js/lib/bootstrap-src"
    Backbone: "//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.2/backbone-min"

  shim:
    Bootstrap: ["jQuery"]
    Underscore:
      exports: "_"
    Backbone:
      deps: ["Underscore", "jQuery"]
      exports: "Backbone"

require ['app'], (App) ->
    App.init()