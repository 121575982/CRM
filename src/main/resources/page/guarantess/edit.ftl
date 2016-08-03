
<body>
<form action="#" method="post" id="form-guarantess" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;担保人管理</span>
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
                        <label for="client_no" class="col-sm-5 control-label">客户号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="client_no" name="client_no" onblur="checkClient_no();"><span id="client_noMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="client_name" class="col-sm-5 control-label">客户名称：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="client_name" name="client_name" onblur="checkClient_name();"><span id="client_nameMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="quota" class="col-sm-5 control-label">受信额度：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="quota" name="quota" onblur="checkQuota();"><span id="quotaMsg"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_no" class="col-sm-5 control-label">贷款员工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_no" name="loan_no" onblur="checkLoan_no();"><span id="loan_noMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_name" class="col-sm-5 control-label">贷款员姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_name" name="loan_name" onblur="checkLoan_name();"><span id="loan_nameMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_ratify_no" class="col-sm-5 control-label">贷款批准人工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_ratify_no" name="loan_ratify_no" onblur="checkLoan_ratify_no();"><span id="loan_ratify_noMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_ratify_name" class="col-sm-5 control-label">贷款批准人姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_ratify_name" name="loan_ratify_name" onblur="checkLoan_ratify_name();"><span id="loan_ratify_nameMsg"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts" class="col-sm-5 control-label">联系人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts" name="contacts" onblur="checkContacts();"><span id="contactsMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts_add" class="col-sm-5 control-label">地址：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_add" name="contacts_add" onblur="checkContacts_add();"><span id="contacts_addMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts_phone" class="col-sm-5 control-label">电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_phone" name="contacts_phone" onblur="checkContacts_phone();"><span id="contacts_phoneMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts_email" class="col-sm-5 control-label">邮箱：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_email" name="contacts_email">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal" class="col-sm-5 control-label">法定代表人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal" name="legal" onblur="checkLegal();"><span id="legalMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal_add" class="col-sm-5 control-label">地址：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_add" name="legal_add" onblur="checkLegal_add();"><span id="legal_addMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal_phone" class="col-sm-5 control-label">电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_phone" name="legal_phone" onblur="checkLegal_phone();"><span id="legal_phoneMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal_email" class="col-sm-5 control-label">邮箱：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_email" name="legal_email">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="description" class="col-sm-1 control-label">担保公司描述：</label>
                        <div class="col-sm-11">
                            <textarea class="form-control" id="description" name="description" placeholder="请输入项目描述"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="id" name="id" value="#{id}">
    <div class="panel panel-info">
        <div class="panel-heading" align="center">
            <a class="btn btn-success" href="javascript:saveRow()" id="submit" disabled="disabled">提　交</a>
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

    $(function(){
        var id = document.getElementById("id").value;
        $.post('/common/editData?id='+id,$('#form-guarantess').serialize(),function(data){
            $("#client_no").val(data.client_no);
            $("#client_name").val(data.client_name);
            $("#quota").val(data.quota);
            $("#loan_no").val(data.loan_no);
            $("#loan_name").val(data.loan_name);
            $("#loan_ratify_no").val(data.loan_ratify_no);
            $("#loan_ratify_name").val(data.loan_ratify_name);
            $("#contacts").val(data.contacts);
            $("#contacts_add").val(data.contacts_add);
            $("#contacts_phone").val(data.contacts_phone);
            $("#contacts_email").val(data.contacts_email);
            $("#legal").val(data.legal);
            $("#legal_add").val(data.legal_add);
            $("#legal_phone").val(data.legal_phone);
            $("#legal_email").val(data.legal_email);
            $("#description").val(data.description);
        })
    })

    function saveRow() {
        $.post('/common/save',$('#form-guarantess').serialize(),function(data){
            alert(data.message); location.href="/common/guarantessList";
        });

    };

    function checkClient_no(){
        var a = (document.getElementById("client_no").value).trim();
        var msg = "";
        if(!a) {
            msg = "用户号必须填写";
        }else{
            flags[0] = true;
        }
        document.getElementById("client_noMsg").innerHTML = msg;
        document.getElementById("client_no").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }
    function checkClient_name(){
        var a = (document.getElementById("client_name").value).trim();
        var msg = "";
        if(!a) {
            msg = "客户名称必须填写";
        }else{
            flags[1] = true;

        }
        document.getElementById("client_nameMsg").innerHTML = msg;
        document.getElementById("client_name").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function checkQuota(){
        var a = (document.getElementById("quota").value).trim();
        var msg = "";
        if(!a) {
            msg = "授信额度必须填写";
        }else{
            flags[2] = true;

        }
        document.getElementById("quotaMsg").innerHTML = msg;
        document.getElementById("quota").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function checkLoan_no(){
        var a = (document.getElementById("loan_no").value).trim();
        var msg = "";
        if(!a) {
            msg = "贷款员工号必须填写";
        }else{
            flags[3] = true;

        }
        document.getElementById("loan_noMsg").innerHTML = msg;
        document.getElementById("loan_no").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function checkLoan_name(){
        var a = (document.getElementById("loan_name").value).trim();
        var msg = "";
        if(!a) {
            msg = "贷款员姓名必须填写";
        }else{
            flags[4] = true;

        }
        document.getElementById("loan_nameMsg").innerHTML = msg;
        document.getElementById("loan_name").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }


    function checkLoan_ratify_no(){
        var a = (document.getElementById("loan_ratify_no").value).trim();
        var msg = "";
        if(!a) {
            msg = "贷款批准人工号必须填写";
        }else{
            flags[5] = true;

        }
        document.getElementById("loan_ratify_noMsg").innerHTML = msg;
        document.getElementById("loan_ratify_no").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }


    function checkLoan_ratify_name(){
        var a = (document.getElementById("loan_ratify_name").value).trim();
        var msg = "";
        if(!a) {
            msg = "贷款批准人姓名必须填写";
        }else{
            flags[6] = true;

        }
        document.getElementById("loan_ratify_nameMsg").innerHTML = msg;
        document.getElementById("loan_ratify_name").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }




    function checkContacts(){
        var a = (document.getElementById("contacts").value).trim();
        var msg = "";
        if(!a) {
            msg = "联系人姓名必须填写";
        }else{
            flags[7] = true;

        }
        document.getElementById("contactsMsg").innerHTML = msg;
        document.getElementById("contacts").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }


    function checkContacts_add(){
        var a = (document.getElementById("contacts_add").value).trim();
        var msg = "";
        if(!a) {
            msg = "联系人地址必须填写";
        }else{
            flags[8] = true;

        }
        document.getElementById("contacts_addMsg").innerHTML = msg;
        document.getElementById("contacts_add").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }



    function checkContacts_phone(){
        var a = (document.getElementById("contacts_phone").value).trim();
        var msg = "";
        if(!a) {
            msg = "联系人电话必须填写";
        }else{
            flags[9] = true;

        }
        document.getElementById("contacts_phoneMsg").innerHTML = msg;
        document.getElementById("contacts_phone").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }


    function checkLegal(){
        var a = (document.getElementById("legal").value).trim();
        var msg = "";
        if(!a) {
            msg = "法定代表人必须填写";
        }else{
            flags[10] = true;

        }
        document.getElementById("legalMsg").innerHTML = msg;
        document.getElementById("legal").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }



    function checkLegal_add(){
        var a = (document.getElementById("legal_add").value).trim();
        var msg = "";
        if(!a) {
            msg = "法定代表人地址必须填写";
        }else{
            flags[11] = true;

        }
        document.getElementById("legal_addMsg").innerHTML = msg;
        document.getElementById("legal_add").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }

    function checkLegal_phone(){
        var a = (document.getElementById("legal_phone").value).trim();
        var msg = "";
        if(!a) {
            msg = "法定代表人电话必须填写";
        }else{
            flags[12] = true;

        }
        document.getElementById("legal_phoneMsg").innerHTML = msg;
        document.getElementById("legal_phone").parentNode.parentNode.style.color=msg==""?"black":"red";
        v_submitbutton();
    }




    function enableSubmit(bool){
        if(bool)$("#submit").removeAttr("disabled");
        else $("#submit").attr("disabled","disabled");
    }

    var flags = [false,false,false,false,false,false,false,false,false,false,false,false,false];
    //flags全为true时提交按钮解除禁用
    function v_submitbutton(){
        for(f in flags) if(!flags[f]) {
            enableSubmit(false);
            return;
        }
        enableSubmit(true);
    }



</script>
</body>