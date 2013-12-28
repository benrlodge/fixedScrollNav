$ = jQuery
$.fn.extend

  fixedScrollNav: (options) ->
  
    settings =
      sections    : 'article'     # Sections
      linkType    : 'individual'  # Choose individual or group
      links       : '.nav-link'   # Navigation Links
      defaultNav  : true
      nav         : ''
      activeClass : 'active'      # Navigation link toggle class
      animated    : true
      scrollSpeed : 900
      threshold   : 0            # Update navigation x number of pixels before elements position. You may need to tweak this number for the active links to work properly based on the margin and padding between your sections

    settings = $.extend settings, options


    return @each () ->

      $(settings.nav).find('a').addClass('nav-link') if settings.defaultNav is true

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


      (click = -> 

        
        $("a"+ settings.links ).on "click", (e) ->

          $(this).addClass(settings.activeClass)  #WHY IS THIS NOT WORKING?????

          e.preventDefault()
          target = @hash
          $target = $(target)
          $("html, body").stop().animate
            scrollTop: $target.offset().top - settings.threshold
          , settings.scrollSpeed, "swing", ->
            window.location.hash = target
      )()
