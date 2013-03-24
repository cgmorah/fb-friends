define ["backbone", "views/friend"]
, (Backbone, FriendView) ->
  class FriendListView extends Backbone.View
    tagName: "ul"
    className: "friend-list"

    initialize: (@$parent, @collection) ->
      @collection.on "reset", @render.bind(this)
      $("body").one "focus", ".search input", @show.bind(this)

    render: ->
      @collection.each (friend) =>
        view = new FriendView(model: friend)
        @$el.append view.render()

    show: ->
      @$parent.append @$el
      @$el.jScrollPane(verticalGutter: 0, hideFocus: true)
