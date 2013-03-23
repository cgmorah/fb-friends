define ["backbone", "facebook-sdk"], (Backbone, FB) ->
  class FacebookSession extends Backbone.Model
    INIT_OPTIONS:
      appId: "142946932543232"
      channelURL: "/channel.html"
      status: true
      cookie: true

    initialize: ->
      FB.init @INIT_OPTIONS
      FB.getLoginStatus (response) ->
        console.log response.status
