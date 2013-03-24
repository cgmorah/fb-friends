define ["backbone", "handlebars", "text!../templates/header.handlebars"]
, (Backbone, Handlebars, template) ->
  class HeaderView extends Backbone.View
    el: "header"
    template: Handlebars.compile template

    initialize: (@user) ->
      @user.on "change:name", @render.bind(this)

    render: ->
      @$el.find(".title").animateOut true, =>
        @$el.append @template(@user.toJSON())
