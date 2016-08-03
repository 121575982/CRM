define(function (require, exports, module) {
    var $ = require('jquery');
    require('select');
    require('./softphone/globalVariable.js');

    exports.getQueryString = function (url) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        if (!url || url == ""){
            url = window.location.search;
        }else{
            url = url.substring(url.indexOf("?"));
        }
        r = url.substr(1).match(reg)
        if (r != null) return unescape(r[2]);
        return null;
    }
    /**
     * 将数据字典转为下拉框
     * @param key 键
     * @param id 需要转换的<select> id
     * @param value 选中值
     */
    exports.dictSelect = function(key, id, value){
        $.get('/dictSelect?key='+key, function (data) {
            $('#'+id).select2({
                data: data,
                minimumResultsForSearch: Infinity
            });
            $("#"+id).val(value).trigger("change");
        });
    }

    /**
     * 显示提示消息
     * @param type success:成功，error:错误， warn:警告
     * @param message 消息内容
     */
    exports.showMsg = function(type, message){
        var className;
        if(type  == "success"){
            className = "alert-success";
        }else if(type == "error"){
            className = "alert-danger";
        }else if(type == "warn"){
            className = "alert-warning";
        }
        if($("#msgDiv").find("div").length == 0){
            var boxBody = '<div id="msgBox" class="alert '+ className +'"><a href="#" class="close" data-dismiss="alert" style="text-decoration: none;">x</a><span id="msgContent"></span></div>';
            $("#msgDiv").append(boxBody);
        }else{
            $("#msgBox").removeClass().addClass("alert " + className);
        }
        $("#msgContent").text(message);
    }

    /**
     * 使用json数据填充form
     * @param formId 被填充form的id
     * @param data 用于填充的json数据
     * @param iframeId 如果form是在iframe中的，需要制定iframe的id
     */
    exports.fillForm = function (formId, data, iframeId) {
        var jsonObj = data;
        if(typeof data === 'string'){
            jsonObj = $.parseJSON(data);
        }
        for(var key in jsonObj){
            var objType = this.getJsonType(jsonObj[key]);
            if(objType === "array"){
                var obj = jsonObj[key];
                for(var arrKey in obj){
                    var arrObj = obj[arrKey];
                    for(var lastKey in arrObj){
                        this.setCheckBox(key, arrObj[lastKey])
                    }
                }
            }else if(objType === 'object'){

            }else if(objType === 'string'){
                var str = jsonObj[key];
                var tagObjs = $('[name="'+key+'"]',$("#"+formId));
                if($(tagObjs[0]).attr("type") == 'radio'){
                    $.each(tagObjs, function (keyObj, value) {
                        if($(value).attr("value") == jsonObj[key]){
                            value.checked = true;
                        }
                    });
                    continue;
                }
                if(jsonObj[key] != "null"){
                    $('[name="'+key+'"]', $("#"+formId)).val(jsonObj[key]);
                }
            }else{
                if(jsonObj[key] != "null"){
                    $('[name="'+key+'"]', $("#"+formId)).val(jsonObj[key]+"abc");
                }
            }
        }
    }

    /**
     * 获取obj的类型
     * @param obj
     * @returns {string}
     */
    exports.getJsonType = function (obj) {
        if(typeof obj === "object"){
            var tempStr = JSON.stringify(obj);
            if(tempStr[0] == '{' && tempStr[tempStr.length - 1] == '}'){
                return "class";
            }
            if(tempStr[0] == '{' && tempStr[tempStr.length - 1] == '}'){
                return "array";
            }
        }
        return typeof obj;
    }

    /**
     * 填充form中的checkbox
     * @param name checkbox的name
     * @param json 所要填充的数据
     */
    exports.fillCheckBox = function (name, json) {
        var jsonObj = json;
        if(typeof json === 'string'){
            jsonObj = $.parseJSON(json);
        }
        var str = jsonObj[name];
        if(typeof str === 'string'){
            var array = str.split(",");
            $.each(array, function (key, value) {
                this.setCheckBox(name, value);
            });
        }
    }

    /**
     * 填充数据时将checkbox置为选中状态
     * @param name checkbox的name
     * @param value checkbox的值
     */
    exports.setCheckBox = function (name, value) {
        $('[name="'+name+'"][value="'+value+'"]').attr("checked", true);
    }

    exports.htmlEncode = function (objVal) {
        var str = objVal+"";
        if(str == '')
        {
            return str;
        }
        str = str.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(new RegExp("\"","g"),"&quot;").replace(new RegExp("\'","g"),"&#39;").replace(new RegExp("  ","g")," &nbsp;");
        return str;
    }

    exports.saveLog = function(state) {
        $.post("/savelog/" + window.parent.current_agentId + "/" + state, function (data) {
        });
    }

    exports.setBtn = function (btn) {
        var btns = new Array('BtnLogin', 'BtnLogou', 'BtnAnswe', 'BtnHandU', 'BtnSayFr', 'BtnSayBu',
            'BtnCallO', 'BtnHold', 'BtnGetHo', 'ToAgent', 'InnerCal', 'InnerHP',
            'BtnTsfEx', 'OutHelp', 'agentg', 'mail', 'BtnTrans', 'ToSkill', 'BtnGetZ', 'BtnTsfAu', 'BtnInnerConf', 'BtnConfJoin', 'BtnConference');
        for (var i = 0; i < btns.length; i++) {
            $("#" + btns[i]).attr("disabled", true);
            $("#" + btns[i]).attr("class", "btn btn-default");
            if (btns != null) {
                for (var j = 0; j < btn.length; j++) {
                    if (btn[j] == btns[i]) {
                        $("#" + btns[i]).attr("disabled", false);
                        $("#" + btns[i]).attr("class", "btn btn-success");
                    }
                }
            }
        }
    }

    exports.bZeio = function (n) {
        if (n < 10) {
            return "0" + n;
        } else {
            return n;
        }
    }

    /*
     * 停止计时
     */
    exports.stopClock = function (name) {
        try {
            window.clearInterval(global_timer_id);
        }
        catch (e) {
            document.getElementById(name).innerHTML = "";
        }
        if ("restTimer" == name) {
            document.getElementById(name).innerHTML = "";
        }
        if ("agentTimer" == name) {
            document.getElementById(name).innerHTML = "";
        }
    }

    /**
     * 打印日志
     * @param info
     */
    function log (info) {
        console.log(info);
    }

    exports.log = log;

    /**
     * 数组去重
     * @param arry
     * @returns {Array}
     */
    exports.uniqueArray = function (arry) {
        var result = [], hash = {};
        if(null != arry && arry.length > 0) {
            for(var i = 0, elem; (elem = arry[i]) != null; i++){
                if(!hash[elem]){
                    result.push(elem);
                    hash[elem] = true;
                }
            }
        }
        return result;
    }

    /**
     * 求差集
     * @param array1
     * @param array2
     * @returns {*}
     */
    exports.minusArray = function (array1, array2) {
        return this.uniqueArray(array1).each(function (a) {
            return array2.contains(a) ? a :null;
        });
    }

    /**
     * 判断数组中是否有某个元素
     * @param arr
     * @param str
     * @returns {number}
     */
    function indexOfArray(arr, str) {
        for(var i = 0; i < arr.length; i++){
            if(arr[i] == str){
                return i;
            }
        }
        return -1;
    }

    exports.indexOfArray = indexOfArray;


    /**
     * 删除数组中的某个元素
     * @param arr
     * @param str
     */
    function removeFromArray(arr, str) {
        var index = indexOfArray(arr, str);
        if(index > -1){
            this.splice(index,1);
        }
    }

    exports.removeFromArray = removeFromArray;

    /**
     * 获取字符串长度，英文一个字符，中文两个
     * @param str
     * @returns {number}
     */
    exports.getStrLength = function (str) {
        var realLength = 0,
            len = str.length,
            charCode = -1;
        for(var i = 0; i < len; i++){
            charCode = str.charCodeAt(i);
            if(charCode >= 0 && charCode <= 128){
                realLength += 1;
            }else{
                realLength += 2;
            }
        }
        return realLength;
    }

    /**
     * 按长度截取字符串，将同一个字符串截为长度为len的n断
     * @param str 需要截取的字符串
     * @param len 截取长度
     * @returns {Array}
     */
    exports.cutStr = function (str, len) {
        var strArray = new Array(),
            tempStr = new String();
        var totalLen = this.getStrLength(str);
        var times = totalLen % len == 0 ? totalLen / len : Math.ceil(totalLen / len);
        var count = 0;
        var length = 0;
        if(totalLen < len){
            strArray.push(str);
            return strArray;
        }

        for(var i = 0; i< str.length; i++){
            if(count == times - 1){
                strArray.push(str.substring(i, str.length));
                break;
            }
            var s = str.charAt(i);
            length++;
            if(escape(s).length > 4){
                length++;
            }
            tempStr = tempStr.concat(s);
            if(length >= len){
                strArray.push(tempStr);
                count ++;
                tempStr = "";
                length = 0;
            }
        }
        return strArray;
    }

    /**
     * 获取系统当前时间
     * @returns {string}
     */
    exports.getNowDateTime = function () {
        var date = new Date();
        var dateStr = "";
        var dayStr = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var minuteStr = date.getMinutes() < 10 ? "0"+date.getMinutes():date.getMinutes();
        var secondStr = date.getSeconds() < 10 ? "0"+date.getSeconds():date.getSeconds();
        var monthStr = date.getMonth() + 1 < 10 ? "0"+(date.getMonth() + 1):date.getMonth() + 1;
        dateStr += date.getFullYear() + "-";
        dateStr += monthStr + "-";
        dateStr += dayStr + " ";
        dateStr += date.getHours() + ":";
        dateStr += minuteStr + ":";
        dateStr += secondStr;
        return dateStr;
    }

    /**
     * 获取long型日期
     * @param dateStr
     * @returns {number}
     */
    function getLongDate(dateStr){
        return new Date(dateStr.replace(new RegExp("-", "gm"), "/")).getTime();
    }

    exports.getlongDate = getLongDate;

    exports.convertCurrency = function convertCurrency(currencyDigits) {
        var MAXIMUM_NUMBER = 99999999999.99;  //最大值
        // 定义转移字符
        var CN_ZERO = "零";
        var CN_ONE = "壹";
        var CN_TWO = "贰";
        var CN_THREE = "叁";
        var CN_FOUR = "肆";
        var CN_FIVE = "伍";
        var CN_SIX = "陆";
        var CN_SEVEN = "柒";
        var CN_EIGHT = "捌";
        var CN_NINE = "玖";
        var CN_TEN = "拾";
        var CN_HUNDRED = "佰";
        var CN_THOUSAND = "仟";
        var CN_TEN_THOUSAND = "万";
        var CN_HUNDRED_MILLION = "亿";
        var CN_DOLLAR = "元";
        var CN_TEN_CENT = "角";
        var CN_CENT = "分";
        var CN_INTEGER = "整";

        // 初始化验证:
        var integral, decimal, outputCharacters, parts;
        var digits, radices, bigRadices, decimals;
        var zeroCount;
        var i, p, d;
        var quotient, modulus;

        // 验证输入字符串是否合法
        if (currencyDigits.toString() == "") {
            $("#tranAmtdx").val("");
            //$("#tranAmt").focus();
            return;
        }
        //if (!currencyDigits.match(/[^,.\d]/)) {
        //    alert("请输入有效数字");
        //    $("#Digits").focus();
        //    return;
        //}

        //判断是否输入有效的数字格式
        //var reg = /^((\d{1,3}(,\d{3})*(.((\d{3},)*\d{1,3}))?)|(\d+(.\d+)?))$/;
        //if (!reg.test(currencyDigits)) {
        //    alert("请输入有效格式数字");
        //    $("#Digits").focus();
        //    return;
        //
        //}

        currencyDigits = currencyDigits.replace(/,/g, "");
        currencyDigits = currencyDigits.replace(/^0+/, "");
        //判断输入的数字是否大于定义的数值
        if (Number(currencyDigits) > MAXIMUM_NUMBER) {
            alert("您输入的数字太大了");
            $("#Digits").focus();
            return;
        }

        parts = currencyDigits.split(".");
        if (parts.length > 1) {
            integral = parts[0];
            decimal = parts[1];
            decimal = decimal.substr(0, 2);
        }
        else {
            integral = parts[0];
            decimal = "";
        }
        // 实例化字符大写人民币汉字对应的数字
        digits = new Array(CN_ZERO, CN_ONE, CN_TWO, CN_THREE, CN_FOUR, CN_FIVE, CN_SIX, CN_SEVEN, CN_EIGHT, CN_NINE);
        radices = new Array("", CN_TEN, CN_HUNDRED, CN_THOUSAND);
        bigRadices = new Array("", CN_TEN_THOUSAND, CN_HUNDRED_MILLION);
        decimals = new Array(CN_TEN_CENT, CN_CENT);

        outputCharacters = "";
        //大于零处理逻辑
        if (Number(integral) > 0) {
            zeroCount = 0;
            for (i = 0; i < integral.length; i++) {
                p = integral.length - i - 1;
                d = integral.substr(i, 1);
                quotient = p / 4;
                modulus = p % 4;
                if (d == "0") {
                    zeroCount++;
                }
                else {
                    if (zeroCount > 0) {
                        outputCharacters += digits[0];
                    }
                    zeroCount = 0;
                    outputCharacters += digits[Number(d)] + radices[modulus];
                }
                if (modulus == 0 && zeroCount < 4) {
                    outputCharacters += bigRadices[quotient];
                }
            }
            outputCharacters += CN_DOLLAR;
        }
        // 包含小数部分处理逻辑
        if (decimal != "") {
            for (i = 0; i < decimal.length; i++) {
                d = decimal.substr(i, 1);
                if (d != "0") {
                    outputCharacters += digits[Number(d)] + decimals[i];
                }
            }
        }
        //确认并返回最终的输出字符串
        if (outputCharacters == "") {
            outputCharacters = CN_ZERO + CN_DOLLAR;
        }
        if (decimal == "") {
            outputCharacters += CN_INTEGER;
        }

        //返回人民币大写
        return outputCharacters;
        //$("#getCapital").val(outputCharacters);
    }

    /**
     * 根据数据字典的key和subKey翻译
     * @param key
     * @param subKey
     */
    function translateDict (key, subKey) {
        log("数据字典翻译：key = " + key + ", subKey = " + subKey)
        $.ajax({
            url : "/dictionary/getByKey?key="+key+"&subKey="+subKey,
            type : "get",
            async : false,
            datatype : "json",
            success : function (data) {
                log("数据字典翻译结果：" + data);
                return data;
            },
            error : function () {
                log("数据字典翻译发生错误");
                return subKey;
            }
        });
    }

    exports.translateDict = translateDict;

    /**
     * 计算两个日期相差天数
     * 2015-11-10     2015-11-12
     * @param startDate
     * @param endDate
     * @returns {Number|*}
     */
    function getDays(startDate,endDate){
        if(startDate==""||endDate==""){
            return 0;
        }else{
            var strSeparator="-";//日期分割符
            var date1;
            var date2;
            var iDays;
            //截取  如：20151112
            date1=startDate.split(strSeparator);
            date2=endDate.split(strSeparator);
            //把时间字符串转换成毫秒
            var strDateS = new Date(date1[0],date1[1]-1,date1[2]);
            var strDateE = new Date(date2[0],date2[1]-1,date2[2]);
            //把相差的毫秒转换成天
            iDays=parseInt(Math.abs(strDateS-strDateE)/1000/60/60/24);
            return iDays;
        }
    }

    exports.getDays = getDays;
});
