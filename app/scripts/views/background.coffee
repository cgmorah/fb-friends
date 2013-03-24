define ["backbone", "handlebars", "text!templates/background.handlebars"]
, (Backbone, Handlebars, template) ->
  class BackgroundView extends Backbone.View
    el: "body"
    template: Handlebars.compile template

    initialize: (@user) ->
      @user.on "change:cover", @render.bind(this)

    render: ->
      @$el.append @template(@user.toJSON())
