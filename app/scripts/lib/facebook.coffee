define ["facebook-sdk"], (FacebookSDK) ->
  # Extend the Facebook SDK with a couple of covenience methods
  class Facebook extends FacebookSDK
    @BASE_URL = "https://graph.facebook.com"
    @INIT_OPTIONS =
      appId: "142946932543232"
      channelURL: "/channel.html"
      status: true
      cookie: true

    @init: FacebookSDK.init.bind FacebookSDK, @INIT_OPTIONS

    @userURL: (accessToken) -> "#{@BASE_URL}/me?access_token=#{accessToken}"
