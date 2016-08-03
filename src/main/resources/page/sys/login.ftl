<head>
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="/js/dist/css/AdminLTE.css"/>
</head>
<body>
<div class="login-box">
    <div class="row" align="center">
        <h3>融托金融-----客户管理系统</h3>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">用户登录</h3>
                </div>
                <div class="panel-body">
                    <form id="loginForm" action="" method="post">
                        <div class="form-group has-feedback">
                            <input id="logincode" name="logincode" type="text" class="form-control" placeholder="用户名"/>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <input id="password" name="password" type="password" class="form-control" placeholder="密  码"/>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <span class="text-red">${message?default("")}</span>
                        </div>
                        <div class="row">
                            <div class="col-xs-4 pull-left">
                                <button id="loginButton" type="button" class="btn btn-primary btn-block btn-flat">登 录</button>
                            </div>
                            <!-- /.col -->
                            <div class="col-xs-4 pull-right">
                                <button id="reset" type="reset" class="btn btn-primary btn-block btn-flat">重 置</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <div class="social-auth-links text-center">
        </div>
        <!-- /.social-auth-links -->
    </div>
    <!-- /.login-box-body -->
</div>
<script type="text/javascript">
    $("#loginButton").click(function (){
        $("#loginForm").attr('action', '/login').submit();
    })
</script>
</body>