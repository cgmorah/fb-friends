define ["backbone", "handlebars", "text!templates/search.handlebars"]
, (Backbone, Handlebars, template) ->
  class SearchView extends Backbone.View
    className: "search"
    template: Handlebars.compile template

    initialize: ({app}) ->
      @app = app
      @app.user.once "loggedIn", @render.bind(this)

    render: ->
      @$el.append @template()
      @$parent.append @$el
      @app.$el.append @$el
