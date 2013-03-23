require ["jquery", "underscore"], ($, _) ->
  # Add the class "out" to the element and hide or remove it after
  # a transition or animation has completed, assuming .out starts
  # one.
  $.fn.animateOut = ( ->

    transitionEnd = {
      "WebkitTransition" : "webkitTransitionEnd"
      "MozTransition"    : "transitionend"
      "OTransition"      : "oTransitionEnd"
      "msTransition"     : "MSTransitionEnd"
      "transition"       : "transitionend"
    }[Modernizr.prefixed "transition"]

    animationEnd = transitionEnd.replace /transition/i, (match) ->
      "#{if match[0] is "t" then "a" else "A"}nimation"

    end = "#{transitionEnd}.animateOut #{animationEnd}.animateOut"

    animateOut = (el, remove, callback) ->
      if $.isFunction(remove)
        callback = remove
        remove = false

      method = if remove then "remove" else "hide"
      unless Modernizr.csstransitions
        el[method]()
        _.defer(callback) if callback

      el.addClass "out"
      el.on end, =>
        el.off end
        el[method]()
        callback?()

    (remove, callback) ->
      @each -> animateOut $(this), remove, callback
  )()
