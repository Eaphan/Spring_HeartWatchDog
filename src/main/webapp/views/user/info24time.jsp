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
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">

  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <h1 class="sub-header">请选择日期范围查询24小时holter数据</h1>
          <br>
          <%--<form action="InfoServlet?action=time" class="form-horizontal"  role="form" METHOD="post">--%>
          <form class="form-horizontal">
            <fieldset>
              <div class="form-group">
                <label for="dtp_input2" class="col-sm-2 control-label">选择起始日期</label>
                <div class="input-group date startdate col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" name="startdate" id="dtp_input2" value="" /><br/>
              </div>
              <div class="form-group">
                <label for="dtp_input3" class="col-sm-2 control-label">选择截止日期</label>
                <div class="input-group date enddate col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
                  <input class="form-control"size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                </div>
                <input type="hidden"  name="enddate"  id="dtp_input3" value="" /><br/>
              </div>
              <div>
                <div class="col-sm-offset-2 col-sm-6">
                  <button type="button" id="timeselect" class="btn  btn-primary">确认查询</button><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                  <button type="button" onclick="javascript:window.location.href=('info24List');" class="btn btn-primary">查询所有记录</button>
                </div>
              </div>
            </fieldset>
          </form>
          <table  id="recordstable" data-toggle="table" data-url=""
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
                  data-striped="true"
          <%--style="VISIBILITY:hidden"--%>
          >
            <thead>
            <tr>
              <th data-field="id">编号</th>
              <th data-field="date">记录时间</th>
              <th data-field="conclusion" align="center">结论</th>
              <th data-field="read" align="center">操作</th>
              <th data-field="del" align="center">删除</th>
            </tr>
            </thead>
          </table>
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
    <<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script>
        $('.startdate').datetimepicker({
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            pickerPosition: "bottom-left"
        });
        $('.enddate').datetimepicker({
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            pickerPosition: "bottom-left"
        });
        $("#timeselect").click(function(){
            var a=$("#dtp_input2").val();
            var b=$("#dtp_input3").val();
//        在这个地方要注意不能写javascript格式，第二不能用.text()获取数据
            var url="info24SelectByTime?startdate="+a+"&enddate="+b;
            $("#recordstable").bootstrapTable('refresh', {url: url});
        });
    </script>
  </body>
</html>
