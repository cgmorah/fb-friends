define ["backbone", "lib/facebook"], (Backbone, Facebook) ->
  class User extends Backbone.Model
    initialize: ({app}) ->
      @app = app
      Facebook.init()
      Facebook.on "loggedIn", @trigger.bind(this, "loggedIn")
      @on "change:cover", @fullSizeCover.bind(this)

    sync: (method, model, options) ->
      unless method is "read"
        Backbone.Model.prototype.sync(method, model, options)

      Facebook.getUser (response) ->
        if response.error
          options?.error?(response)
        else
          options?.success?(model, response, options)
        true

    login: ->
      Facebook.login()
      @once "loggedIn", @fetch.bind(this)

    fullSizeCover: ->
      @attributes["cover"].source = @get("cover").source.replace "/s720x720", ""
