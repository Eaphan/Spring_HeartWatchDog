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
    <style type="text/css">
      .service-box {
        margin: 50px auto 0;
        max-width: 400px;
        /*border: 2px solid #000;*/
      }

      @media(min-width:992px) {
        .service-box {
          margin: 20px auto 0;
        }
      }
      .text-primary{
        color: #f05f40;
      }
    </style>
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="container">
            <div class="row text-center">
              <h2>趋势统计分析</h2>
              <hr style="max-width: 50px;border-color: #f05f40;border-width: 3px">
            </div>
            <div class="row">
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box" onclick="javascript:window.location.href='/infoTend'">
                  <i class="fa fa-4x fa-heart  text-primary" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceIn;"></i>
                  <h3>心电检测</h3>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box" onclick="javascript:window.location.href='#'">
                  <i class="fa fa-4x fa-flask text-primary" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceIn;"></i>
                  <%--<i class="fa fa-4x fa-address-book text-primary" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceIn;"></i>--%>
                  <h3>尿液分析</h3>
                </div>
              </div>
              <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box" onclick="javascript:window.location.href='/tempTend'">
                  <i class="fa fa-4x fa-thermometer-1 text-primary" data-wow-delay=".3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceIn;"></i>
                  <h3>温度测量</h3>
                </div>
              </div>
            </div>
          </div>
          </br></br>
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
