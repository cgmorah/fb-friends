define ["backbone", "lib/facebook"], (Backbone, Facebook) ->
  class FacebookSession extends Backbone.Model
    initialize: ->
      Facebook.init()

    # Login to Facebook. Triggers "loggedIn" if successfull,
    # else "loginFailed" with a status parameter.
    login: ->
      @loginStatus (isLoggedIn) =>
        return @trigger("loggedIn") if isLoggedIn

        Facebook.login (response) =>
          if response.authResponse
            @trigger("loggedIn")
          else
            @trigger("loginFailed", response.status)

    # Check if the user is logged in, calls
    # the callback with either true or false.
    loginStatus: (callback) ->
      Facebook.getLoginStatus (response) =>
        callback !!(response?.status is "connected")

    userURL: -> Facebook.userURL @getAccessToken()
    getAccessToken: -> Facebook.getAuthResponse()?.accessToken

