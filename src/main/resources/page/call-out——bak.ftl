<head>
    <title>新建外呼</title>
</head>
<body>
<div class="breadcrumb">
    <form action="#" method="get" class="form-horizontal">
        <fieldset >
            <legend style="border-width: 1px; border-color: #ff851b; width:95%; ">客户信息</legend>
            <div class="row">
                <label for="name1" class="col-sm-1 control-label" style="width: 102px">客户姓名：</label>
                <div class="col-sm-4">
                    <input type="text"  class="form-control input-sm" id="name1" placeholder="请输入客户姓名">
                </div>
                <label for="optionsRadiosinline" class="col-sm-1 control-label" style="width: 102px">客户性别：</label>
                <div class="col-sm-4">
                    <label class="checkbox-inline">
                        <input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="option1" checked> 先生
                    </label>
                    <label class="checkbox-inline">
                        <input type="radio" name="optionsRadiosinline" id="optionsRadios4" value="option2"> 女士
                    </label>
                </div>
            </div>
            <br>
            <div class="row">
                <label for="name3" class="col-sm-1 control-label" style="width: 102px">证件类型：</label>
                <div class="col-sm-4">
                    <select class="form-control" name="name3" id="name3">
                        <option>请选择证件类型</option>
                        <option>身份证</option>
                        <option>军官证</option>
                        <option>营业执照</option>
                    </select>
                </div>
                <label for="name4" class="col-sm-1 control-label" style="width: 102px">证件号码：</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="name4"  placeholder="请输入证件号码">
                </div>
            </div>
            <br>
            <div class="row">
                <label for="name5" class="col-sm-1 control-label" style="width: 102px">客户类型：</label>
                <div class="col-sm-4">
                    <label class="checkbox-inline">
                        <input type="radio" name="name5" id="optionsRadios3"
                               value="option1" checked> 个人
                    </label>
                    <label class="checkbox-inline">
                        <input type="radio" name="name5" id="optionsRadios4"
                               value="option2"> 对公
                    </label>
                </div>
                <label for="name6"class="col-sm-1 control-label" style="width: 102px">客户电话：</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="name6" name="name6"
                           placeholder="请输入客户电话">
                </div>
            </div>
            <br>
        </fieldset>
        <fieldset >
            <legend style="border-width: 1px; border-color: #ff851b; width:95%; ">代办人信息</legend>

        </fieldset >

        <div class="row">
            <label for="name3" class="col-sm-1 control-label" style="width: 102px">业务类型：</label>
            <div class="col-sm-4">
                <select class="form-control" name="name3" id="name3">
                    <option>身份证</option>
                    <option>军官证</option>
                    <option>营业执照</option>
                </select>
            </div>
            <label for="name6" class="col-sm-1 control-label" style="width: 102px">业务电话：</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="name6" name="name6"
                       placeholder="请输入业务电话">
            </div>
        </div>
        <br>
        <div class="row">
            <label for="name11" class="col-sm-1 control-label" style="width: 102px">业务描述：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="name11" id="name11" placeholder="请输入业务描述"></textarea>
            </div>
        </div>
        <br>
        <div class="row" align="center">
            <button type="submit" class="btn btn-success">提　交</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="submit" class="btn btn-warning">取　消</button>
        </div>
        <br>
    </form>
</div>


</body>