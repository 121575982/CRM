<head>
    <title>业务报表</title>
    <link rel="stylesheet" type="text/css" href="/js/datetimepicker/css/bootstrap-datetimepicker.css"/>
    <script type="text/javascript" src="/js/datetimepicker/js/moment-with-locales.js"></script>
    <script type="text/javascript" src="/js/datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="/js/chart/Chart.js"></script>
</head>
<body>
<form action="#" method="get" id="form-business" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务报表</span>

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
                                   value="${today?default("")}" placeholder="请选择开始日期">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="endTime" class="col-sm-4 control-label">截止时间：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control date form_datetime" id="endTime" name="endTime"
                                   value="${today?default("")}" placeholder="请选择截至日期">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="beginTime" class="col-sm-4 control-label">业务机构：</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="beginTime" name="beginTime"
                                   placeholder="请选择业务机构">
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="col-sm-5" align="right">
                        <a class="btn btn-success" href="javascript:setData();">查　询</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="col-sm-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务报表</span>
        </div>
        <div id="bar" class="panel-body" style="height: 300px">
            <canvas id="canvas"></canvas>
        </div>
    </div>
</div>
<div class="col-sm-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <span class="panel-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业务报表</span>
        </div>
        <div id="line" class="panel-body" style="height: 300px">
            <canvas id="line-business"></canvas>
        </div>
    </div>
</div>
<script type="text/javascript">

    $(".panel-heading").css("padding", "5px");
    $(".control-label").css("margin-right", "-15px");

    var chartBar;
    var chartLine;

    function setData() {

    }


    $(function () {
        $('.form_datetime').datetimepicker({
            locale: 'zh-CN',
            format: "YYYY-MM-DD"
        });


//        var ctx=$("#canvas").getContext("2d");
//        new Chart(ctx).Bar(barChartData, {
//            responsive : true
//        });


        $.post("/report/business", function (data) {
            $("#canvas").attr("height", $("#bar").height());
            $("#canvas").attr("width", $("#bar").width());

            var ctx = $("#canvas").get(0).getContext("2d");
            chartBar = new Chart(ctx);
            chartBar.Bar(data.reportData, {
                responsive: true,
                animation: true
            });

            $("#line-business").attr("height", $("#line").height());
            $("#line-business").attr("width", $("#line").width());
            var ctxLine = $("#line-business").get(0).getContext("2d");
            chartLine = new Chart(ctxLine);
            chartLine.Line(data.reportData, {
                responsive: true,
                animation: true
            });


            // $("#canvas").attr("height","100px");
        });


    })


</script>

</body>