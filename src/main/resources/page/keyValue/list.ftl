<head>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css"/>
    <link rel="stylesheet" type="text/css" href="/css/zTree/role.css"/>
    <link rel="stylesheet" type="text/css" href="/css/zTree/roleCss.css"/>
    <link rel="stylesheet" type="text/css" href="/css/ZYUiPub.css"/>
    <link rel="stylesheet" type="text/css" href="/js/ztree/css/zTreeStyle/zTreeStyle.css"/>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="/js/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/js/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="/js/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="/js/ztree/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="/css/bootstrap-dialog/js/bootstrap-dialog.js"></script>
    <link rel="stylesheet" href="/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-dialog/css/bootstrap-dialog.css" />
    <script type="text/javascript">
        var IDMark_Switch = "_switch",
                IDMark_Icon = "_ico",
                IDMark_Span = "_span",
                IDMark_Input = "_input",
                IDMark_Check = "_check",
                IDMark_Edit = "_edit",
                IDMark_Remove = "_remove",
                IDMark_Ul = "_ul",
                IDMark_A = "_a";

        var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                dblClickExpand : true
            },
            callback: {
                beforeClick: beforeClick,
                onClick: zTreeOnClick
            },
            async:{
                enable:true,
                url:"/keyValue/display",
                autoParam:["id"]
            }
        };




        function beforeClick(treeId, treeNode, clickFlag) {
//            alert(treeNode.id);
            var ticketBagNo = treeNode.name;
            re =new RegExp(ticketBagNo);
            var accept = $("#accept").val();//找到要放数据的地方，并测试是否已经存在
            if(!re.test(accept)){
                $("#accept").val(accept+treeNode.name+"<"+ticketBagNo+">,");
            }
        }


        function addHoverDom(treeId, treeNode) {
            if (!treeNode.children)return;
            if (treeNode.parentNode && treeNode.parentNode.id!=1 ) return;
            var aObj = $("#" + treeNode.tId + IDMark_A);
            if (treeNode.children.length>0) {
                if ($("#diyBtn1_"+treeNode.id).length>0) return;
                if ($("#diyBtn2_"+treeNode.id).length>0) return;//' onclick='allSelect("+treeNode+")
                var editStr = "<a id='diyBtn1_" +treeNode.id+ "' ></a>";
                aObj.append(editStr);
                document.getElementById("diyBtn1_"+treeNode.id).onclick = function() {
                    allSelect(treeNode);
                };
            }
        }

        function allSelect(treeNode){
            if (!treeNode.children)return;
            for(i=0;i<treeNode.children.length;i++){
                var ticketBagNo = treeNode.children[i].phone;
                re =new RegExp(ticketBagNo);
                var accept = $("#accept").val();//找到文本框如果该记录未添加就添加
                if(!re.test(accept)){
                    $("#accept").val(accept+treeNode.children[i].name+"<"+ticketBagNo+">,");
                }
            }
        }

        function zTreeOnClick(event, treeId, treeNode) {
            onClick(treeNode.id);
            $("#currentId").val(treeNode.id);
            $("#currentName").val(treeNode.name);
            $("#pId").val(treeNode.group_id);
        }

        function userEdit(id){

        }




        //显示
        function display(id){
            var url="/keyValue/display?id="+id;
        }

        function removeHoverDom(treeId, treeNode) {
            if (!treeNode.children)return;
            $("#diyBtn1_"+treeNode.id).unbind().remove();
        }

        var zNodes;

        $(document).ready(function(){
            $.ajax({
                async : false,
                cache:false,
                type: 'POST',
                dataType : 'json',
                url: '/keyValue/tree',//请求的action路径
                error: function () {//请求失败处理函数
                    alert('请求失败');
                },
                success:function(data){ //请求成功后处理函数。
                    zNodes = data;   //把后台封装好的简单Json格式赋给treeNodes
                }
            });
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });
    </script>
</head>
<body>
<form action="#" method="get" id="form-holiday_list" class="form-horizontal">
    <div class="panel panel-info">
        <div class="panel-heading" >
            <span class="panel-title" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统字典列表
            <div style="text-align:right;" >
                <a href="/keyValue/add" class="btn btn-warning">继续添加</input></a>
            </div>
            </span>
        </div>
    </div>
    <div id="iframeMainContent">
        <div class="iframeleft">
            <div class="btnbartitle">
                <div>列表</div>
            </div>
            <div class="div-body">
                <ul id="treeDemo" class="ztree"></ul>
            </div>
        </div>
        <div class="iframeContent">
            <div class="iframeleft1">
                <div class="btnbartitle">
                    <div>详细列表</div>
                </div>
                <div class="tools_bar">
                    <div class="tools_separator"></div>
                            <a title="" href="/keyValue/add" class="tools_btn"><span> <b>新增</b></span> </a>
                            <div class="tools_separator"></div>
                             <a title="" onclick="userEdit();" class="tools_btn"><span> <b>编辑</b></span> </a>
                </div>

                <div >
                    <table id="dicTab" style="width:100%" class="t1">
                        <thead>
                        <th style="text-align:left" colspan="4"><dt>详情</dt></th>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="width:25%">id</td>
                            <td style="width:25%" id="id" name="id"></td>
                            <td style="width:25%">父类</td>
                            <td style="width:25%" id="group_id" name="group_id"></td>
                        </tr>
                        <tr>
                            <td>名称</td>
                            <td id="key_name" name="key_name"></td>
                            <td>关键字</td>
                            <td id="key_word" name="key_word"></td>
                        </tr>
                        <tr>
                            <td>数值</td>
                            <td id="key_value" name="key_value"></td>
                            <td>状态</td>
                            <td id="state" name="state"></td>
                        </tr>
                        <tr>
                            <td>备注</td>
                            <td id="remark" name="remark"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    $(".panel").css("margin-bottom", "0px");
    $(".panel-body").css("padding", "10px");
    $(".control-label").css("margin-right", "-15px");
    $(".panel-heading").css("padding", "5px");

    $(function(){
        $.post('/keyValue/tree')
    })


    function find() {
        $.post('/keyValue/tree',$('#form-holiday_list').serialize());
    };

    function actionFormatter(value,row,index) {
        var edit =  "<a href='javascript:edit("+row.id+");'>删除</a>";
        return edit;
    }

    function edit(id){
        location.href="/keyValue/delete?id="+id;
    }

    function onClick(id){
        var url="/keyValue/show?id="+id;
        $.ajax({
            type : "POST",
            url : url,
            data : "id=" + id ,
            dataType : "json",
            success : function(data) {
                $("#id").html(data.id);
                $("#group_id").html(data.group_id);
                $("#key_name").html(data.key_name);
                $("#key_word").html(data.key_word);
                $("#key_value").html(data.key_value);
                $("#state").html(data.state);
                $("#state").html(data.state);
                $("#remark").html(data.remark);
            }
        });
    }
</script>
</body>