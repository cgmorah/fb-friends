require.config
  shim: {
    handlebars: exports: "Handlebars"
  }
  paths:
    # RequireJS plugins
    text: "../components/text/text"

    # Third party libraries
    jquery: "../components/jquery/jquery"
    handlebars: "../components/handlebars/handlebars"
    backbone: "../components/backbone-amd/backbone"
    underscore: "../components/underscore-amd/underscore"

require [], ->
  console.log "Hello World!"
