<body>
<form action="#" method="get" id="form-selGuarantess" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;担保人查询</span>
            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href=""><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="form-group">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="client_no" class="col-sm-5 control-label">客户号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="client_no" name="client_no"  value="" placeholder="请输入客户号">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                <div class="form-group">
                    <label for="client_name" class="col-sm-5 control-label">客户名称：</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="client_name" name="client_name"  value="" placeholder="请输入客户名称">
                    </div>
                </div>
            </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="quota" class="col-sm-5 control-label">授信额度：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="quota" name="quota"  value="" placeholder="请输入授信额度">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="loan_no" class="col-sm-5 control-label">贷款员工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_no" name="loan_no"  value="" placeholder="请输入贷款员工号">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="loan_name" class="col-sm-5 control-label">贷款员姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_name" name="loan_name"   value="" placeholder="请输入贷款员姓名">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="loan_ratify_no" class="col-sm-5 control-label">贷款批准人工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_ratify_no" name="loan_ratify_no"  value="" placeholder="请输入贷款批准人工号">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="loan_ratify_name" class="col-sm-5 control-label">贷款批准人姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_ratify_name" name="loan_ratify_name"  value="" placeholder="请输入贷款批准人姓名">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="contacts" class="col-sm-5 control-label">联系人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts" name="contacts"  value="" placeholder="请输入联系人">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="contacts_phone" class="col-sm-5 control-label">联系人电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_phone" name="contacts_phone"  value="" placeholder="请输入联系人电话">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="legal" class="col-sm-5 control-label">法定代表人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal" name="legal"  value="" placeholder="请输入法定代表人">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="legal_phone" class="col-sm-5 control-label">法定代表人电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_phone" name="legal_phone"  value="" placeholder="请输入法定代表人电话">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="col-sm-5" align="right">
                    <a class="btn btn-success" href="javascript:submit();">查　询</a>
                </div>
            </div>
        </div>
    </div>
</form>
<form role="form" id="result-form" class="form-horizontal" method="post">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查询结果：</span>
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
                            <input type="text" class="form-control" id="client_no1"   readonly  ">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="client_name" class="col-sm-5 control-label">客户名称：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="client_name1"  readonly >
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="quota" class="col-sm-5 control-label">授信额度：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="quota1"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_no" class="col-sm-5 control-label">贷款员工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_no1"  readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_name" class="col-sm-5 control-label">贷款员姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_name1"   readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_ratify_no" class="col-sm-5 control-label">贷款批准人工号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_ratify_no1"   readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="loan_ratify_name" class="col-sm-5 control-label">贷款批准人姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="loan_ratify_name1"   readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts" class="col-sm-5 control-label">联系人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts1"   readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts_add" class="col-sm-5 control-label">联系人地址：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_add1"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts_phone" class="col-sm-5 control-label">联系人电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_phone1"   readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="contacts_email" class="col-sm-5 control-label">联系人邮箱：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="contacts_email1"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal" class="col-sm-5 control-label">法定代表人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal1"   readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal_add" class="col-sm-5 control-label">法定代表人地址：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_add1"   readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal_phone" class="col-sm-5 control-label">法定代表人电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_phone1"   readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="legal_email" class="col-sm-5 control-label">法定代表人邮箱：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="legal_email1"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="description" class="col-sm-5 control-label">描述：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="description1"   readonly>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    // $(".panel").css("margin-bottom", "0px");
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");
    $('#result-form').hide();

    function submit(){
        $.post('/common/selGuarantess',$('#form-selGuarantess').serialize(),function(data){
            $("#client_no1").val(data.client_no);
            $("#client_name1").val(data.client_name);
            $("#quota1").val(data.quota);
            $("#loan_no1").val(data.loan_no);
            $("#loan_ratify_no1").val(data.loan_ratify_no);
            $("#loan_ratify_name1").val(data.loan_ratify_name);
            $("#contacts1").val(data.contacts);
            $("#contacts_add1").val(data.contacts_add);
            $("#contacts_email1").val(data.contacts_email);
            $("#contacts_phone1").val(data.contacts_phone);
            $("#legal1").val(data.legal);
            $("#legal_add1").val(data.legal_add);
            $("#legal_email1").val(data.legal_email);
            $("#legal_phone1").val(data.legal_phone);
            $("#description1").val(data.description);
        });
        $('#result-form').show();
    }

    function trans(menuId){
        window.parent.openMenu(menuId);
    }


</script>
</body>