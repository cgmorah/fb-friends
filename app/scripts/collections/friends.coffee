define ["backbone", "lib/facebook", "models/friend"]
, (Backbone, Facebook, Friend) ->
  class FriendList extends Backbone.Collection
    model: Friend
    comparator: "name"

    url: -> Facebook.friendListURL()

    sync: (method, model, options) ->
      unless method is "read"
        Backbone.Model.prototype.sync(method, model, options)

      Facebook.getFriends (response) ->
        if response.error
          options?.error?(response)
        else
          options?.success?(model, response.data, options)
        true

    initialize: ({app}) ->
      @app = app
      @app.user.on "loggedIn", @fetch.bind(this)
