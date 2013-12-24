$ = jQuery
$.fn.extend

  floatNav: (options) ->
  
    settings =
      sections    : 'article'     # Sections
      linkType    : 'individual'  # Choose individual or group
      links       : '.nav-link'   # Navigation Links
      
      activeClass : 'active'      # Navigation link toggle class
      animated    : true
      scrollSpeed : 900



    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug


    if settings.linkType is 'individual'
      log 'do indiv'
    if settings.linkType is 'group'
      log 'do group'


    return @each () ->
    
      (click = -> 
        $("a"+ settings.links ).on "click", (e) ->
          $(this).addClass('active')
          e.preventDefault()
          target = @hash
          $target = $(target)
          $("html, body").stop().animate
            scrollTop: $target.offset().top
          , settings.scrollSpeed, "swing", ->
            window.location.hash = target
      )()

      (scroll = ->
        $(window).scroll ->
          currentPosition = $(this).scrollTop()
          $( settings.links ).removeClass( settings.activeClass )
          $( settings.sections ).each ->
            top = $(this).offset().top
            bottom = top + $(this).height()
            if currentPosition >= top and currentPosition <= bottom
              $("a[href=\"#" + @id + "\"]").addClass( settings.activeClass )
      )()



$("body").floatNav
  debug: true