

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
      'Ruby on Rails Specialist',
      'JavaScript Enthusiast',
      'SASS Aficionado',
      'API Architect',
      'SQL Nerd',
      ''
    ]
    typeSpeed: 30
    loop: true
    cursorChar: '_'
    
  typed = new Typed('#intro_text', options)
  #TYPED JS INITIALIZER

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