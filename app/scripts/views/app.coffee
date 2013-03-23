define ["backbone"], (Backbone) ->
  class AppView extends Backbone.View
    el: "body"

    initialize: ->
      console.log "Hello World"

