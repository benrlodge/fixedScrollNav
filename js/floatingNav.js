(function() {
  var floatScroll;

  $(document).ready(function() {});

  floatScroll = {
    vars: {
      sections: '.floatScrollItem',
      links: '.floatLink',
      activeClass: 'active'
    },
    init: function() {
      floatScroll.click();
      return floatScroll.scroll();
    },
    click: function() {
      return $("a.floatScroll").on("click", function(e) {
        var $target, target;
        e.preventDefault();
        target = this.hash;
        $target = $(target);
        return $("html, body").stop().animate({
          scrollTop: $target.offset().top
        }, 900, "swing", function() {
          return window.location.hash = target;
        });
      });
    },
    scroll: function() {
      return $(window).scroll(function() {
        var currentPosition;
        currentPosition = $(this).scrollTop();
        $(floatScroll.vars.links).removeClass(floatScroll.vars.activeClass);
        return $(floatScroll.vars.sections).each(function() {
          var bottom, top;
          top = $(this).offset().top;
          bottom = top + $(this).height();
          if (currentPosition >= top && currentPosition <= bottom) {
            return $("a[href=\"#" + this.id + "\"]").addClass(floatScroll.vars.activeClass);
          }
        });
      });
    }
  };

  floatScroll.init();

}).call(this);
