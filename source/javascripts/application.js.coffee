$.fn.isInViewport = ->
  elementTop = $(this).offset().top
  elementBottom = elementTop + $(this).outerHeight()
  viewportTop = $(window).scrollTop()
  viewportBottom = viewportTop + $(window).height()
  return elementBottom > viewportTop && elementTop < viewportBottom

$.fn.exist = -> return $(this).length > 0

animationClasses = -> "animated fadeIn slower"

$(document).ready ->
  #BOOSTRAP TOOLTIP TOGGLES
  $('[data-toggle="tooltip"]').tooltip()
  #BOOSTRAP TOOLTIP TOGGLES

  #RIPPLE EFFECT
  # if $(".ripple").exist()
  #   $(".ripple").ripples
  #     imageUrl: "/images/projects/wva/wva_devices.jpg"
  #RIPPLE EFFECT
      
  #PARALLAX EFFECT
  if $('.top-banner').exist()
    $('.top-banner').parallax
      imageSrc: '/images/kao_self.jpg'
  #PARALLAX EFFECT

  #TYPED JS INITIALIZER
  if $("#intro_text").exist()
    options = 
      strings: [
        'SASS Aficionado.',
        'Ruby on Rails Specialist.',
        'JavaScript Enthusiast.',
        'API Architect.',
        'SQL Adept.',
        'Keeping it simple.'
      ]
      typeSpeed: 30
      loop: true
      cursorChar: '_'
      
    typed = new Typed('#intro_text', options)
  #TYPED JS INITIALIZER

$(document).on "scroll", ->
  el_ids = ["intro", "projects"]
  for id in el_ids
    el = $("##{id}")
    return unless el.exist()  
    if el.isInViewport() then el.addClass(animationClasses()) else el.removeClass(animationClasses())