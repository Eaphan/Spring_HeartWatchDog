<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登陆-心狗健康信息管理系统</title>
    <link rel="shortcut icon" href="/images/bitbug_favicon.ico"/>
    <!-- CSS -->
    <%--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">--%>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/login/font-awesome.min.css">
    <link rel="stylesheet" href="/css/login/form-elements.css">
    <link rel="stylesheet" href="/css/login/style.css">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
    <link rel="shortcut icon" href="/images/bitbug_favicon.ico"/>
</head>

<!-- Top content -->
<div class="top-content">
    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Welcome!</strong></h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>欢迎登录心狗健康信息管理系统</h3>
                        </div>
                        <div class="form-top-right">
                            <%--<i class="fa fa-lock"></i>--%>
                            <%--<i href="/images/logo_sin.jpg"></i>--%>
                            <img src="/images/logo_sin.jpg">
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form action="processUserLogin" class="login-form" method="post" onSubmit="return login(this);" >
                            <input name="scale" type="hidden" id="scale"/>
                            <div class="form-group">
                                <input type="text" name="uname" placeholder="请输入用户名..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" name="passwd" placeholder="请输入密码..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="text" name="checkcode" placeholder="请输入验证码..."
                                       class="form-username form-control">
                            </div>
                            <div>
                                <img id="image" border="0" onclick="refresh()" src="${pageContext.request.contextPath}/getCheckCodeImage" title="点击更换图片">
                            </div>
                            <div class="checkbox" >
                                <label class="checkbox-inline">
                                    <input type="radio"  name="usertype" value="1" checked> 用户
                                </label>
                                <lable class="checkbox-inline">
                                    <input type="radio" name="usertype" value="2"> 医生
                                </lable>
                                <span style="float: right;"><a href="#" target="_blank">忘记密码？</a></span>
                            </div>
                            <button type="submit" class="btn" >登录</button><br>
                            <button type="button" onclick="javascript:window.location.href='/register';" class="btn">还没有账号?马上注册</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Javascript -->
<script src="/js/jquery-1.11.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.backstretch.min.js"></script>
<script src="js/scripts.js"></script>
<script src="/js/sweet-alert.min.js"></script>

<script type="text/javascript">
    function refresh() {
        //IE存在缓存,需要new Date()实现更换路径的作用
        document.getElementById("image").src = "/getCheckCodeImage?date="+new Date().getTime();
    }
    function login(form) {
        var user_type =$("input[name='usertype']:checked").val();
        if (user_type=="1"){
            $("form").attr("action", "processUserLogin");
        }else {
            $("form").attr("action", "processDoctorLogin");
        }
        if (form.uname.value == "") {
            swal({title:"警告",text:"用户不能为空！",type:"warning"});
            return false;
        }
        if (form.passwd.value == "") {
            swal({title:"警告",text:"密码不能为空！",type:"warning"});
            return false;
        }
        if (form.code.value == "") {
            swal({title:"警告",text:"验证码不能为空！",type:"warning"});
            return false;
        }
    }
</script>
</body>
</html>
