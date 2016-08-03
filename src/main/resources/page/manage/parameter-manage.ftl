<head>
    <title>业务类型管理</title>
    <link rel="stylesheet" type="text/css" href="/js/datetimepicker/css/bootstrap-datetimepicker.css"/>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <#--<script type="text/javascript" src="/js/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>-->

</head>
<body>

<form action="#" method="get" id="form-call" class="form-horizontal">
    <#--<input type="hidden" id="corpid" name="corpid" value="1005">-->
    <#--<input type="hidden" id="cmd" name="cmd" value="1">-->
    <#--<input type="hidden" id="sign" name="sign" value="call-record123">-->
    <#--<input type="hidden" id="key" name="key">-->

    <div class="col-md-3 col-md-offset-1">
        <div class="form-group">
            <label>主叫电话</label>
            <input id="mobile" name="mobile" type="text" class="form-control" value="18663582685" placeholder="主叫电话"/>

        </div>
        <div class="form-group">
            <label>客户电话</label>
            <input id="called" name="called" type="text" class="form-control" value="15194156197" placeholder="客户电话"/>

        </div>
        <div class="form-group">
            <label>业务ID</label>
            <input id="taskid" name="taskid" type="text" class="form-control" value="1" placeholder="业务ID"/>

        </div>
        <div class="form-group">
            <label>录音文件名</label>
            <input id="file" name="file" type="text" class="form-control" value="123" placeholder="录音文件名"/>

        </div>
        <div class="form-group">
            <label>请求时间</label>
            <input id="callTime" name="callTime" type="text" class="form-control date form_datetime"
                   placeholder="请求时间"/>

        </div>



        <a class="btn" href="javascript:call();">提交</a>
    </div>







</form>
<script type="text/javascript">
    function call() {
        $("#callTime").val(getNowFormatDate());
        var key = $("#sign").val() + $("#mobile").val() + $("#callTime").val() + $("#cmd").val();
        $.post("/sys/md5", {"key": key}, function (data) {
            $("#key").val(data);
            $.post("http://115.29.151.119/callRecord.php", $("#form-call").serialize(), function (data2) {
                alert(data2)
            });
        });

    }

    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        var strHour=date.getHours();
        var strMinute=date.getMinutes();
        var strSecond=date.getSeconds();
        if (month <= 9) {
            month = "0" + month;
        }
        if (strDate <= 9) {
            strDate = "0" + strDate;
        }
        if(strHour<=9){
            strHour="0"+strHour;
        }
        if(strMinute<=9){
            strMinute="0"+strMinute;
        }
        if(strSecond<=9){
            strSecond="0"+strSecond;
        }


        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + strHour + seperator2 + strMinute
                + seperator2 + strSecond;
        return currentdate;
    }

    $(function () {


        $('.form_datetime').datetimepicker({
            locale: 'zh-CN',
            format: "YYYY-MM-DD HH:mm:ss",
            sideBySide: true
        });
        $("#callTime").val(getNowFormatDate());


    })

//    $(".form_datetime").datetimepicker({
//        format: "dd MM yyyy"
//    });
</script>
</body>