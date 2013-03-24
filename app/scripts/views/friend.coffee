define ["backbone", "handlebars", "text!templates/friend.handlebars"]
, (Backbone, Handlebars, template) ->
  class FriendView extends Backbone.View
    tagName: "li"
    className: "friend"
    template: Handlebars.compile template

    model: null

    render: ->
      @$el.append(@template(@model.toJSON()))
