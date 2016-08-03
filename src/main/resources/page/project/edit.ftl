<head>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/datePicker4.8/WdatePicker.js"></script>
</head>
<body>
<form action="#" method="post" id="form-project_list" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目管理</span>
            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href=""><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="project_no" class="col-sm-5 control-label">项目编号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="project_no" name="project_no"   onblur="checkProject_no();"><span id="project_noMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="project_name" class="col-sm-5 control-label">项目名称：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="project_name" name="project_name" onblur="checkProject_name();"><span id="project_nameMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="guarantee_id" class="col-sm-5 control-label">担保公司：</label>
                        <div class="col-sm-7">
                            <select  class="form-control"  id="guarantee_id" name="guarantee_id">
                                <option value="0">--请选择担保人--</option>
                                <#list listInfo as being>
                                    <option value=${being.client_no}>${being.client_name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="counter_guarantee_id" class="col-sm-5 control-label">反担保公司：</label>
                        <div class="col-sm-7">
                            <select  class="form-control"  id="counter_guarantee_id" name="counter_guarantee_id">
                                <option value="1">--请选择担保人--</option>
                            <#list listInfo as being>
                                <option value=${being.client_no}>${being.client_name}</option>
                            </#list>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="plan_money" class="col-sm-5 control-label">计划金额：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="plan_money" name="plan_money">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="min_money" class="col-sm-5 control-label">最小成立金额：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="min_money" name="min_money">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="max_money" class="col-sm-5 control-label">最大成立金额：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="max_money" name="max_money">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="risk_reserve" class="col-sm-5 control-label">风险准备金：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="risk_reserve" name="risk_reserve">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="interest_rate" class="col-sm-5 control-label">利率：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="interest_rate" name="interest_rate" onblur="checkInterest_rate();"><span id="interest_rateMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="project_purpose" class="col-sm-5 control-label">项目用途：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="project_purpose" name="project_purpose" onblur="checkProject_purpose();"><span id="project_purposeMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="payment_method" class="col-sm-5 control-label">还款方式：</label>
                        <div class="col-sm-7">
                            <select class="form-control" name="payment_method"  id="payment_method">
                                <option value="1">还本付息</option>
                                <option value="2">先息后本</option>
                                <option value="3">等额本息</option>
                                <option value="4">等额本金</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_employee_code" class="col-sm-5 control-label">贷款员工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_employee_code" name="loan_employee_code">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="cycle" class="col-sm-5 control-label">周期：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="cycle" name="cycle" onblur="checkCycle();"><span id="cycleMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="cycle_unit" class="col-sm-5 control-label" >周期单位：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="cycle_unit" name="cycle_unit" onblur="checkCycle_unit();"><span id="cycle_unitMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="fee" class="col-sm-5 control-label">手续费：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="fee" name="fee">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="project_type" class="col-sm-5 control-label">项目类型：</label>
                        <div class="col-sm-7">
                            <select class="form-control"  id="project_type" name="project_type">
                                <option value="1">直投项目</option>
                                <option value="2">宝贝计划</option>
                                <option value="3">零 钱 贯</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="start_raising_time" class="col-sm-5 control-label">募集开始时间：</label>
                        <div class="col-sm-7">
                            <input type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});" onclick="WdatePicker();"  class="form-control" id="start_raising_time" name="start_raising_time">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="end_raising_time" class="col-sm-5 control-label">募集截止时间：</label>
                        <div class="col-sm-7">
                            <input type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});" onclick="WdatePicker();"  class="form-control" id="end_raising_time" name="end_raising_time">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
            </div>
            <input type="hidden" id="id" name="id" value="#{id}">
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="project_describe" class="col-sm-1 control-label">项目描述：</label>
                        <div class="col-sm-11">
                            <textarea class="form-control" id="project_describe" name="project_describe" placeholder="请输入项目描述"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading" align="center">
            <a class="btn btn-success" href="javascript:saveRow()" id="submit" >提　交</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-warning" href="javascript:closeWindow();">取　消</a>
        </div>
    </div>
</form>


<script type="text/javascript">
    $(".panel").css("margin-bottom", "0px");
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");


    function checkProject_no(){
        var a = (document.getElementById("project_no").value).trim();
        var msg = "";
        if(!a) {
            msg = "项目编号必须填写";
        }else{
            flags[0] = true;
        }
        document.getElementById("project_noMsg").innerHTML = msg;
        document.getElementById("project_no").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function checkProject_name(){
        var a = (document.getElementById("project_name").value).trim();
        var msg = "";
        if(!a) {
            msg = "项目名称必须填写";
        }else{
            flags[1] = true;
        }
        document.getElementById("project_nameMsg").innerHTML = msg;
        document.getElementById("project_name").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }
    function checkProject_purpose(){
        var a = (document.getElementById("project_purpose").value).trim();
        var msg = "";
        if(!a) {
            msg = "项目用途必须填写";
        }else{
            flags[2] = true;
        }
        document.getElementById("project_purposeMsg").innerHTML = msg;
        document.getElementById("project_purpose").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }
    function checkCycle(){
        var a = (document.getElementById("cycle").value).trim();
        var msg = "";
        if(!a) {
            msg = "周期必须填写";
        }else{
            flags[3] = true;
        }
        document.getElementById("cycleMsg").innerHTML = msg;
        document.getElementById("cycle").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }
    function checkCycle_unit(){
        var a = (document.getElementById("cycle_unit").value).trim();
        var msg = "";
        if(!a) {
            msg = "周期单位必须填写";
        }else{
            flags[4] = true;
        }
        document.getElementById("cycle_unitMsg").innerHTML = msg;
        document.getElementById("cycle_unit").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }
    function checkInterest_rate(){
        var a = (document.getElementById("interest_rate").value).trim();
        var msg = "";
        if(!a) {
            msg = "利率必须填写";
        }else{
            flags[5] = true;
        }
        document.getElementById("interest_rateMsg").innerHTML = msg;
        document.getElementById("interest_rate").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function enableSubmit(bool){
        if(bool)$("#submit").removeAttr("disabled");
        else $("#submit").attr("disabled","disabled");
    }

    function saveRow() {
        $.post('/project/update',$('#form-project_list').serialize(),function (data) {
            alert(data.message);
        });
    };

        $(function(){
            var id = document.getElementById("id").value;
            $.post('/project/editData?project_status='+id,$('#form-project_list').serialize(),function(data){
                $("#project_no").val(data.project_no);
                $("#project_name").val(data.project_name);
                $("#guarantee_id").val(data.guarantee_id);
                $("#counter_guarantee_id").val(data.counter_guarantee_id);
                $("#plan_money").val(data.plan_money);
                $("#min_money").val(data.min_money);
                $("#max_money").val(data.max_money);
                $("#risk_reserve").val(data.risk_reserve);
                $("#interest_rate").val(data.interest_rate);
                $("#project_purpose").val(data.project_purpose);
                $("#payment_method").val(data.payment_method);
                $("#loan_employee_code").val(data.loan_employee_code);
                $("#cycle").val(data.cycle);
                $("#cycle_unit").val(data.cycle_unit);
                $("#fee").val(data.fee);
                $("#project_type").val(data.project_type);
                $("#start_raising_time").val(data.start_raising_time);
                $("#end_raising_time").val(data.end_raising_time);
                $("#project_describe").val(data.project_describe);
            });
        })


    
</script>
</body>