require ["jquery", "underscore"], ($, _) ->
  # Add the class "out" to the element and hide or remove it after
  # a transition or animation has completed, assuming .out starts
  # one.
  $.fn.animateOut = ( ->
    end = "webkitTransitionEnd oTransitionEnd MSTransitionEnd transitionend
           webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend"

    animateOut = (el, remove, callback) ->
      if $.isFunction(remove)
        callback = remove
        remove = false

      method = if remove then "remove" else "hide"
      unless Modernizr.csstransitions
        el[method]()
        _.defer(callback) if callback

      el.addClass "out"
      el.one end, =>
        el[method]()
        callback?()

    (remove, callback) ->
      @each -> animateOut $(this), remove, callback
  )()
