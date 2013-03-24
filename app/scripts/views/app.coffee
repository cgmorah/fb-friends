define [
    "backbone"
    "models/user"
    "views/header"
    "views/background"
], (Backbone, User, HeaderView, BackgroundView) ->
  class AppView extends Backbone.View
    user = null
    headerView = null
    backgroundView = null

    el: "body"
    events:
      "click .login": -> user.login()

    backgroundTemplate: Handlebars.compile $("#background-template").html()

    initialize: ->
      user = new User
      headerView = new HeaderView(user)
      backgroundView = new BackgroundView(user)
