<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>心狗健康管理系统</title>
    <link rel="shortcut icon" href="/images/bitbug_favicon.ico"/>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <!-- Custom Theme Style -->
    <link href="/css/custom.min.css" rel="stylesheet">
    <style>
      .bg-success {
        clear: both;
        float: right;
        width: 80%;
        text-align: right;
        display: block;
        margin-bottom: 10px;
      }
      .bg-info {
        clear: both;
        float: left;
        width:80%;
        display: block;
        margin-bottom: 10px;
      }
    </style>
  </head>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <%@include file="sidebar.jsp"%>
      <!-- page content -->
      <div class="right_col" role="main">
        <div class="col-md-3 col-sm-3 col-xs-3">
          <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">当前登录用户</h3>
            </div>
            <div class="panel-body">
              <div class="list-group">
                <a href="#" class="list-group-item">你好，${doctor.uname}</a>
                <%--<a href="logout" class="list-group-item">退出</a>--%>
              </div>
            </div>
          </div>
          <div class="panel panel-primary" id="online">
            <div class="panel-heading">
              <h3 class="panel-title">当前在线的其他用户</h3>
            </div>
            <div class="panel-body">
              <div class="list-group" id="users"></div>
            </div>
          </div>
        </div>
        <div class="col-md-9 col-sm-9 col-xs-9">
          <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title" id="talktitle"></h3>
            </div>
            <div class="panel-body">
              <div class="well" id="log-container" style="height:400px;overflow-y:scroll"></div>
              <input type="text" id="myinfo" class="form-control col-md-12" onkeydown="send(event)"> <br>
              <%--<script id="editor" type="text/plain" style="width:1024px;height:200px;"/>--%>

                <%--<script type="text/plain" id="myinfo" class="form-control col-md-12" /> <br>--%>
              <button id="send" type="button" class="btn btn-primary">发送</button>
            </div>
          </div>
        </div>

      </div>
      <!-- /page content -->

      <!-- footer content -->
      <footer>
        <div class="pull-right">
          &copy <a href="http://www.heart-watchdog.com/">上海夏先机电科技发展有限公司</a> 版权所有 2014-2016 服务热线:400-775-2629
        </div>
        <div class="clearfix"></div>
      </footer>
      <!-- /footer content -->
    </div>
  </div>
  <!-- jQuery -->
<script src="/js/jquery.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="/js/custom.min.js"></script>
<%--<script src="/js/ueditor.config.js"></script>--%>
<%--<script src="/js/ueditor.all.min.js"></script>--%>
<%--<script type="text/javascript">--%>
    <%--var ue = UE.getEditor("myinfo");--%>
<%--</script>--%>
<script>
    $(document).ready(function() {
        // 指定websocket路径
        var websocket;
        if ('WebSocket' in window) {
            websocket = new WebSocket("ws://localhost:8080/ws?uid="+${doctor.uid});
//            alert("当前浏览器支持websocket")
        } else if ('MozWebSocket' in window) {
            websocket = new MozWebSocket("ws://localhost:8080/ws"+${doctor.uid});
        } else {
            websocket = new SockJS("http://localhost:8080/ws/sockjs"+${doctor.uid});
        }
        //var websocket = new WebSocket('ws://localhost:8080/Spring-websocket/ws');
        websocket.onmessage = function(event) {
            var data=JSON.parse(event.data);
            if(data.from>0||data.from==-1){//用户或者群消息
                // 接收服务端的实时消息并添加到HTML页面中
                $("#log-container").append("<div class='bg-info'><label class='text-danger'>"+data.fromName+"&nbsp;"+data.date+"</label><div class='text-success'>"+data.text+"</div></div><br>");
                // 滚动条滚动到最低部
                scrollToBottom();
            }else if(data.from==0){//上线消息
                if(data.text!="${doctor.uname}")
                {
                    $("#users").append('<a href="#" onclick="talk(this)" class="list-group-item">'+data.text+'</a>');
                    alert(data.text+"上线了");
                }
            }else if(data.from==-2){//下线消息
                if(data.text!="${doctor.uname}")
                {
                    $("#users > a").remove(":contains('"+data.text+"')");
                    alert(data.text+"下线了");
                }
            }
        };
        $.post("/onlinepatients",function(data){
            for(var i=0;i<data.length;i++)
                $("#users").append('<a href="#" onclick="talk(this)" class="list-group-item">'+data[i]+'</a>');
        });


        $("#send").click(
            function(){
                $.post("/getuid",{"username":$("body").data("to")},function(d){
                    var v=$("#myinfo").val();
                    if(v==""){
                        return;
                    }else{
                        var data={};
                        data["from"]="${doctor.uid}";
                        data["fromName"]="${doctor.uname}";
                        data["to"]=d.uid;
                        data["text"]=v;
                        websocket.send(JSON.stringify(data));

//                    var nowDate = new Date();
                        var nowDate = new Date();
                        var year= nowDate.getFullYear();
                        var month = nowDate.getMonth()+1;
                        var today = nowDate.getDate();
                        var hours = nowDate.getHours();
                        var minutes = nowDate.getMinutes();
                        var seconds = nowDate.getSeconds();

                        if(month >= 1 && month <=9){
                            month = "0" + month;
                        }
                        if(today >= 1 && today <=9){
                            today = "0" + today;
                        }
                        if(hours >= 0 && hours <=9){
                            hours = "0" + hours;
                        }
                        if(minutes >= 0 && minutes <=9){
                            minutes = "0" + minutes;
                        }
                        if(seconds >= 0 && seconds <=9){
                            seconds = "0" + seconds;
                        }
                        var sendTime = year + "-" + month + "-" + today + " " + hours + ":" +minutes + ":" +seconds;
                        $("#log-container").append("<div class='bg-success'><label class='text-info'>我&nbsp;"+sendTime+"</label><div class='text-info'>"+v+"</div></div><br>");
                        scrollToBottom();
                        $("#myinfo").val("");
                    }
                });
            }
        );

        function sendMsg(){
            $.post("/getuid",{"username":$("body").data("to")},function(d){
                var v=$("#myinfo").val();
                if(v==""){
                    return;
                }else{
                    var data={};
                    data["from"]="${doctor.uid}";
                    data["fromName"]="${doctor.uname}";
                    data["to"]=d.uid;
                    data["text"]=v;
                    websocket.send(JSON.stringify(data));

//                    var nowDate = new Date();
                    var nowDate = new Date();
                    var year= nowDate.getFullYear();
                    var month = nowDate.getMonth()+1;
                    var today = nowDate.getDate();
                    var hours = nowDate.getHours();
                    var minutes = nowDate.getMinutes();
                    var seconds = nowDate.getSeconds();

                    if(month >= 1 && month <=9){
                        month = "0" + month;
                    }
                    if(today >= 1 && today <=9){
                        today = "0" + today;
                    }
                    if(hours >= 0 && hours <=9){
                        hours = "0" + hours;
                    }
                    if(minutes >= 0 && minutes <=9){
                        minutes = "0" + minutes;
                    }
                    if(seconds >= 0 && seconds <=9){
                        seconds = "0" + seconds;
                    }
                    var sendTime = year + "-" + month + "-" + today + " " + hours + ":" +minutes + ":" +seconds;
                    $("#log-container").append("<div class='bg-success'><label class='text-info'>我&nbsp;"+sendTime+"</label><div class='text-info'>"+v+"</div></div><br>");
                    scrollToBottom();
                    $("#myinfo").val("");
                }
            });
        }
    });

//    function send(event) {
//        var code;
//        if(window.event) {
//            code = window.event.keyCode;
//        }else {
//            code = e.which;
//        }
//        if(code==13) {
//            sendMsg();
//        }
//    }
    function talk(a){
        $("#talktitle").text("与"+a.innerHTML+"的聊天");
        $("body").data("to",a.innerHTML);
    }
    function scrollToBottom(){
        var div = document.getElementById('log-container');
        div.scrollTop = div.scrollHeight;
    }
</script>
</body>
</html>
