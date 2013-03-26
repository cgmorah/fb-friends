define ["backbone", "views/friend"]
, (Backbone, FriendView) ->
  class FriendListView extends Backbone.View
    tagName: "ul"
    className: "friend-list"

    initialize: ({app}) ->
      @app = app
      @app.friendList.on "reset", @render.bind(this)
      $("body").one "focus", ".search input", @show.bind(this)

    render: ->
      @app.friendList.each (friend) =>
        view = new FriendView(model: friend)
        @$el.append view.render()

    show: ->
      @app.$el.append @$el
      @$el.jScrollPane(verticalGutter: 0, hideFocus: true)
