require.config
  shim: {
    handlebars: exports: "Handlebars"
    "facebook-sdk": exports: "FB"
  }
  paths:
    # RequireJS plugins
    text: "../components/text/text"

    # Third party libraries
    jquery: "../components/jquery/jquery"
    handlebars: "../components/handlebars/handlebars"
    backbone: "../components/backbone-amd/backbone"
    underscore: "../components/underscore-amd/underscore"

    # Third party libraries (external)
    "facebook-sdk": "//connect.facebook.net/en_US/all"

require ["views/app"], (AppView) ->
  new AppView
