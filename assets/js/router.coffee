define ['Underscore', 'Backbone'], (_, Backbone) ->
  init: ->
    router = Backbone.Router.extend
      something: 1

    console.log "Made a router"