<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
</head>
<body>
<form action="#" method="post" id="form-project_status" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading" >
            <div class=class="col-sm-3">
                <div class="form-group">
                    <label for="quota" class="col-sm-1 control-label">查询类型：</label>
                    <div class="col-sm-1">
                        <select class="form-control"  id="showType" name="showType">
                            <option value="-1"> &nbsp;&nbsp;全&nbsp;&nbsp;&nbsp;部&nbsp;&nbsp; </option>
                            <option value="0">&nbsp;未&nbsp;审&nbsp;核</option>
                            <option value="1">初审通过</option>
                            <option value="2">终审通过</option>
                            <option value="3">&nbsp;未&nbsp;通&nbsp;过</option>
                        </select>
                    </div>
                    <a class="btn btn-success" href="javascript:submit()" id="submit" >提　交</a>
                    <a class="btn btn-success" href="/project/new" id="add" >项目新增</a>
                </div>
            </div>
        </div>
        <div class="panel-body collapse in">
            <table id="telrecord-grid"
                   data-toggle="table"
                   data-url="/project/query?project_status=-1"
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
                   data-id-field="project_no">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-field="project_no" data-visible="false" data-switchable="false">id</th>
                    <th data-field="project_name" data-sortable="true">项目名称</th>
                    <th data-field="project_purpose" data-sortable="true">项目用途</th>
                    <th data-field="plan_money" data-sortable="true">计划金额</th>
                    <th data-field="cycle" data-sortable="true">周期</th>
                    <th data-field="payment_method" data-sortable="true">还款方式</th>
                    <th data-field="project_type" data-sortable="true">项目类型</th>
                    <th data-field="risk_reserve" data-sortable="true">风险准备金</th>
                    <th data-field="guarantee_id" data-sortable="true">担保公司</th>
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

    function actionFormatter(value,row,index) {
        var edit= "<a href='javascript:edit("+row.id+");'>修改&nbsp;</a>";
        var instance =  "<a href='javascript:show("+row.id+");'>&nbsp;审核</a>";
        return edit+instance;
    }

    function show(id) {
        location.href="/project/instance?id="+id;
    }

    function edit(id){
        location.href="/project/edit?id="+id;
    }
    
    function submit() {
        var project_status = document.getElementById("showType").value;
        projectQuery(project_status);
    }

    function projectQuery(project_status) {
        $('#telrecord-grid').bootstrapTable(
                "refresh",
                {
                    url:"/project/query?project_status="+project_status
                }
        );
    }

</script>
</body>