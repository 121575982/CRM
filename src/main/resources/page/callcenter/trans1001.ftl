<body>
<form action="#" method="get" id="form-business" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;身份认证</span>

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
                        <label for="phone" class="col-sm-5 control-label">手机号码：</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="phone" name="phone"
                                   value="" placeholder="请输入手机号码">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">证件号后四位：</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="papers" name="papers"
                                   value="" placeholder="请输入证件号后四位">
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
    </div>
</form>

<form role="form" id="result-form" class="form-horizontal" method="post">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交易结果：</span>

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
                        <label for="phone" class="col-sm-5 control-label">客户姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone" readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">性别：</label>
                        <div class="col-sm-7">
                            <label class="checkbox-inline">
                                <input type="radio" name="deputySex" id="deputySex1" value="1" checked disabled>先生
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="deputySex" id="deputySex2" value="2" disabled>女士
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">生日：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">身份证号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group">

                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">会员等级：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">注册来源：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="phone" class="col-sm-5 control-label">推荐人：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone" readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">是否推荐人：</label>
                        <div class="col-sm-7">
                            <label class="checkbox-inline">
                                <input type="radio" name="tuijianren" id="tuijianren1" value="1" checked disabled>是
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="tuijianren" id="tuijianren2" value="2" disabled>否
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">

                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">总资产：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">可用余额：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="phone" class="col-sm-5 control-label">冻结金额：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone" readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">在投资金：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">

                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">在投项目：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">自动投标：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">积分：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">汇付号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">恒丰虚拟号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">邮箱：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rpapers"  readonly>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-11 col-sm-offset-1">
                    <div class="col-sm-3">
                        <a class="btn btn-success" href="javascript:trans('#menu_1002');">交易记录</a>
                    </div>
                    <div class="col-sm-3">
                        <a class="btn btn-success" href="javascript:trans('#menu_1003');">零 钱 罐</a>
                    </div>
                    <div class="col-sm-3">
                        <a class="btn btn-success" href="javascript:trans('#menu_1004');">宝贝计划</a>
                    </div>
                    <div class="col-sm-3">
                        <a class="btn btn-success" href="javascript:trans('#menu_1007');">优 惠 券</a>
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

        $("#Rphone").val("18666345555555");
        $("#Rpapers").val("1234");

        $('#result-form').show();
    }

    function trans(menuId){
        window.parent.openMenu(menuId);
    }


</script>
</body>