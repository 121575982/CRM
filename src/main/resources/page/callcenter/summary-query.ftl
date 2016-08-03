<head>
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
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;事后小结--查询</span>

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
                        <label for="beginTime" class="col-sm-5 control-label">开始日期：</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control date form_datetime" id="beginTime" name="beginTime"
                                   value="${beginTime?default("")}" placeholder="请选择开始时间">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="endTime" class="col-sm-5 control-label">截至日期：</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control date form_datetime" id="endTime" name="endTime"
                                   value="${endTime?default("")}" placeholder="请选择截至时间">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="name" class="col-sm-5 control-label">客户姓名：</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="请输入客户姓名">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="phone" class="col-sm-5 control-label">来电号码：</label>

                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="phone" name="phone"
                                   placeholder="请输入来电号码">
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="jiaoyi" class="col-sm-5 control-label">业务类型：</label>
                        <div class="col-sm-7">
                            <select class="form-control" name="jiaoyi" id="jiaoyi">
                                <option value="">全部</option>
                                <option value="1">咨询</option>
                                <option value="2">投诉</option>
                                <option value="3">查询</option>
                                <option value="4">错帐</option>
                            </select>
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
<div class="panel panel-info">
    <div class="panel-body collapse in">
        <table id="telrecord-grid"
               data-toggle="table"
               data-url="/callcenter/trans1002"
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
                <th data-field="customerName" data-sortable="true">来电号码</th>
                <th data-field="customerSex" data-formatter="sexFormatter">客户姓名</th>
                <th data-field="customerTel" data-sortable="true">业务类型</th>
                <th data-field="customerTel" data-sortable="true">业务内容</th>
            </tr>
            </thead>
        </table>
    </div>
</div>


<script type="text/javascript">
    $('#result-form').hide();
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");



    $(function () {
        $('.form_datetime').datetimepicker({
            locale: 'zh-CN',
            format: "YYYY-MM-DD",
            sideBySide: true
        });

    })
</script>
</body>