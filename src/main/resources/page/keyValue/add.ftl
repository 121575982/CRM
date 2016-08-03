<head>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/datePicker4.8/WdatePicker.js"></script>
</head>
<body>
<form action="#" method="post" id="form-holiday" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统字典值添加</span>
            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href=""><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="col-sm-3">
                <div class="form-group">
                    <label for="group_id" class="col-sm-5 control-label">添加位置：</label>
                    <div class="col-sm-7">
                        <select  class="form-control"  id="group_id" name="group_id" >
                            <option >--请选择添加位置--</option>
                            <option value="">--创建新分类--</option>
                        <#list listInfo as being>
                            <option value=${being.id}>${being.key_name}</option>
                        </#list>
                        </select>
                    </div>
                </div>
            </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="key_name" class="col-sm-5 control-label">关键字名称：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="key_name" name="key_name" onblur="checkKey_name();"><span id="key_nameMsg"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body collapse in">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="key_word" class="col-sm-5 control-label">关键字：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="key_word" name="key_word" onblur="checkKey_word();"><span id="key_wordMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="key_value" class="col-sm-5 control-label">数值：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="key_value" name="key_value" onblur="checkKey_value();"><span id="key_valueMsg"></span>
                        </div>
                    </div>
                </div>
             </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="remark" class="col-sm-1 control-label">备注：</label>
                        <div class="col-sm-11">
                            <textarea class="form-control" id="remark" name="remark" placeholder="请输入项目描述"></textarea>
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



    function checkKey_name(){
        var a = (document.getElementById("key_name").value).trim();
        var msg = "";
        if(!a) {
            msg = "必须填写";
            flags[0] = false;
        }else{
            flags[0] = true;
        }
        document.getElementById("key_nameMsg").innerHTML = msg;
        document.getElementById("key_name").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function checkKey_word(){
        var a = (document.getElementById("key_word").value).trim();
        var msg = "";
        if(!a) {
            msg = "必须填写";
            flags[1] = false;
        }else{
            flags[1] = true;
        }
        document.getElementById("key_wordMsg").innerHTML = msg;
        document.getElementById("key_word").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }
    function checkKey_value(){
        var a = (document.getElementById("key_value").value).trim();
        var msg = "";
        if(!a) {
            msg = "必须填写";
            flags[2] = false;
        }else{
            flags[2] = true;
        }
        document.getElementById("key_valueMsg").innerHTML = msg;
        document.getElementById("key_value").parentNode.parentNode.style.color=msg==""?"black":"red";
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


    var flags = [false,false,false];
    //flags全为true时提交按钮解除禁用
    function v_submitbutton(){
        for(f in flags) if(!flags[f]) {
            enableSubmit(false);
            return;
        }
        enableSubmit(true);
    }
    function saveRow() {
        $.post('/keyValue/save',$('#form-holiday').serialize(),function (data) {
            alert(data.message);location.href="/keyValue/list";
        });
    };


</script>
</body>