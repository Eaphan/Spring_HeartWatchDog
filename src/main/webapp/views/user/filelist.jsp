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
  </head>


  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="col-md-12 col-sm-12">
            <div class="x_panel">
              <div class="x_title">
                <h2><i class="fa fa-bars"></i> 下载/删除文件 </h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <table class="table table-hover">
                  <thread>
                    <tr>
                      <th>序号</th>
                      <th>上传时间</th>
                      <th>文件描述</th>
                      <th>操作</th>
                      <th>删除</th>
                    </tr>
                  </thread>
                  <tbody>
                  <c:forEach var="f" items="${fileList}" varStatus="vs">
                    <tr>
                      <th><c:out value="${vs.count}"/></th>
                      <th><c:out value="${f.filedate}"/></th>
                      <th><c:out value="${f.fileinfo}"/></th>
                      <th><a href="/fileDownload/${f.id}">下载文件</a></th>
                      <th><a href="/fileDelete/${f.id}">删除文件</a></th>
                        <%--<th><a>删除好友</a></th>--%>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
                <a class="btn btn-primary" href="/fileUpload" role="button">上传医疗报告</a>
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
  </body>
</html>
