(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    fixedScrollNav: function(options) {
      var settings;
      settings = {
        sections: 'article',
        linkType: 'individual',
        links: '.nav-link',
        defaultNav: true,
        nav: '',
        activeClass: 'active',
        animated: true,
        scrollSpeed: 900,
        threshold: 0
      };
      settings = $.extend(settings, options);
      return this.each(function() {
        var click, scroll;
        if (settings.defaultNav === true) {
          $(settings.nav).find('a').addClass('nav-link');
        }
        (scroll = function() {
          return $(window).scroll(function() {
            var currentPosition;
            $(settings.links).removeClass(settings.activeClass);
            currentPosition = $(this).scrollTop();
            return $(settings.sections).each(function() {
              var bottom, top;
              top = $(this).offset().top - Number(settings.threshold) - Number(1);
              bottom = top + $(this).height();
              if (currentPosition >= top && currentPosition <= bottom) {
                return $("a[href=\"#" + this.id + "\"]").addClass(settings.activeClass);
              }
            });
          });
        })();
        return (click = function() {
          return $("a" + settings.links).on("click", function(e) {
            var $target, target;
            $(this).addClass('.' + settings.activeClass);
            e.preventDefault();
            target = this.hash;
            $target = $(target);
            return $("html, body").stop().animate({
              scrollTop: $target.offset().top
            }, settings.scrollSpeed, "swing", function() {
              return window.location.hash = target;
            });
          });
        })();
      });
    }
  });

}).call(this);
