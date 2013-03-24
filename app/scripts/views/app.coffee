define [
    "backbone"
    "models/user"
    "collections/friends"
    "views/header"
    "views/background"
    "views/search"
    "views/friends"
],
(
    Backbone
    User
    FriendList
    HeaderView
    BackgroundView
    SearchView
    FriendListView
) ->
  class AppView extends Backbone.View
    user = null
    headerView = null
    backgroundView = null

    el: "body"
    events:
      "click .login": -> user.login()

    initialize: ->
      user = new User
      friendList = new FriendList(user)

      headerView = new HeaderView(user)
      backgroundView = new BackgroundView(user)
      searchView = new SearchView(@$el, user)
      friendListView = new FriendListView(@$el, friendList)

      user.on "loggedIn", => @$el.find(".login").animateOut(true)
