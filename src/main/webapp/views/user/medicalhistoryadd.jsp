<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加个人病历</title>
    <link rel="shortcut icon" href="/images/bitbug_favicon.ico"/>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <!-- Custom Theme Style -->
    <link href="/css/custom.min.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
    <link href="/css/jquery-editable-select.min.css" rel="stylesheet">

    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap-select.min.css">
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="x_panel">
            <div class="x_title">
              <h2><i class="fa fa-bars"></i> 下载/删除文件 </h2>
              <div class="clearfix"></div>
            </div>
            <div class="x_content">
              <h2 class="sub-header">当前位置:添加个人病历(以下都是必填项)</h2>
              <form class="form-horizontal" action="addMedicalhistory" method="post" onsubmit="return change(this)">
                <div class="form-group">
                  <label for="date_id" class="col-sm-2 control-label">就诊时间</label>
                  <div class="input-group date date col-sm-4" data-date="" data-date-format="yyyy-mm-dd" data-link-field="date_id" data-link-format="yyyy-mm-dd">
                    <input class="form-control"size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                  </div>
                  <input type="hidden" name="date" id="date_id" value="" required /><br/>
                </div>
                <div class="form-group">
                  <label for="1" class="col-sm-2 control-label">就诊城市</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" name="city" id="1" required>
                  </div>
                </div>
                <div class="form-group">
                  <label for="2" class="col-sm-2 control-label">就诊医院</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" name="hospital" id="2" required>
                  </div>
                </div>
                <div class="form-group">
                  <label for="3" class="col-sm-2 control-label">就诊科室</label>
                  <div class="col-sm-4">
                    <select id="3" class="selectpicker show-tick form-control" name="office" required>
                      <option>内科</option>
                      <option>外科</option>
                      <option>妇产科</option>
                      <option>男科</option>
                      <option>儿科</option>
                      <option>传染科</option>
                      <option>精神心理科</option>
                      <option>五官科</option>
                      <option>皮肤性病科</option>
                      <option>中医科</option>
                      <option>整形美容科</option>
                      <option>营养科</option>
                      <option>麻醉科</option>
                      <option>医学影像科</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="4" class="col-sm-2 control-label">医生</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" name="doctor" id="4" required>
                  </div>
                </div>
                <div class="form-group">
                  <label for="conclusion" class="col-sm-2 control-label">结论</label>
                  <div class="col-sm-6">
                                    <textarea name="conclusion" id="conclusion" style="resize:none;width:600px;height:120px"
                                              maxlength="200" placeholder="200字以内" required></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">确认添加</button><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                    <button type="button" onclick="javascript:window.location.href='medicalhistoryList';" class="btn btn-primary">放弃添加</button>
                  </div>
                </div>
              </form>
              <br>
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
    <script src="/js/jquery-editable-select.min.js"></script>

    <script src="/js/sweet-alert.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="/js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
    <script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/js/bootstrap-select.min.js"></script>

    <script language="JavaScript">
        $('#3').editableSelect();
        function change(form) {
            if (form.date.value == "") {
                swal({title:"错误",text:"就诊时间不能为空！",type:"warning"});
                return false;
            }
        }
        $('.date').datetimepicker({
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
    </script>
  </body>
</html>
