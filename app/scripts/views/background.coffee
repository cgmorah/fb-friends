define ["backbone", "handlebars", "text!templates/background.handlebars"]
, (Backbone, Handlebars, template) ->
  class BackgroundView extends Backbone.View
    el: "body"
    template: Handlebars.compile template

    initialize: ({app}) ->
      @app = app
      @app.user.on "change:cover", @render.bind(this)

    render: ->
      @$el.append @template(@app.user.toJSON())
