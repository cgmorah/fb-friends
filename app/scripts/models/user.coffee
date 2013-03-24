define ["backbone", "lib/facebook"], (Backbone, Facebook) ->
  class User extends Backbone.Model
    url: -> Facebook.userURL()

    initialize: ->
      Facebook.init()
      Facebook.on "loggedIn", @trigger.bind(this, "loggedIn")
      @on "change:cover", @fullSizeCover.bind(this)

    login: ->
      Facebook.login()
      @once "loggedIn", @fetch.bind(this)

    fullSizeCover: ->
      @attributes["cover"].source = @get("cover").source.replace "/s720x720", ""
