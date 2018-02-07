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
    <link href="/css/fileinput-rtl.min.css" rel="stylesheet">
    <link href="/css/fileinput.min.css" rel="stylesheet">
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="col-md-8 col-sm-8">
            <div class="x_panel">
              <div class="x_title">
                <h2><i class="fa fa-bars"></i> 上传文件 </h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <form action="/fileAdd" method="post" enctype="multipart/form-data">
                  <table border="0" width="100%" cellspacing="0" cellpadding="8">
                    <tr height="60">
                      <td colspan="2">【注意上传的文件类型只允许为:jpg,gif,png,txt,doc,pdf。文件最大为3M，目前每个用户最多存储10个文件】</td>
                    </tr>
                    <div class="file-loading">
                      <input id="input-b6" name="path" type="file" required>选择文件
                    </div>

                    <tr>
                      <td align="center">文件描述(150字以内)：</td>
                      <td><textarea name="info" style="resize:none;width:360px;height:120px"
                                    maxlength="150" required></textarea></td>
                      <!--<td><input type="text" name="test"></td>-->
                    </tr>
                    <tr height="50">
                      <td colspan="2" align="center">
                        <button type="submit" class="btn btn-primary">确认上传</button>
                        <button type="reset" class="btn btn-primary">重置</button>
                        <%--<input type="submit" value="上传" class="btn_bg">--%>
                        <%--<input type="reset" value="重置" class="btn_bg">--%>
                      </td>
                    </tr>
                  </table>
                </form>
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
    <script src="/js/fileinput.min.js"></script>
    <script>
        $(document).on('ready', function() {
            $("#input-b6").fileinput({
                showUpload: false,
                maxFileCount: 10,
                mainClass: "input-group-lg"
            });
        });
    </script>
  </body>
</html>
