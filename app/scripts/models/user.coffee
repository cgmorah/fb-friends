define ["backbone", "models/facebook-session"], (Backbone, FacebookSession) ->
  class User extends Backbone.Model
    session = null
    url: -> session.userURL()

    initialize: ->
      session = new FacebookSession
      session.on "loggedIn", @trigger.bind(this, "loggedIn")

    login: ->
      session.login()
      session.once "loggedIn", @fetch.bind(this)
