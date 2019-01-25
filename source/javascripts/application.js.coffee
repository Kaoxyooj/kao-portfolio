bodyBgToggle = ->  
  if $(".top-banner").exist()
    $(".top-banner").css("background-color", "transparent")
    $("body").css("background", "unset")

$.fn.isInViewport = ->
  elementTop = $(this).offset().top
  elementBottom = elementTop + $(this).outerHeight()
  viewportTop = $(window).scrollTop()
  viewportBottom = viewportTop + $(window).height()
  return elementBottom > viewportTop && elementTop < viewportBottom

$.fn.exist = -> return $(this).length > 0

animationClasses = -> "animated fadeIn slower"


$(document).ready ->

  if $('#intro').exist()
    distance = $('#intro').offset().top
    $window = $(window)
    $window.scroll ->
      if $window.scrollTop() >= distance
        $("#top-nav a").css("color", "black")
      else
        $("#top-nav a").css("color", "white")
      return

  # SMOOTH SCROLLER
  $('a[href^=\'#\']').click (e) ->
    e.preventDefault()
    position = $($(this).attr('href')).offset().top
    $('body, html').animate scrollTop: position
    , 1000
    return
  # SMOOTH SCROLLER

  if $(".sidenavbarleft").exist()
    $("body").css("background", "white")
  
  setTimeout ->
    bodyBgToggle()
  , 2000

  #ANIMATE SIDEBAR
  $(document).on "click", ".sidebar-back", ->
    $(".sidenavbarleft").addClass("animate-sidebar")
    setTimeout ->
      window.location.replace("/")
    , 500 
  #ANIMATE SIDEBAR

  #BOOSTRAP TOOLTIP TOGGLES
  $('[data-toggle="tooltip"]').tooltip()
  #BOOSTRAP TOOLTIP TOGGLES

  #RIPPLE EFFECT
  # if $(".wva-landing").exist()
  #   $(".wva-landing").ripples
  #     imageUrl: "/images/projects/wva/wva2.png"
  #RIPPLE EFFECT
      
  #PARALLAX EFFECT
  if $('.top-banner').exist()
    $('.top-banner').parallax
      imageSrc: '/images/kao_self.jpg'

  if $(".stock-img").exist()
    $(".stock-img").parallax
      imageSrc: '/images/stock/stock6.jpg'
  #PARALLAX EFFECT

  #TYPED JS INITIALIZER
  if $("#intro_text").exist()
    setTimeout ->
      options = 
        strings: [
          'SASS Aficionado.',
          'Ruby on Rails Specialist.',
          'JavaScript Enthusiast.',
          'API Architect.',
          'SQL Adept.',
        ]
        typeSpeed: 40
        loop: true
        cursorChar: '_'
      typed = new Typed('#intro_text', options)
    , 2000

  if $("#hello").exist()
    options = 
      strings: [
        "Hi, ",
        "Hi, I'm Kao"
      ]
      typeSpeed: 50
      loop: false
      cursorChar: ''
    typed = new Typed('#hello', options)

  #TYPED JS INITIALIZER

$(document).on "scroll", ->
  bodyBgToggle()

  el_ids = ["intro", "projects"]
  for id in el_ids
    el = $("##{id}")
    return unless el.exist()  
    if el.isInViewport() then el.addClass(animationClasses()) else el.removeClass(animationClasses())