<head>
    <title>业务类型管理</title>
    <link rel="stylesheet" type="text/css" href="/js/timepicker/css/bootstrap-datetimepicker.css"/>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/timepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/js/timepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

</head>
<body>

<form action="#" method="get" id="form-call" class="form-horizontal">
    <#--<input type="hidden" id="corpid" name="corpid" value="1005">-->
    <#--<input type="hidden" id="cmd" name="cmd" value="1">-->
    <#--<input type="hidden" id="sign" name="sign" value="call-record123">-->
    <#--<input type="hidden" id="key" name="key">-->

    <div class="col-md-5 col-md-offset-1">
        <#--<div class="form-group">-->
            <#--<label>主叫电话</label>-->
            <#--<input id="mobile" name="mobile" type="text" class="form-control" value="18663582685" placeholder="主叫电话"/>-->

        <#--</div>-->
        <#--<div class="form-group">-->
            <#--<label>客户电话</label>-->
            <#--<input id="called" name="called" type="text" class="form-control" value="15194156197" placeholder="客户电话"/>-->

        <#--</div>-->
        <#--<div class="form-group">-->
            <#--<label>业务ID</label>-->
            <#--<input id="taskid" name="taskid" type="text" class="form-control" value="1" placeholder="业务ID"/>-->

        <#--</div>-->
        <#--<div class="form-group">-->
            <#--<label>录音文件名</label>-->
            <#--<input id="file" name="file" type="text" class="form-control" value="123" placeholder="录音文件名"/>-->

        <#--</div>-->
        <div class="form-group">
            <label>请求时间</label>
            <input id="callTime" name="callTime" type="text" value="2016-03-16 10:" class="form-control date form_datetime"
                   placeholder="请求时间"/>

        </div>


        <#--<div class="input-append date datetimepicker" id="datetimepicker" data-date="12-02-2012" data-date-format="dd-mm-yyyy">-->
            <#--<input size="16" type="text" value="12-02-2012" readonly>-->
            <#--<span class="add-on"><i class="icon-th"></i></span>-->
        <#--</div>-->


        <#--<a class="btn" href="javascript:call();">提交</a>-->
    </div>

    <#--<div class="input-append date form_datetime">-->
        <#--<input size="16" type="text" value="" readonly>-->
        <#--<span class="add-on"><i class="icon-th"></i></span>-->
    <#--</div>-->





</form>
<script type="text/javascript">
    function call() {
        var key = $("#sign").val() + $("#mobile").val() + $("#callTime").val() + $("#cmd").val();
        $.post("/sys/md5", {"key": key}, function (data) {
            $("#key").val(data);
            $.post("http://115.29.151.119/callRecord.php", $("#form-call").serialize(), function (data2) {
                alert(data2)
            });
        });

    }

    $(function () {

       var dd=$('.form_datetime').datetimepicker({

        });

        alert($(dd).html());
    })

//    $(".form_datetime").datetimepicker({
//        format: "dd MM yyyy"
//    });
</script>
</body>