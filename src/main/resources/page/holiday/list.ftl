<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
</head>
<body>
<form action="#" method="get" id="form-holiday_list" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading" >
            <span class="panel-title" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;假日列表
            <div style="text-align:right;" >
                <a href="/holiday/add" class="btn btn-warning">继续添加</input></a>
            </div>
                </span>
        </div>

        <div class="panel-body collapse in">
            <table id="telrecord-grid"
                   data-toggle="table"
                   data-url="/holiday/query"
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
                   data-id-field="client_no">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-field="id" data-visible="false" data-switchable="false">id</th>
                    <th data-field="holiday_date"  data-sortable="true">日期</th>
                    <th data-field="holiday_name" data-sortable="true">节日名称</th>
                    <th data-field="action" data-formatter="actionFormatter">操作</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</form>
<script type="text/javascript">
    $(".panel").css("margin-bottom", "0px");
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");

    function find() {
        $.post('/common/find',$('#form-holiday_list').serialize());
    };

    function actionFormatter(value,row,index) {
        var edit =  "<a href='javascript:edit("+row.id+");'>删除</a>";
        return edit;
    }

    function edit(id){
        location.href="/holiday/delete?id="+id;
    }

</script>
</body>