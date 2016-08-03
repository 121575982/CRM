<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
</head>
<body>
<form action="#" method="get" id="form-guarantess_list" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading" >
            <span class="panel-title" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;担保人列表
            <div style="text-align:right;" >
                <a class="btn btn-warning"  href="/common/sel" >查&nbsp;&nbsp;&nbsp;&nbsp;找</a>
                <a href="/common/new" class="btn btn-warning">继续添加</input></a>
            </div>
                </span>
        </div>

        <div class="panel-body collapse in">
            <table id="telrecord-grid"
                   data-toggle="table"
                   data-url="/common/query"
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
                    <th data-field="client_no" data-visible="false" data-switchable="false">id</th>
                    <th data-field="client_no" data-sortable="true">客户号</th>
                    <th data-field="client_name" data-sortable="true">客户名称</th>
                    <th data-field="quota" data-sortable="true">授信额度</th>
                    <th data-field="loan_no" data-sortable="true">贷款员工号</th>
                    <th data-field="loan_name" data-sortable="true">贷款员姓名</th>
                    <th data-field="loan_ratify_no" data-sortable="true">贷款批准人工号</th>
                    <th data-field="loan_ratify_name" data-sortable="true">贷款批准人姓名</th>
                    <th data-field="contacts" data-sortable="true">联系人</th>
                    <th data-field="legal" data-sortable="true">法定代表人</th>
                    <th data-field="action" data-formatter="actionFormatter">详情</th>
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
        $.post('/common/find',$('#form-guarantess_list').serialize());
    };

    function actionFormatter(value,row,index) {
        var edit =  "<a href='javascript:edit("+row.id+");'>查看</a>";
        return edit;
    }

    function edit(id){
        alert(id);
        location.href="/common/edit?id="+id;
    }

</script>
</body>