<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="home" class="site_title"><img class="img-circle" src="/images/logo_sin.jpg" width="30px" height="30px"></img><span>心狗健康管理系统</span></a>
        </div>
        <div class="clearfix"></div>
        <br/>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li><a href="/home"><i class="fa fa-home"></i> 首页 </a></li>
                    <li><a><i class="fa fa-list-ul"></i> 患者管理 </a></li>
                    <li><a><i class="fa fa-user-md"></i> 个人名片 </a></li>
                    <li><a href="/doctor/chat"><i class="fa fa-bell"></i> 聊天信息 </a></li>
                    <li><a><i class="fa fa-gear"></i> 账户设置 </a></li>
                    <li><a><i class="fa fa-envelope"></i> 意见反馈 </a></li>
                    <li><a><i class="fa fa-sign-out"></i> 退出登录 </a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        当前用户:John Doe
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="javascript:;"> Profile</a></li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->