define ["backbone", "handlebars", "text!templates/header.handlebars"]
, (Backbone, Handlebars, template) ->
  class HeaderView extends Backbone.View
    el: "header"
    template: Handlebars.compile template

    app: null
    initialize: ({app}) ->
      @app = app
      @app.user.on "change:name", @render.bind(this)
      $("body").one "focus", ".search input", @minimize.bind(this)

    render: ->
      @$el.find(".title").animateOut true, =>
        @$el.append @template(@app.user.toJSON())

    minimize: ->
      @$el.addClass "minimize"
