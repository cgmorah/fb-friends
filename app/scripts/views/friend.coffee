define [
  "backbone"
  "jquery"
  "handlebars"
  "text!templates/friend.handlebars"
  "text!templates/highlight.html"
], (Backbone, $, Handlebars, template, highlight) ->
  class FriendView extends Backbone.View
    tagName: "li"
    className: "friend"
    template: Handlebars.compile template

    model: null

    initialize: ->
      highlight = $.trim(highlight)

    render: ->
      @$el.append(@template(@model.toJSON()))
      @$name = @$el.find(".name")
      @$el

    hide: ->
      @$el.hide()
      @$name.text(@model.get "name")

    show: (search) ->
      @$el.show()

      regex = new RegExp("(#{search})", "i")
      @$name.html @model.get("name").replace(regex, highlight)
