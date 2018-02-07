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
        <div class="right_col" role="main">
          <h1 style="border-bottom: 1px solid #eee">心电图及历史诊断结论</h1>
          <%--<form action="InfoServlet?action=time" class="form-horizontal"  role="form" METHOD="post">--%>
          <table  id="teacher_table" data-toggle="table" data-url="infoSelect"
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
                <th data-field="read" style="vertical-align: middle;text-align: center;">操作</th>
                <th data-field="del" style="vertical-align: middle;text-align: center;">删除</th>
              </tr>
              </thead>
            </table>
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

  </body>
</html>
