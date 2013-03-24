define ["backbone", "lib/facebook", "models/friend"]
, (Backbone, Facebook, Friend) ->
  class FriendList extends Backbone.Collection
    model: Friend
    comparator: "name"

    url: -> Facebook.friendListURL()
    fetch: ->
      $.ajax
        type: "GET"
        url: @url()
        dataType: "JSON"
        success: (response) =>
          @reset(response.data)

    initialize: (@user) ->
      @user.on "loggedIn", @fetch.bind(this)
