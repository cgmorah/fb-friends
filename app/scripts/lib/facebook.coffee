define ["underscore", "facebook-sdk"], (_, FacebookSDK) ->
  # Extend the Facebook SDK with a couple of covenience methods
  class Facebook extends FacebookSDK
    @BASE_URL = "https://graph.facebook.com"
    @INIT_OPTIONS =
      appId: "142946932543232"
      channelURL: "/channel.html"
      status: true
      cookie: true

    @init: FacebookSDK.init.bind FacebookSDK, @INIT_OPTIONS

    @userURL: (accessToken) ->
      "#{@BASE_URL}/me?access_token=#{accessToken}" +
      "&fields=id,name,first_name,last_name,picture,cover"

    @getLoginStatus: _.defer.bind(_, FacebookSDK.getLoginStatus.bind(FacebookSDK))
