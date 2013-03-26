define ["backbone", "views/friend"]
, (Backbone, FriendView) ->
  class FriendListView extends Backbone.View
    tagName: "ul"
    className: "friend-list"
    collection: null
    topFriend: null

    initialize: ({app}) ->
      @app = app
      @collection = @app.friendList
      @collection.on "reset", @render.bind(this)
      $("body").one "focus", ".search input", @show.bind(this)

    render: ->
      @views = []
      @collection.each (friend) =>
        view = new FriendView(model: friend)
        @$el.append view.render()
        @views.push view

    # Render all friends matching the search string.
    # The search string is interpreted as RegEx.
    # An empty search renders all friends.
    renderMatches: (search) ->
      # User input could be invalid regex,
      # just return if that is the case.
      try
        regex = new RegExp search, "i"
      catch error
        return

      @topFriend = null
      for friendView in @views
        name = friendView.model.get "name"

        if regex.test name
          friendView.show search
          @topFriend = friendView.model unless @topFriend
        else
          friendView.hide()

      @$el.data("jsp").reinitialise()

    show: ->
      @app.$el.append @$el
      @$el.jScrollPane verticalGutter: 0, hideFocus: true
