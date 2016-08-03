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
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在投项目</span>

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
                        <label for="papers" class="col-sm-3 control-label">查询条件：</label>
                        <div class="col-sm-9">
                            <label class="checkbox-inline">
                                <input type="radio" name="tuijianren" id="tuijianren1" value="1" checked>全部
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="tuijianren" id="tuijianren2" value="2"  >计息时间
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="tuijianren" id="tuijianren3" value="3">到期时间
                            </label>
                        </div>
                    </div>
                </div>
                <div id="queryTime">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="beginTime" class="col-sm-4 control-label">开始日期：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control date form_datetime" id="beginTime" name="beginTime"
                                       value="${beginTime?default("")}" placeholder="请选择开始时间">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label for="endTime" class="col-sm-4 control-label">截至日期：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control date form_datetime" id="endTime" name="endTime"
                                       value="${endTime?default("")}" placeholder="请选择截至时间">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-1">
                    <div class="col-sm-8" align="right">
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
                <th data-field="insertTime" data-sortable="true">项目名称</th>
                <th data-field="insertTime" data-sortable="true">投资金额</th>
                <th data-field="customerSex" data-sortable="true">年化收益率</th>
                <th data-field="customerName" data-sortable="true">计息时间</th>
                <th data-field="customerName" data-sortable="true">到期时间</th>
                <th data-field="customerTel" data-sortable="true">还款模型</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");

    $(function () {
        $('.form_datetime').datetimepicker({
            locale: 'zh-CN',
            format: "YYYY-MM-DD",
            sideBySide: true
        });

        $('#queryTime').hide();

        $("input[name=tuijianren]").change(function(){


            if("1"==$("input[name='tuijianren']:checked").val()){
                $('#queryTime').hide();
            }else{
                $('#queryTime').show();
            }

        });
    })
</script>
</body>
