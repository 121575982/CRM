<header class="main-header">
    <!-- Logo -->
    <a href="main" class="logo">${name}</a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">切换导航</span>
        </a>


        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-user"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                    <#--<li class="user-header bg-light-blue">-->
                    <#--<p>-->
                    <#--</p>-->
                    <#--</li>-->
                        <!-- Menu Footer-->
                        <li class="user-header" style="font-size: 16px;line-height: 18px;">
                            <p align="left">姓名：<span id="name">用户1</span></p>

                            <p align="left">工号：<span id="agentWorkNo">1601</span></p>
                        </li>
                    </ul>
                </li>
                <li>
                    <a id="rightBarControl" href="#" data-toggle="control-sidebar"><i class="fa fa-cog"></i> </a>
                </li>
                <li>
                    <a id="logout" href="/logout"><i class="fa fa-power-off"></i> </a>
                </li>
            </ul>
        </div>
    </nav>

</header>