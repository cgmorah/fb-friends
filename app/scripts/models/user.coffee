define ["backbone", "models/facebook-session"], (Backbone, FacebookSession) ->
  class User extends Backbone.Model
    session = null
    url: -> session.userURL()

    initialize: ->
      session = new FacebookSession

    login: ->
      session.login()
      session.once "loggedIn", @fetch.bind(this)
