$.fn.isInViewport = ->
  elementTop = $(this).offset().top
  elementBottom = elementTop + $(this).outerHeight()
  viewportTop = $(window).scrollTop()
  viewportBottom = viewportTop + $(window).height()
  return elementBottom > viewportTop && elementTop < viewportBottom

$(document).ready ->
  console.log "READY"
  $('.top-banner').parallax imageSrc: '/images/kao_self.jpg'

$(document).on "scroll", ->
  aboutMe()
  projects()
      
aboutMe = -> 
  if $("#intro").isInViewport()
    $("#intro").addClass(animationClasses())

projects = ->
  if $("#projects").isInViewport()
    $("#projects").addClass(animationClasses())

animationClasses = -> "animated fadeIn slower"