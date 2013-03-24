define ["backbone", "models/user", "views/header"], (Backbone, User, HeaderView) ->
  class AppView extends Backbone.View
    user = null
    headerView = null

    el: "body"
    events:
      "click .login": -> user.login()

    initialize: ->
      user = new User
      headerView = new HeaderView(user)
