require [
  "jquery"
  "underscore"
  "mousewheel"
  "jscrollpane"]
, ($, _, mouseWheel, jScrollPane) ->
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
      unless Modernizr.csstransitions and Modernizr.cssanimations
        el[method]()
        _.defer(callback) if callback
        return

      el.addClass "out"
      el.one end, =>
        return unless el.hasClass "out"
        el[method]()
        el.removeClass "out"
        callback?()

    (remove, callback) ->
      @each -> animateOut $(this), remove, callback
  )()
