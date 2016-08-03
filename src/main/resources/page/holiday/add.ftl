<head>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/datePicker4.8/WdatePicker.js"></script>
</head>
<body>
<form action="#" method="post" id="form-holiday" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假日添加</span>
            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href=""><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="col-sm-3">
                <div class="form-group">
                    <label for="holiday_name" class="col-sm-5 control-label">节假日名称：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="holiday_name" name="holiday_name" onblur="checkHoliday_name();"><span id="holiday_nameMsg"></span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="holiday_date" class="col-sm-5 control-label">日期：</label>
                        <div class="col-sm-7">
                            <input type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});" onclick="WdatePicker();"  class="form-control" id="holiday_date" name="holiday_date" >
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading" align="center">
            <a class="btn btn-success" href="javascript:saveRow()" id="submit" disabled="disabled">提　交</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</form>

<script type="text/javascript">
    $(".panel").css("margin-bottom", "0px");
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");


    function checkHoliday_name(){
        var a = (document.getElementById("holiday_name").value).trim();
        var msg = "";
        if(!a) {
            msg = "节假日名称必须填写";
            flags[0] = false;
        }else{
            flags[0] = true;
        }
        document.getElementById("holiday_nameMsg").innerHTML = msg;
        document.getElementById("holiday_name").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function enableSubmit(bool){
        if(bool)$("#submit").removeAttr("disabled");
        else $("#submit").attr("disabled","disabled");
    }

    function enableSubmit1(bool){
        if(bool)$("#counter_guarantee_id").removeAttr("disabled");
        else $("#counter_guarantee_id").attr("disabled","disabled");
    }


    var flags = [false];
    //flags全为true时提交按钮解除禁用
    function v_submitbutton(){
        for(f in flags) if(!flags[f]) {
            enableSubmit(false);
            return;
        }
        enableSubmit(true);
    }
    function saveRow() {
        $.post('/holiday/save',$('#form-holiday').serialize(),function (data) {
            alert(data.message);location.href="/holiday/list";
        });
    };


</script>
</body>