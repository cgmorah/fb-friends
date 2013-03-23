define ["backbone", "models/user"], (Backbone, User) ->
  class AppView extends Backbone.View
    el: "body"

    initialize: ->
      user = new User
      user.login()

