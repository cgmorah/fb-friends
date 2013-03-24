define ["backbone", "handlebars"], (Backbone, Handlebars) ->
  class HeaderView extends Backbone.View
    el: "header"
    template: Handlebars.compile $("#header-template").html()

    initialize: (@user) ->
      @user.on "change:name", @render.bind(this)

    render: ->
      @$el.find(".title").animateOut true, =>
        @$el.append @template(@user.toJSON())
