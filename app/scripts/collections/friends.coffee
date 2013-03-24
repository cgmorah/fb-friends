define ["backbone", "lib/facebook", "models/friend"]
, (Backbone, Facebook, Friend) ->
  class FriendList extends Backbone.Collection
    model: Friend
    url: -> Facebook.friendListURL()
    fetch: ->
      $.ajax
        type: "GET"
        url: @url()
        dataType: "JSON"
        success: (response) =>
          @reset(response.data)
