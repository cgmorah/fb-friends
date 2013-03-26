define ["backbone", "jquery", "underscore", "handlebars", "text!templates/search.handlebars"]
, (Backbone, $, _, Handlebars, template) ->
  class SearchView extends Backbone.View
    className: "search"
    template: Handlebars.compile template

    events:
      "keydown input": "debouncedSearchFriends"

    initialize: ({app}) ->
      @app = app
      @app.user.once "loggedIn", @render.bind(this)

    render: ->
      @$el.append @template()
      @app.$el.append @$el

    _last = ""
    searchFriends: searchFriends = ->
      search = $.trim @$el.find("input").val()

      unless search is _last
        @app.friendListView.renderMatches(search)
        _last = search

    # Debounce the search method, i.e. don't execute the
    # method until 100ms have elapsed since the last invocation.
    # This prevents searches while the user is still typing.
    debouncedSearchFriends: _.debounce(searchFriends, 100)
