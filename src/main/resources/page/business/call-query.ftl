<head>
    <title>外呼查询</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/datetimepicker/css/bootstrap-datetimepicker.css"/>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/datetimepicker/js/bootstrap-datetimepicker.js"></script>
</head>
<body>
<form action="#" method="get" id="form-business" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;外呼查询</span>

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
                        <label for="beginTime" class="col-sm-4 control-label">开始时间：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control date form_datetime" id="beginTime" name="beginTime"
                                   value="${beginTime?default("")}" placeholder="请选择开始时间">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="endTime" class="col-sm-4 control-label">截止时间：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control date form_datetime" id="endTime" name="endTime"
                                   value="${endTime?default("")}" placeholder="请选择截至时间">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="customerName" class="col-sm-4 control-label">客户姓名：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="customerName" name="customerName"
                                   placeholder="请输入客户姓名">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="customerTel" class="col-sm-4 control-label">客户电话：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="customerTel" name="customerTel"
                                   placeholder="请输入客户电话">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="beginTime" class="col-sm-4 control-label">机构：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="beginTime" name="beginTime"
                                   placeholder="请选择开始时间">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="beginTime" class="col-sm-4 control-label">业务类型：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="beginTime" name="beginTime"
                                   placeholder="请选择开始时间">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="beginTime" class="col-sm-4 control-label">主叫电话：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control date form_datetime" id="beginTime" name="beginTime"
                                   placeholder="请选择开始时间">
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="col-sm-5" align="right">
                        <a class="btn btn-success" href="javascript:">查　询</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="breadcrumb">

    <div class="panel-body collapse in">
        <table id="telrecord-grid"
               data-toggle="table"
               data-url="/business/query"
               data-side-pagination="server"
               data-query-params-type="not-limit"
               data-pagination="true"
               data-sort-order="desc"
               data-undefined-text=""
               data-show-columns="true"
               data-show-refresh="true"
               data-show-toggle="true"
               data-search="false"
               data-page-size="5"
               data-page-list="[5,10,20,50]"
               data-id-field="id">
            <thead>
            <tr>
                <th data-field="state" data-checkbox="true"></th>
                <th data-field="id" data-visible="false" data-switchable="false">id</th>
                <th data-field="insertTime" data-sortable="true">时间</th>
                <th data-field="customerName" data-sortable="true">客户姓名</th>
                <th data-field="customerSex" data-formatter="sexFormatter">客户性别</th>
                <th data-field="customerTel" data-sortable="true">客户电话</th>
                <th data-field="businessTypeName" data-sortable="true">业务类型</th>
                <th data-field="businessTel" data-sortable="true">业务电话</th>
                <th data-field="status" data-sortable="true">状态</th>
                <th data-field="action" data-formatter="actionFormatter">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>


<#--<div class="panel panel-info">-->
<#--<div class="panel-heading">-->
<#--<span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;外呼业务记录</span>-->
<#--<div style="float: right;">-->
<#--<a class="panel-collapse" data-toggle="collapse"-->
<#--href=""><i class="fa fa-minus"></i></a>-->
<#--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
<#--</div>-->
<#--</div>-->
<#---->
<#--</div>-->
<script type="text/javascript">

    $(".panel-heading").css("padding", "5px");
    $(".control-label").css("margin-right", "-15px");


    function sexFormatter(value, row, index) {
        if (row.customerSex == 1) {
            return "先生";
        } else {
            return "女士";
        }
    }

    function actionFormatter(value, row, index) {
        var call = "<a href='javascript:userEdit(" + row.id + ");'>呼叫</a> | ";
        var edit = "<a href='javascript:userDel(" + row.id + ");'>修改</a>";
        return call + edit;
    }

    $(function () {
        $('.form_datetime').datetimepicker({
            locale: 'zh-CN',
            format: "YYYY-MM-DD HH:mm:ss",
            sideBySide: true
        });

    })


</script>

</body>