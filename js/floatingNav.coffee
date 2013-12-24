$(document).ready ->

#test

floatScroll =

	vars:
		sections : '.floatScrollItem'
		links : '.floatLink'
		activeClass : 'active'
		linksClass : 'floatLink'


	init: ->
		floatScroll.click()
		floatScroll.scroll()

	click: ->	
		$("a."+floatScroll.vars.linksClass).on "click", (e) ->
			e.preventDefault()
			target = @hash
			$target = $(target)
			$("html, body").stop().animate
				scrollTop: $target.offset().top
			, 900, "swing", ->
				window.location.hash = target

	scroll: ->
		$(window).scroll ->
		  currentPosition = $(this).scrollTop()
		  $( floatScroll.vars.links ).removeClass( floatScroll.vars.activeClass )
		  $( floatScroll.vars.sections ).each ->
		    top = $(this).offset().top
		    bottom = top + $(this).height()
		    if currentPosition >= top and currentPosition <= bottom
		    	$("a[href=\"#" + @id + "\"]").addClass( floatScroll.vars.activeClass )

floatScroll.init()