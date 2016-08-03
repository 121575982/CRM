define(function(require, exports, module){
    var jQuery = require('jquery');
    (function($){
        //时间段
        $.validator.addMethod('rangedate',function(value,element,params){
            var myreg = /^\d{4}[\-](0?[1-9]|1[012])[\-](0?[1-9]|[12][0-9]|3[01])[\s](0?[0-9]|1[012]|2[0123]):(0?[0-9]|[12345][0-9]):(0?[0-9]|[12345][0-9])[\s][\-][\s]\d{4}[\-](0?[1-9]|1[012])[\-](0?[1-9]|[12][0-9]|3[01])[\s](0?[0-9]|1[012]|2[0123]):(0?[0-9]|[12345][0-9]):(0?[0-9]|[12345][0-9])$/;
            if(!myreg.test(value))
                return false;
            return true;
        },'请输入有效的时间区间');
    })(jQuery);
    return jQuery;
})