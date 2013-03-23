define ["backbone", "lib/facebook"], (Backbone, Facebook) ->
  class FacebookSession extends Backbone.Model
    initialize: ->
      Facebook.init()
