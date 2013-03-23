define ["backbone", "models/facebook-session"], (Backbone, FacebookSession) ->
  class AppView extends Backbone.View
    el: "body"

    initialize: ->
      new FacebookSession

