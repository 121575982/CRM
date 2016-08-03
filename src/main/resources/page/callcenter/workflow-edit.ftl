<body>
<form action="#" method="get" id="form-business" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新建工单</span>

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
                        <label for="phone" class="col-sm-5 control-label">客户号：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="phone" class="col-sm-5 control-label">客户姓名：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="papers" class="col-sm-5 control-label">性别：</label>
                        <div class="col-sm-7">
                            <label class="checkbox-inline">
                                <input type="radio" name="deputySex" id="deputySex1" value="1" checked>先生
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="deputySex" id="deputySex2" value="2">女士
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="phone" class="col-sm-5 control-label">来电号码：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">

                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="jiaoyi" class="col-sm-5 control-label">工单类型：</label>
                        <div class="col-sm-7">
                            <select class="form-control" name="jiaoyi" id="jiaoyi">
                                <option value="1">投诉</option>
                                <option value="2">建议</option>
                                <option value="3">错帐</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="huifu" class="col-sm-5 control-label">需要回复：</label>
                        <div class="col-sm-7">
                            <label class="checkbox-inline">
                                <input type="radio" name="huifu" id="huifu1" value="1" checked>是
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="huifu" id="huifu2" value="2">否
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="phone" class="col-sm-5 control-label">回复电话：</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="Rphone">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="form-group">
                    <label for="jiaoyi" class="col-sm-1 control-label">描述：</label>
                    <div class="col-sm-8">
                        <textarea class="form-control" id="Rphone" placeholder="请输入业务内容"></textarea>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading" align="center">
            <a class="btn btn-success" href="javascript:saveRow()">提　交</a>
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


</script>
</body>