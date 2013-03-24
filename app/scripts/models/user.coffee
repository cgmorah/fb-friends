define ["backbone", "lib/facebook"], (Backbone, Facebook) ->
  class User extends Backbone.Model
    url: -> Facebook.userURL()

    initialize: ->
      Facebook.init()
      Facebook.on "loggedIn", @trigger.bind(this, "loggedIn")

    login: ->
      Facebook.login()
      @once "loggedIn", @fetch.bind(this)
