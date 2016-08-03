<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
</head>
<body>

<div class="panel panel-info">
    <div class="panel-heading">
        <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;零钱贯</span>

        <div style="float: right;">
            <a class="panel-collapse" data-toggle="collapse"
               href=""><i class="fa fa-minus"></i></a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
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
                <th data-field="customerName" data-sortable="true">金额</th>
                <th data-field="customerSex" data-formatter="sexFormatter">提交时间</th>
            </tr>
            </thead>
        </table>
    </div>

</div>
<script type="text/javascript">
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");
</script>
</body>