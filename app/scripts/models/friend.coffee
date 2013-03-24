define ["backbone", "lib/facebook"], (Backbone, Facebook) ->
  class Friend extends Backbone.Model
    url: -> Facebook.friendURL @get("id")
