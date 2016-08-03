<head>
    <title>机构管理</title>
    <link rel="stylesheet" type="text/css" href="/js/ztree/css/zTreeStyle/zTreeStyle.css" />
    <script type="text/javascript" src="/js/ztree/js/jquery.ztree.all.js"></script>
</head>
<body>
<div class="breadcrumb">
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">机构树</h3>
                </div>
                <div class="panel-body" style="height: 420px;overflow:auto;" id="menu">
                    <ul id="tree" class="ztree" style="overflow:auto;"></ul>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class=" panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">机构详情</h3>
                </div>
                <div class="panel-body">
                    <form id="org-edit-form" method="post" class="form-horizontal">
                        <input type="hidden" id="id" name="id">
                        <input type="hidden"  id="parentId" name="parentId">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">机构名称：</label>
                            <div class="col-sm-8 required">
                                <input type="text" class="form-control" id="name" name="name"
                                       placeholder="请输入机构名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="parentName" class="col-sm-2 control-label">所属机构：</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" id="parentName" name="parentName" readonly class="form-control form-tree" placeholder="请选择所属机构">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default  dropdown-toggle"
                                                data-toggle="dropdown" tabindex="-1">
                                            <span class="caret"></span>
                                            <span class="sr-only">切换下拉菜单</span>
                                        </button>
                                        <ul class="dropdown-menu pull-right">
                                            <ul id="tree2" class="ztree"
                                                style="width:260px; height: 300px;overflow:auto;"/>
                                        </ul>
                                    </div>
                                    <!-- /btn-group -->
                                </div>
                                <!-- /input-group -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contacts" class="col-sm-2 control-label">联系人：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="contacts" name="contacts"
                                       placeholder="请输入机构电话">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-sm-2 control-label">联系电话：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="tel" name="tel"
                                       placeholder="请输入机构电话">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label">地址：</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="address" name="address"
                                       placeholder="请输入机构地址">
                            </div>
                        </div>
                        <div class="form-group" align="center">
                            <a id="save" class="btn btn-success" href="javascript:saveOrg()">保　存</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a id="cancel" class="btn btn-warning" href="javascript:orgCancel()">取　消</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<ul class="dropdown-menu" id="contextMenu">
    <li>
        <a href="javascript:addOrg();"><i class="fa fa-plus"></i><span>添加同级</span></a>
    </li>
    <li>
        <a href="javascript:addChildOrg();"><i class="fa fa-pencil-square-o"></i><span>添加下级</span></a>
    </li>
    <li>
        <a href="javascript:delOrg();;"><i class="fa fa-times"></i><span>删除</span></a>
    </li>
</ul>
<script type="text/javascript">
    var zTree;
    var demoIframe;
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                orgQuery(treeNode.id);
                if (treeNode.isParent) {
                    zTree.expandNode(treeNode);
                }
                return true;
            }
        }
    };

    var setting2 = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                $("#parentId").val(treeNode.id);
                $("#parentName").val(treeNode.name);
                return true;
            }
        }
    };


    function orgQuery(id) {
        $.post('/org/findOrgById',
                {id: id},
                function (data) {

                    $("#id").val(data.id);
                    $("#name").val(data.name);
                    $("#parentId").val(data.parentId);
                    $("#contacts").val(data.contacts);
                    $("#tel").val(data.tel);
                    $("#address").val(data.address);
                    var parentId=data.parentId;
                    if(parentId!=null){
                        var zTree = $.fn.zTree.getZTreeObj("tree2");
                        var node = zTree.getNodeByParam("id",parentId);
                        if(node!=null) {
                            $("#parentName").val(node.name);
                            zTree.selectNode(node);
                        }else{
                            $("#parentName").val("/");
                        }

                    }else{
                        $("#parentName").val("/");
                    }
                });
    };

    function addOrg(){
        var zTree = $.fn.zTree.getZTreeObj("tree");
        var nodes=zTree.getSelectedNodes();
        var parent=nodes[0].getParentNode();

//        var child= new ZtreeNode(1000, parent.id, "新增机构"); //构造子节点
//        zTree.addNodes(parent,child,true);
//        //alert(node2.id+""+child.id);
//        zTree.selectNode(child);
        if(parent!=null){
            newOrg(parent.id);
        }else{
            newOrg(0);
        }

        $("#contextMenu").stop().fadeOut(200);
    };

    function addChildOrg(){
        var zTree = $.fn.zTree.getZTreeObj("tree");
        var nodes=zTree.getSelectedNodes();
        var parent=nodes[0];

//        var child= new ZtreeNode(1000, parent.id, "新增机构"); //构造子节点
//        zTree.addNodes(parent,child,true);
//        zTree.expandNode(parent);
//
//        //alert(node2.id+""+child.id);
//        zTree.selectNode(child);
        newOrg(parent.id);
        $("#contextMenu").stop().fadeOut(200);
    };

    function newOrg(parentId){
        $("#id").val(null);
        $("#name").val("");
        $("#parentId").val(parentId);
        $("#contacts").val("");
        $("#tel").val("");
        $("#address").val("");
        var parentId=parentId;
        if(parentId!=null){
            var zTree = $.fn.zTree.getZTreeObj("tree2");
            var node = zTree.getNodeByParam("id",parentId);
            if(node!=null) {
                $("#parentName").val(node.name);
                zTree.selectNode(node);
            }else{
                $("#parentName").val("/");
            }

        }else{
            $("#parentName").val("/");
        }
    }



    function delOrg(){
        var zTree = $.fn.zTree.getZTreeObj("tree");
        var nodes=zTree.getSelectedNodes();
        var node=nodes[0];
        if(node.isParent){
            alert("存在下级机构，不能删除！");
        }else{

            //zTree.removeNode(node);

            $.post('/org/orgDelete', {id : node.id}, function (data) {
                if(data.result==1){
                    $.fn.zTree.init($("#tree"), setting, data.nodes);
                    $.fn.zTree.init($("#tree2"), setting2, data.nodes);
                }
                alert(data.message);
            });

        }

        $("#contextMenu").stop().fadeOut(200);
    };


    function orgCancel(){
        var id=$("#id").val();
        if(id!=null){
            orgQuery(id);
        }

    };

    function ZtreeNode(id, pId, name) {//定义ztree的节点类
        this.id = id;
        this.pId = pId;
        this.name = name;
    };

    function orgSelect(treeNode) {
        var id = $("#id").val();
        if (id == null) {
            $("#parentId").val(treeNode.id);
            $("#parentName").val(treeNode.name);
            return true;
        }
        if (id == treeNode.id) {
            alert("不能选择本机构作为上级");
            return false;
        }
        if (isParent(id, treeNode)) {
            alert("不能选择子机构作为上级");
            return false;
        }
        $("#parentId").val(treeNode.id);
        $("#parentName").val(treeNode.name);
        return true;
    }

    function isParent(id, treeNode) {
        var node = treeNode.getParentNode();
        if (node == null) {
            return false;
        }
        if (node.id == id) {
            return true;
        } else {
            return isParent(id, node);
        }
    }


    function saveOrg() {
        $.post('/org/orgSave', $('#org-edit-form').serialize(), function (data) {
            if(data.result==1){
                $.fn.zTree.init($("#tree"), setting, data.nodes);
                $.fn.zTree.init($("#tree2"), setting2, data.nodes);
                var id=$("#id").val();
                var parentId=$("#parentId").val();
                selectNode("tree",id);
                selectNode("tree2",parentId);
            }
            alert(data.message);
        });
    };

    function selectNode(tree,nodeId){
       var tree2= $.fn.zTree.getZTreeObj(tree);
       var node= tree2.getNodeByParam("id",nodeId);
        tree2.selectNode(node);
    };



    //文档对象注册鼠标按下事件；
    $("#menu").on("mousedown", function (event) {
        //button等于0代表左键，button等于1代表中键
        if (event.button == 0 || event.button == 1) {
            $("#contextMenu").stop().fadeOut(200);//获取菜单停止动画，进行隐藏使用淡出效果
        }
    });

    //文档对象注册上下文（右键）菜单事件
    $("#menu").on("contextmenu", function (event) {

        var zTree = $.fn.zTree.getZTreeObj("tree");
        var node=zTree.getSelectedNodes();
        if(node[0]==null){
            return;
        }
       // alert(node[0].id);

        var pageX = event.pageX;//鼠标单击的x坐标
        var pageY = event.pageY;//鼠标单击的y坐标
        //获取菜单
        var contextMenu = $("#contextMenu");
        var cssObj = {
            top: pageY + "px",//设置菜单离页面上边距离，top等效于y坐标
            left: pageX + "px"//设置菜单离页面左边距离，left等效于x坐标
        };
        //判断横向位置（pageX）+自定义菜单宽度之和，如果超过页面宽度及为溢出，需要特殊处理；
        var menuWidth = contextMenu.width();
        var pageWidth = $(document).width();
        if (pageX + contextMenu.width() > pageWidth) {
            cssObj.left = pageWidth - menuWidth - 5 + "px"; //-5是预留右边一点空隙，距离右边太紧不太美观；
        }
        //设置菜单的位置
        $("#contextMenu").css(cssObj).stop().fadeIn(200);//显示使用淡入效果,比如不需要动画可以使用show()替换;

        event.preventDefault();//阻止浏览器与事件相关的默认行为；此处就是弹出右键菜单
    });


    $().ready(function () {
        $.post("/org/orgTree", function (data) {
            $.fn.zTree.init($("#tree"), setting, data);
            $.fn.zTree.init($("#tree2"), setting2, data);
        });

    })
</script>
</body>