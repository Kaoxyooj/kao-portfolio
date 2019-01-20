

$.fn.isInViewport = ->
  elementTop = $(this).offset().top
  elementBottom = elementTop + $(this).outerHeight()
  viewportTop = $(window).scrollTop()
  viewportBottom = viewportTop + $(window).height()
  return elementBottom > viewportTop && elementTop < viewportBottom



$(document).ready ->
  $('.top-banner').parallax
    imageSrc: '/images/kao_self.jpg'

  #TYPED JS INITIALIZER
  options = 
    strings: [
      'SASS Aficionado',
      'Ruby on Rails Specialist',
      'JavaScript Enthusiast',
      'API Architect',
      'SQL Adept',
    ]
    typeSpeed: 30
    loop: true
    cursorChar: '_'
    
  typed = new Typed('#intro_text', options)
  #TYPED JS INITIALIZER

  #BOOSTRAP TOOLTIP TOGGLES
  $('[data-toggle="tooltip"]').tooltip()
  #BOOSTRAP TOOLTIP TOGGLES

$(document).on "scroll", ->
  aboutMe()
  projects()
      
aboutMe = -> 
  el = $("#intro")
  if el.isInViewport()
    el.addClass(animationClasses())
  else
    el.removeClass(animationClasses())

projects = ->
  el = $("#projects")
  if el.isInViewport()
    el.addClass(animationClasses())
  else
    el.removeClass(animationClasses())

animationClasses = -> "animated fadeIn slower"