$ = jQuery
$.fn.extend

  fixedScrollNav: (options) ->
  
    settings =
      sections    : 'article'     # Sections
      linkType    : 'individual'  # Choose individual or group
      links       : '.nav-link'   # Navigation Links
      
      activeClass : 'active'      # Navigation link toggle class
      animated    : true
      scrollSpeed : 900

      threshold   : 100           # Update navigation x number of pixels before elements position


    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug


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



$("body").fixedScrollNav
  debug: true