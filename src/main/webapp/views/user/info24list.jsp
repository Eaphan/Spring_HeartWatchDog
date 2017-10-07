<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/css/modalEffects/component.css" rel="stylesheet">
    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
  </head>
  <%
    String errorMsg = request.getParameter("errorMsg");
    System.out.println(errorMsg);
  %>
  <body class="nav-md">
  <%--<c:if test="${!empty errorMsg}">--%>
  <%--<body class="nav-md" onload="tishi()">--%>
  <%--</c:if>--%>
  <%--<c:if test="${empty errorMsg}">--%>
  <%--<body class="nav-md">--%>
  <%--</c:if>--%>
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>

        <!-- page content -->
        <div class="right_col" role="main" >
          <%--<div id="pageLoading" style="position: fixed;top: 30%;left: 50%;width:50%;background-color: white;z-index: 2;text-align: center" >--%>
          <div id="pageLoading" style="position: fixed;top: 40%;left:25%;width:50%;background-color: white;z-index: 2;text-align: center;vertical-align: central;" hidden>
            <img src="/images/loading.gif" />
            <p style="text-align: center; vertical-align: central;">
              请稍等，正在为您加载数据
            </p>
          </div>

          <div class="md-modal md-effect-1" id="modal-1">
            <div class="md-content">
              <h3>播报记录</h3>
              <div>
                <p id="modal_p">下面是您的每20秒检测一次的心电图结论</p>
                <ul id="modal_ul"></ul>
                <button class="btn btn-primary md-close">确定</button>
              </div>
            </div>
          </div>
          <a id="link" class="md-trigger" data-modal="modal-1" hidden>作为中转链接</a>
          <h1 style="border-bottom: 1px solid #eee">24小时Holter动态心电图</h1>
          <%--<form action="InfoServlet?action=time" class="form-horizontal"  role="form" METHOD="post">--%>
          <table  id="teacher_table" data-toggle="table" data-url="info24Select"
                data-method="post"
                data-query-params="queryParams"
                data-toolbar="#toolbar"
                data-pagination="true"
                data-search="true"
                data-show-refresh="true"
                data-show-toggle="true"
                data-show-columns="true"
                data-page-size="10"
        <%--data-pageList:="[10, 25, 50, 100]"--%>
                data-striped="true">·
              <thead>
              <tr>
                <th data-field="id" style="text-align: center; vertical-align: middle;">编号</th>
                <th data-field="date" style="vertical-align: middle;text-align: center;">记录时间</th>
                <th data-field="conclusion" style="vertical-align: middle;text-align: center;">结论</th>
                <th data-field="read" style="vertical-align: middle;text-align: center;">操作</th>
                <th data-field="del" style="vertical-align: middle;text-align: center;">删除</th>
              </tr>
              </thead>
            </table>
            <%--<a onclick="seeCon(this)" name="22">查看结论</a>--%>
            <%--<a onclick="alert(this.name)" name="1">123</a>--%>
          <br>
          <%--<p id="test">12345</p>--%>
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
    <script src="/js/modalEffects/modalEffects.js"></script>
    <script src="/js/modalEffects/classie.js"></script>
    <script src="/js/modalEffects/modernizr.custom.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="js/sweet-alert.min.js"></script>

    <%
    if (errorMsg!=null&&!"".equals(errorMsg)) {
    %>
    <script type="text/javascript">
        $(document).ready(function () {
            swal({title: "提示", text: "删除记录失败，请刷新界面后重试！", type: "info"});
        });
    </script>
    <%
    }
    %>

  <script>
        function seeCon(a) {
            $("#pageLoading").show();
            $.post("/getInfo24Con", {"id": a.name, "uid":${user.uid}}, function (con) {
//                alert(con);
//                    console.log(con.Dataaddr);
                var datas = eval(con);
                $("#modal_ul").remove();
                var str_html='<ul id="modal_ul" style="height: 350px;overflow-y:auto">';
                for(var i=0;i<datas.length;i++) {
                    str_html += '<li><strong>时间:' + datas[i].time + '</strong><br><table><tr><th>检测项目</th><th>疑似度</th></tr>';
//                str_html+='<li><strong>时间:'+datas[i].time+'</strong><br>心动过速疑似度:'+datas[i].xdgs+'%<br>室性心动过速疑似度:'+datas[i].sxxdgs+'%<br>心动过缓疑似度:'+datas[i].xdgs+'%<br>房性逸搏疑似度:'+datas[i].fxyb+'%<br>室性逸搏疑似度:'+datas[i].sxyb+'个<br>心率不齐疑似度:'+datas[i].xlbq+'%<br>室性早搏疑似度:'+datas[i].sxzb+'个<br>房性早搏疑似度:'+datas[i].fxzb+'%<br>交界性早搏疑似度:'+datas[i].jjxzb+'%<br>房颤疑似度:'+datas[i].fc+'%</li>';

                    if(datas[i].xdgs>50) {
                        str_html+='<tr style="color: red;"><td>心动过速</td><td>'+datas[i].xdgs+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>心动过速</td><td>'+datas[i].xdgs+'%</td></tr>'
                    }
                    if(datas[i].sxxdgs>50) {
                        str_html+='<tr style="color: red;"><td>室性心动过速</td><td>'+datas[i].sxxdgs+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>室性心动过速</td><td>'+datas[i].sxxdgs+'%</td></tr>'
                    }
                    if(datas[i].xdgh>50) {
                        str_html+='<tr style="color: red;"><td>心动过缓</td><td>'+datas[i].xdgh+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>心动过缓</td><td>'+datas[i].xdgh+'%</td></tr>'
                    }
                    if(datas[i].fxyb>50) {
                        str_html+='<tr style="color: red;"><td>房性逸搏</td><td>'+datas[i].fxyb+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>房性逸搏</td><td>'+datas[i].fxyb+'%</td></tr>'
                    }
                    if(datas[i].sxyb>0) {
                        str_html+='<tr style="color: red;"><td>室性逸搏</td><td>'+datas[i].sxyb+'个</td></tr>'
                    }else{
                        str_html+='<tr><td>室性逸搏</td><td>'+datas[i].sxyb+'个</td></tr>'
                    }
//                str_html+='个<br>心率不齐疑似度:'+datas[i].xlbq+'%<br>室性早搏疑似度:'+datas[i].sxzb+'个<br>房性早搏疑似度:'+datas[i].fxzb+'%<br>交界性早搏疑似度:'+datas[i].jjxzb+'%<br>房颤疑似度:'+datas[i].fc+'%</li>';

                    if(datas[i].xlbq>50) {
                        str_html+='<tr style="color: red;"><td>心率不齐</td><td>'+datas[i].xlbq+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>心率不齐</td><td>'+datas[i].xlbq+'%</td></tr>'
                    }
                    if(datas[i].sxzb>0) {
                        str_html+='<tr style="color: red;"><td>室性早搏</td><td>'+datas[i].sxzb+'个</td></tr>'
                    }else{
                        str_html+='<tr><td>室性早搏</td><td>'+datas[i].sxzb+'个</td></tr>'
                    }
                    if(datas[i].fxzb>50) {
                        str_html+='<tr style="color: red;"><td>房性早搏</td><td>'+datas[i].fxzb+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>房性早搏</td><td>'+datas[i].fxzb+'%</td></tr>'
                    }
                    if(datas[i].jjxzb>50) {
                        str_html+='<tr style="color: red;"><td>交界性早搏</td><td>'+datas[i].jjxzb+'%</td></tr>'
                    }else{
                        str_html+='<tr><td>交界性早搏</td><td>'+datas[i].jjxzb+'%</td></tr>'
                    }
                    if(datas[i].fc>50) {
                        str_html+='<tr style="color: red;"><td>房颤</td><td>'+datas[i].fc+'%</td></tr></table></li>'
                    }else{
                        str_html+='<tr><td>房颤</td><td>'+datas[i].fc+'%</td></tr></table></li>'
                    }
                }
                str_html+='</ul>';
                $("#modal_p").after(str_html);
                $("#pageLoading").hide();
                $("#modal-1").addClass("md-show");
            });
        }
  </script>
  </body>
</html>
