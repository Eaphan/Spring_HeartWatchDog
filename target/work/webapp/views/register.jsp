<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/13
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册-心狗健康信息管理系统</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/login/font-awesome.min.css">
    <link rel="stylesheet" href="/css/login/form-elements.css">
    <link rel="stylesheet" href="/css/login/style.css">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/images/bitbug_favicon.ico"/>
</head>
<body onload="tishi()">

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Welcome</strong></h1>
                    <!--<div class="description">
                        <p>
                            登陆后您可以查看个人心电图、医疗报告等信息。
                            关于心狗：<a href="http://www.heart-watchdog.com/"><strong>访问官网</strong></a>
                        </p>
                    </div>-->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>欢迎注册心狗健康信息管理系统</h3>
                        </div>
                        <div class="form-top-right">
                            <%--<i class="fa fa-lock"></i>--%>
                                <img src="images/logo_sin.jpg">
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form action="UserServlet?action=reg" method="post" class="login-form"
                              onSubmit="return reg(this);">
                            <div class="form-group">
                                <input type="text" name="username" placeholder="请输入用户名..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="tel" name="phone" placeholder="请输入手机号..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="email" name="eamil" placeholder="请输入邮箱地址..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" name="passwd" placeholder="请输入密码(6-18位)..." maxlength="18"
                                       minlength="6" class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" name="passwd1" placeholder="请确认密码..."
                                       class="form-username form-control">
                            </div>
                            <button type="submit" class="btn" >注册</button><br>
                            <button type="button" onclick="javascript:window.location.href='login.jsp';" class="btn">已有账号?立即登录</button>
                        </form>
                    </div>
                </div>
            </div>
            <%--
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3 social-login">
                                <h3>...or login with:</h3>
                                <div class="social-login-buttons">
                                    <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                                        <i class="fa fa-facebook"></i> Facebook
                                    </a>
                                    <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                                        <i class="fa fa-twitter"></i> Twitter
                                    </a>
                                    <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                                        <i class="fa fa-google-plus"></i> Google Plus
                                    </a>
                                </div>
                            </div>
                        </div>
            --%>
        </div>
        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<%
    String info = (String) request.getAttribute("info");
    if(info!=null&&! info.equals("")){
%>
<%--
这里对info进行处理，否则info为空时，value=null后面js中数据类型出错
--%>
<input id="tishi" type="hidden" value="<%=info%>">
<%}else{%>
<input id="tishi" type="hidden">
<%}%>
<script>
    function tishi(){
        var a=document.getElementById("tishi").value;
        if(a===null||a==''){}
        else{
            swal({title:"提示",text:a,type:"warning"});
        }
    }
</script>
<script type="text/javascript">
    function reg(form) {
        if (form.username.value == "") {
            swal({title:"错误",text:"用户名不能为空！",type:"info"});
            return false;
        }
        if (form.passwd.value == "") {
            swal({title:"错误",text:"密码不能为空！",type:"warning"});
            return false;
        }
        if (form.passwd1.value == "") {
            swal({title:"错误",text:"确认密码不能为空！",type:"warning"});
            return false;
        }
        if (form.passwd.value != form.passwd1.value) {
            swal({title:"错误",text:"两次输入密码不一致！",type:"error"});
            return false;
        }
        if (form.phone.value == "") {
            swal({title:"错误",text:"联系电话不能为空！",type:"question"});
            return false;
        }
        if (form.email.value == "") {
            swal({title:"错误",text:"电子邮箱不能为空！",type:"warning"});
            return false;
        }
    }

</script>
<!-- Javascript -->
<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.backstretch.min.js"></script>
<script src="/js/sweet-alert.min.js"></script>
<script>
    jQuery(document).ready(function () {

        /*
         Fullscreen background
         */
        $.backstretch("/images/reg_bg.jpg");
        /*
         Form validation
         */
        $('.login-form input[type="text"], .login-form input[type="password"], .login-form input[type="email"], .login-form input[type="tel"], .login-form textarea').on('focus', function () {
            $(this).removeClass('input-error');
        });
        $('.login-form').on('submit', function (e) {

            $(this).find('input[type="text"], input[type="password"],input[type="email"], input[type="tel"],  textarea').each(function () {
                if ($(this).val() == "") {
                    e.preventDefault();
                    $(this).addClass('input-error');
                }
                else {
                    $(this).removeClass('input-error');
                }
            });
        });
    });
</script>
</body>

</html>
