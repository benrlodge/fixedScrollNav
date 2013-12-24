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

      threshold   : ''           # Update navigation x number of pixels before elements position. You may need to tweak this number for the active links to work properly based on the margin and padding between your sections


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
          $( settings.links ).removeClass( settings.activeClass )
        
          currentPosition = $(this).scrollTop()
        
          $( settings.sections ).each ->
            top = $(this).offset().top - Number(settings.threshold) - Number(1)
            bottom = top + $(this).height()
            if currentPosition >= top and currentPosition <= bottom
              $("a[href=\"#" + @id + "\"]").addClass( settings.activeClass )
      )()


