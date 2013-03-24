define ["underscore", "backbone", "facebook-sdk"], (_, Backbone, FacebookSDK) ->
  class Facebook extends Backbone.Events
    BASE_URL = "https://graph.facebook.com"
    INIT_OPTIONS =
      appId: "142946932543232"
      channelURL: "/channel.html"
      status: true
      cookie: true

    @init: FacebookSDK.init.bind FacebookSDK, INIT_OPTIONS
    @getAccessToken: -> FacebookSDK.getAuthResponse()?.accessToken

    @loginStatus: (callback) ->
      _.defer FacebookSDK.getLoginStatus, (response) ->
        callback !!(response?.status is "connected")

    @login: ->
      @loginStatus (isLoggedIn) =>
        return @trigger("loggedIn") if isLoggedIn

        FacebookSDK.login (response) =>
          if response.authResponse
            @trigger("loggedIn")
          else
            @trigger("loginFailed", response.status)

    @userURL: ->
      "#{BASE_URL}/me?access_token=#{@getAccessToken()}" +
      "&fields=id,name,first_name,last_name,picture,cover"

