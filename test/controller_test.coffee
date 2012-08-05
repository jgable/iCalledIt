should = require "should"
BaseControllers = require "../src/controllers/_base"

# TODO: Move to fakes class?
class FakeApp
  get: ->
    
  post: ->

  put: ->

  "delete": ->


describe "iCalledIt Controllers", ->
  it "are loaded dynamically at app start", -> true

  describe "BaseRouteController", ->  
    testCon = new BaseControllers.BaseRouteController
    beforeEach ->
      testCon = new BaseControllers.BaseRouteController
      testCon.handler1 = ->
        "result1"
      testCon.handler2 = ->
        "result2"

      testCon.get = 
        "/": "handler1"
        "/other": "handler1,handler2"
        "/unordered": "handler2,handler1"
    it "has an init method", ->
      should.exist testCon.init

    it "registers get routes (single, double and ordered)", ->
      app = new FakeApp
      routesRegistered = []
      app.get = (route, handlers...) ->
        routesRegistered.push
          route: route
          handlers: handlers

      testCon.init app

      # Check for proper amount of registrations
      routesRegistered.length.should.equal 3
      
      # Check for proper route url
      routesRegistered[0].route.should.equal "/"
      # Check for simple/single handler registration
      routesRegistered[0].handlers.length.should.equal 1
      routesRegistered[0].handlers[0]().should.equal "result1"

      # Check for double handler registration
      routesRegistered[1].handlers.length.should.equal 2
      routesRegistered[1].handlers[0]().should.equal "result1"
      routesRegistered[1].handlers[1]().should.equal "result2"

      # Check for unordered registration
      routesRegistered[2].handlers.length.should.equal 2
      routesRegistered[2].handlers[0]().should.equal "result2"
      routesRegistered[2].handlers[1]().should.equal "result1"

    # TODO Test other methods (post, put, delete)?

    it "can call init without routes", ->
      app = new FakeApp
      emptyCon = new BaseControllers.BaseRouteController
      emptyCon.init app


