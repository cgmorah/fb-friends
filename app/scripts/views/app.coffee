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
    el: "body"

    events:
      "click .login": -> @user.login()

    initialize: ->
      options = {app: this}

      @user = new User options
      @friendList = new FriendList options

      @headerView = new HeaderView options
      @backgroundView = new BackgroundView options
      @searchView = new SearchView options
      @friendListView = new FriendListView options

      @user.on "loggedIn", => @$el.find(".login").animateOut(true)
