<head>
    <title>新建外呼</title>
    <link rel="stylesheet" type="text/css" href="/js/ztree/css/zTreeStyle/zTreeStyle.css"/>
    <script type="text/javascript" src="/js/ztree/js/jquery.ztree.all.js"></script>

</head>
<body>
<form action="#" method="get" id="form-business" class="form-horizontal">
    <input type="hidden" id="id" name="id">
    <input type="hidden" id="businessTypeId" name="businessTypeId">

    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户信息</span>

            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href=""><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="form-group">
                <div class="col-sm-4">
                    <div class="row">
                        <label for="customerName" class="col-sm-4 control-label">客户姓名：</label>

                        <div class="col-sm-8 required">
                            <input type="text" class="form-control" id="customerName" name="customerName"
                                   placeholder="请输入客户姓名">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="customerSex" class="col-sm-4 control-label">客户性别：</label>

                        <div class="col-sm-8">
                            <label class="checkbox-inline">
                                <input type="radio" name="customerSex" id="customerSex1" value="1" checked>
                                先生
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="customerSex" id="customerSex2" value="2"> 女士
                            </label>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="row">
                        <label for="customerTel" class="col-sm-4 control-label">客户电话：</label>

                        <div class="col-sm-8 required">
                            <input type="text" class="form-control" id="customerTel" name="customerTel"
                                   placeholder="请输入客户电话">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="customerPaperType" class="col-sm-4 control-label">证件类型：</label>

                        <div class="col-sm-8">
                            <select class="form-control" name="customerPaperType" id="customerPaperType">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="customerPaperCode" class="col-sm-4 control-label">证件号码：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="customerPaperCode" name="customerPaperCode"
                                   placeholder="请输入证件号码">
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务信息</span>

            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href="#"><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="form-group">
                <div class="col-sm-4">
                    <div class="row">
                        <label for="businessTel" class="col-sm-4 control-label">主叫电话：</label>

                        <div class="col-sm-8 required">
                            <input type="text" class="form-control" id="businessTel" name="businessTel"
                                   placeholder="请输入业务电话">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="businessTypeName" class="col-sm-4 control-label">业务类型：</label>
                        <div class="col-sm-8  required">
                            <div class="input-group">
                                <input type="text" id="businessTypeName" name="businessTypeName" readonly
                                       class="form-control form-tree"  placeholder="请选择业务类型">

                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default  dropdown-toggle"
                                            data-toggle="dropdown" tabindex="-1">
                                        <span class="caret"></span>
                                        <span class="sr-only">切换下拉菜单</span>
                                    </button>
                                    <ul class="dropdown-menu pull-right">
                                        <ul id="tree" class="ztree"
                                            style="width:260px; height: 300px;overflow:auto;"/>
                                    </ul>
                                </div>
                                <!-- /btn-group -->
                            </div>
                            <!-- /input-group -->
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="businessMoney" class="col-sm-4 control-label">业务金额：</label>

                        <div class="col-sm-8">
                            <div class="input-group">
                                <span class="input-group-addon">$</span>
                                <input type="text" class="form-control" id="businessMoney" name="businessMoney"
                                       placeholder="请输入业务金额">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <label for="businessRemark" class="col-sm-1 control-label" style="width: 115px">备注：</label>

                <div class="col-sm-10">
                    <textarea class="form-control" name="businessRemark" id="businessRemark"
                              placeholder="请输入备注信息"></textarea>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代办人信息</span>

            <div style="float: right;">
                <a class="panel-collapse" data-toggle="collapse"
                   href="#"><i class="fa fa-minus"></i></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="panel-body collapse in">
            <div class="form-group">
                <div class="col-sm-4">
                    <div class="row">
                        <label for="deputyName" class="col-sm-4 control-label">代办人姓名：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="deputyName" name="deputyName"
                                   placeholder="请输入客户姓名">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="deputySex" class="col-sm-4 control-label">代办人性别：</label>

                        <div class="col-sm-8">
                            <label class="checkbox-inline">
                                <input type="radio" name="deputySex" id="deputySex1" value="1" checked>先生
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="deputySex" id="deputySex2" value="2">女士
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="row">
                        <label for="deputyPaperType" class="col-sm-4 control-label">证件类型：</label>

                        <div class="col-sm-8">
                            <select class="form-control" name="deputyPaperType" id="deputyPaperType">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="deputyPaperCode" class="col-sm-4 control-label">证件号码：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="deputyPaperCode" name="deputyPaperCode"
                                   placeholder="请输入证件号码">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <label for="deputyTel" class="col-sm-4 control-label">代办人电话：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="deputyTel" name="deputyTel"
                                   placeholder="请输入代办人电话">
                        </div>
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

    function closeWindow(){
        var id= window.parent.getIframeByElement(document.body).id;
   //     alert(frame);

//       var id= $(frame).parent(".jericho_tabs")[0].attr()
//               alert(id);

        id=id.substring(17,id.length);
        window.parent.tab.closeTab(id,true);
    }

    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                setTree(treeNode);
                return true;
            }
        }
    };

    function setTree(treeNode) {
        $("#businessTypeId").val(treeNode.id);
        $("#businessTypeName").val(treeNode.name);
    }

    function saveRow() {
        $.post("/business/save", $("#form-business").serialize(), function (data) {
            alert(data.message);
            var id= window.parent.getIframeByElement(document.body).id;
            //     alert(frame);

//       var id= $(frame).parent(".jericho_tabs")[0].attr()
//               alert(id);

            id=id.substring(17,id.length);
            window.parent.tab.closeTab(id,true);

        });
    }

    $(function () {
        $.post("/businessDictionary/tree", function (data) {
            $.fn.zTree.init($("#tree"), setting, data);
        });


        $("#deputyPaperType").empty();
        $("#deputyPaperType").append($("<option value=''>请选择证件类型</option>"));
        $("#deputyPaperType").append($("<option value='01'>身份证</option>"));
        $("#deputyPaperType").append($("<option value='02'>军官证</option>"));
        $("#deputyPaperType").append($("<option value='03'>户口本</option>"));
        $("#customerPaperType").empty();
        $("#customerPaperType").append($("<option value=''>请选择证件类型</option>"));
        $("#customerPaperType").append($("<option value='01'>身份证</option>"));
        $("#customerPaperType").append($("<option value='02'>军官证</option>"));
        $("#customerPaperType").append($("<option value='03'>户口本</option>"));





    })


</script>
</body>
