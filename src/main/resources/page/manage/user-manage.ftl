<head>
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="/js/ztree/css/zTreeStyle/zTreeStyle.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-table/bootstrap-table.css" />
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-dialog/css/bootstrap-dialog.css" />

    <script type="text/javascript" src="/js/ztree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="/css/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="/css/bootstrap-dialog/js/bootstrap-dialog.js"></script>
<#--<script type="text/javascript" src="/static/bootstrap-table/bootstrap-table-zh-CN.js"></script>-->
</head>
<body>
<div class="modal" role="dialog" aria-hidden="true">ddddd</div>
<div class="breadcrumb">
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">结构树</h3>
                </div>
                <div class="panel-body" style="height: 420px;overflow:auto;">
                    <ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class=" panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">用户列表</h3>
                </div>
                <div class="panel-body">
                    <div id="toolbar" class="btn-group">
                        <button id="btn_add" type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                    </div>
                    <table id="telrecord-grid"
                           data-toggle="table"
                           data-url="/user/query"
                           data-side-pagination="server"
                           data-query-params-type="not-limit"
                           data-toolbar="#toolbar"
                           data-pagination="true"
                           data-sort-order="desc"
                           data-undefined-text=""
                           data-show-columns="true"
                           data-show-refresh="true"
                           data-show-toggle="true"
                           data-search="false"
                           data-page-size="5"
                           data-page-list="[5,10,20,50]"
                           data-id-field="id" >
                        <thead>
                        <tr>
                            <th data-field="state" data-checkbox ="true" ></th>
                            <th data-field="id" data-visible="false"  data-switchable="false">id</th>
                            <th data-field="logincode" data-sortable="true">登录号</th>
                            <th data-field="name" data-sortable="true">用户姓名</th>
                            <th data-field="orgName" data-sortable="true">所属机构</th>
                            <th data-field="tel" data-sortable="true">联系电话</th>
                            <th data-field="action" data-formatter="actionFormatter">操作</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var zTree;
    var demoIframe;
    var treeNodes;
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function(treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                var orgs="["+getChildNodes(treeNode)+"]";

                userQuery(orgs);
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                }
                return true;
            }
        }
    };



    function userQuery(orgs){
        $('#telrecord-grid').bootstrapTable(
                "refresh",
                {
                    url:"/user/query?nodes="+orgs
                });
    }

    function getChildNodes(treeNode){
        var result=treeNode.id;
        if (treeNode.isParent) {
            var childrenNodes = treeNode.children;
            if (childrenNodes) {
                for (var i = 0; i < childrenNodes.length; i++) {
                    result +=","+ getChildNodes(childrenNodes[i]);
                }
            }
        }
        return result;
    }

    function actionFormatter(value, row, index){
        var edit="<a href='javascript:userEdit("+row.id+");'>修改</a> | ";
        var del="<a href='javascript:userDel("+row.id+");'>删除</a> | ";
        var resetPass="<a href='javascript:userResetPass("+row.id+");'>重置密码</a>";
        return edit+del+resetPass;
    }



    function userEdit(id){
        var dialog=new BootstrapDialog({
            title:"用 户 编 辑",
            message:$('<div></div>').load('/user/dialog?id='+id),
            draggable:true,
            buttons:[{
                label: '&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;',
                cssClass: 'btn-primary',
                action: function(dialog) {
                    $.post('/user/save', $('#user-edit-form').serialize(), function (data) {
                        alert(data.message);
                    });

                    dialog.close();
                }
            },{
                label: '&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;',
                cssClass: 'btn-warning',
                action: function(dialog) {
                    dialog.close();
                }
            }
            ]
        });
        //dialog.setType(BootstrapDialog.TYPE_INFO);
        // dialog.setSize(BootstrapDialog.SIZE_NORMAL);


        dialog.open();
    }

    function userDel(id){
        var dialog=new BootstrapDialog({
            title:"确 认 窗 口",
            message:"确认删除该记录？",
            draggable:true,
            buttons:[{
                label: '&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;',
                cssClass: 'btn-primary',
                action: function(dialog) {
                    $.post('/user/delete',{"id":id}, function (data) {
                        alert(data.message);
                    });

                    dialog.close();
                }
            },{
                label: '&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;',
                cssClass: 'btn-warning',
                action: function(dialog) {
                    dialog.close();
                }
            }
            ]
        });
        //dialog.setType(BootstrapDialog.TYPE_INFO);
        // dialog.setSize(BootstrapDialog.SIZE_NORMAL);


        dialog.open();
    }



    function userResetPass(id){
        var dialog=new BootstrapDialog({
            title:"确 认 窗 口",
            message:"确认重置该用户密码？",
            draggable:true,
            buttons:[{
                label: '&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;',
                cssClass: 'btn-primary',
                action: function(dialog) {
                    $.post('/user/resetPass',{"id":id}, function (data) {
                        alert(data.message);
                    });

                    dialog.close();
                }
            },{
                label: '&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;',
                cssClass: 'btn-warning',
                action: function(dialog) {
                    dialog.close();
                }
            }
            ]
        });
        //dialog.setType(BootstrapDialog.TYPE_INFO);
        // dialog.setSize(BootstrapDialog.SIZE_NORMAL);


        dialog.open();
    }




    $("#btn_add").on("click",function(){
        var dialog=new BootstrapDialog({
            title:"用 户 编 辑",
            message:$('<div></div>').load('/user/dialog?id=0'),
            draggable:true,
            buttons:[{
                label: '&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;',
                cssClass: 'btn-primary',
                action: function(dialog) {
                    $.post('/user/save', $('#user-edit-form').serialize(), function (data) {
                        alert(data.message);
                    });

                    dialog.close();
                }
            },{
                label: '&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;',
                cssClass: 'btn-warning',
                action: function(dialog) {
                    dialog.close();
                }
            }
            ]
        });
        //dialog.setType(BootstrapDialog.TYPE_INFO);
        // dialog.setSize(BootstrapDialog.SIZE_NORMAL);


        dialog.open();
    })

    $("#btn_delete").on("click",function(){
       var selects= $('#telrecord-grid').bootstrapTable("getSelections");

        if(selects.length>0){
            var ids="[";
            for(var i=0;i<selects.length;i++){
                if(i>0){
                    ids+=","
                }
                ids+=selects[i].id;
            }
            ids+="]";
            var dialog=new BootstrapDialog({
                title:"确 认 窗 口",
                message:"确认删除记录？",
                draggable:true,
                buttons:[{
                    label: '&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;',
                    cssClass: 'btn-primary',
                    action: function(dialog) {
                        $.post('/user/deleteRows',{"rows":ids}, function (data) {
                            alert(data.message);
                            dialog.close();
                        });
                    }
                },{
                    label: '&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;',
                    cssClass: 'btn-warning',
                    action: function(dialog) {
                        dialog.close();
                    }
                }
                ]
            });
            dialog.open();
        }else{
            alert("请选择记录后，再删除！");
        }
    })




    $(function(){
        $.post("/org/orgTree",function(data){
            treeNodes=data;
            $.fn.zTree.init($("#tree"), setting,treeNodes);
           // $('#telrecord-grid').bootstrapTable();
        });
    })
</script>
</body>