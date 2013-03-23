define ["backbone", "models/user"], (Backbone, User) ->
  class AppView extends Backbone.View
    user = null

    el: "body"
    events:
      "click .login": -> user.login()

    initialize: ->
      user = new User

