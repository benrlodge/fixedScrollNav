(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    fixedScrollNav: function(options) {
      var log, settings;
      settings = {
        sections: 'article',
        linkType: 'individual',
        links: '.nav-link',
        activeClass: 'active',
        animated: true,
        scrollSpeed: 900,
        threshold: ''
      };
      settings = $.extend(settings, options);
      log = function(msg) {
        if (settings.debug) {
          return typeof console !== "undefined" && console !== null ? console.log(msg) : void 0;
        }
      };
      return this.each(function() {
        var click, scroll;
        (click = function() {
          return $("a" + settings.links).on("click", function(e) {
            var $target, target;
            $(this).addClass('active');
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
        return (scroll = function() {
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
      });
    }
  });

  $("body").fixedScrollNav({
    debug: true
  });

}).call(this);
