<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="homepage" class="site_title"><img class="img-circle" src="/images/logo_sin.jpg" width="30px" height="30px"></img><span>心狗健康管理系统</span></a>
        </div>
        <div class="clearfix"></div>
        <br/>
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <li><a href="homepage"><i class="fa fa-home"></i> 首页 </a></li>
                    <li><a href="#"><i class="fa fa-table"></i> 诊断内容/记录 </a>
                        <ul class="nav child_menu">
                            <li><a href="infoTime">心电检测</a></li>
                            <li><a href="#">24小时holter</a></li>
                            <li><a href="#">尿液分析</a></li>
                            <li><a href="#">体脂检测</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-signal"></i> 趋势显示/分析 </a></li>
                    <li><a href="#"><i class="fa fa-id-card-o"></i> 健康档案管理 </a>
                        <ul class="nav child_menu">
                            <li><a href="#">上传/下载报告</a></li>
                            <li><a href="#">编辑体检报告</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="fa fa-file"></i> 电子病历 </a></li>
                    <li><a href="relaManage"><i class="fa fa-list-ul"></i> 亲友管理 </a></li>
                    <li><a href="#"><i class="fa fa-user-md"></i> 私人医生 </a></li>
                    <li><a href="#"><i class="fa fa-user"></i> 个人信息 </a></li>
                    <li><a href="chat"><i class="fa fa-bell"></i> 聊天信息 </a></li>
                    <li><a href="#"><i class="fa fa-gear"></i> 账户设置 </a></li>
                    <li><a href="#"><i class="fa fa-sign-out"></i> 退出登录 </a></li>
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
                        当前用户:${user.uname}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="count"> 账户设置</a></li>
                        <li><a href="help"> 帮助</a></li>
                        <li><a href="quit"><i class="fa fa-sign-out pull-right"></i> 退出</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->