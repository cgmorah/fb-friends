# Function.bind polyfill from https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Function/bind#Compatibility
# Translated to CoffeeScript through http://js2coffee.org/, some syntactical weirdness might apply.
unless Function::bind
  Function::bind = (oThis) ->

    # closest thing possible to the ECMAScript 5 internal IsCallable function
    throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable")  if typeof this isnt "function"
    aArgs = Array::slice.call(arguments_, 1)
    fToBind = this
    fNOP = ->

    fBound = ->
      fToBind.apply (if this instanceof fNOP and oThis then this else oThis), aArgs.concat(Array::slice.call(arguments_))

    fNOP:: = @::
    fBound:: = new fNOP()
    fBound
