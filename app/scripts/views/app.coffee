define ["backbone", "handlebars", "models/user", "views/header"], (Backbone, Handlebars, User, HeaderView) ->
  class AppView extends Backbone.View
    user = null
    headerView = null

    el: "body"
    events:
      "click .login": -> user.login()

    backgroundTemplate: Handlebars.compile $("#background-template").html()

    initialize: ->
      user = new User
      headerView = new HeaderView(user)
      user.on "change:cover", =>
        @$el.append @backgroundTemplate(user.toJSON())
