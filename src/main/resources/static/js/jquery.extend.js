define(function (require, exports, module) {
    var jQuery = require('jquery');

    (function ($) {
        $.extend({
            browser: {
                msie: /msie/.test(navigator.userAgent.toLowerCase())
            }
        });
    })(jQuery);

    return jQuery;
});