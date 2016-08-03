<body>
<form id="operator-edit-form" method="post" class="form-horizontal">
    <input type="hidden" id="id" name="id" value="${tbUser.id?default("")}">
    <input type="hidden" id="orgId" name="orgId" value="${tbUser.orgId?default("")}">
    <div class="form-group">
        <label for="logincode" class="col-sm-3 control-label">登录号：</label>
        <div class="col-sm-8 required">
            <input type="text" class="form-control" id="logincode" name="logincode" value="${tbUser.logincode?default("")}"
                   placeholder="请输入登录号">
        </div>
    </div>
    <div class="form-group">
        <label for="name" class="col-sm-3 control-label">用户姓名：</label>
        <div class="col-sm-8 required">
            <input type="text" class="form-control" id="name" name="name" value="${tbUser.name?default("")}"
                   placeholder="请输入用户姓名">
        </div>
    </div>
    <div class="form-group">
        <label for="orgName" class="col-sm-3 control-label">所属机构：</label>
        <div class="col-sm-8 required">
            <div class="input-group">
                <input type="text" id="orgName" name="orgName" readonly class="form-control form-tree"
                       placeholder="请选择所属机构" value="${tbUser.orgName?default("")}">
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
        <label for="role" class="col-sm-3 control-label">用户角色：</label>
        <div class="col-sm-8  required">
            <select class="form-control" name="role" id="role">
                <option value="">请选择用户角色</option>
                <option value="1">普通用户</option>
                <option value="2">管理员</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="tel" class="col-sm-3 control-label">联系电话：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="tel" name="tel" value="${tbUser.tel?default("")}"
                   placeholder="请输入机构电话">
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-3 control-label">地址：</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="address" name="address" value="${tbUser.address?default("")}"
                   placeholder="请输入机构地址">
        </div>
    </div>
</form>
<script type="text/javascript" src="/js/star.js"></script>
<script type="text/javascript">
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
                $("#orgId").val(treeNode.id);
                $("#orgName").val(treeNode.name);
                return true;
            }
        }
    };

    $(function () {
      //  $(".dropdown-toggle").dropdown();

       // var treeNodes2=window.dialogArguments;
        $("#role").val(${tbUser.role?default("")});
        $.fn.zTree.init($("#tree2"), setting2,treeNodes);
    })

</script>
</body>