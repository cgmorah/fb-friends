define ["backbone", "handlebars"], (Backbone, Handlebars) ->
  class BackgroundView extends Backbone.View
    el: "body"
    template: Handlebars.compile $("#background-template").html()

    initialize: (@user) ->
      @user.on "change:cover", @render.bind(this)

    render: ->
      @$el.append @template(@user.toJSON())
