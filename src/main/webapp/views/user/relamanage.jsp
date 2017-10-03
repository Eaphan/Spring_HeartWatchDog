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

          <%--分割线，从此之下四个表格--%>
          <div class="col-md-12 col-sm-12">
            <div class="x_panel">
              <div class="x_title">
                <h2><i class="fa fa-bars"></i> 亲友管理 </h2>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                  <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">亲友列表</a>
                    </li>
                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">验证消息</a>
                    </li>
                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">我的好友申请</a>
                    </li>
                    <li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">添加新好友</a>
                    </li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                      <table class="table table-hover">
                        <thread>
                          <tr>
                            <th>序号</th>
                            <th>好友账号</th>
                            <th>查看</th>
                            <th>删除</th>
                          </tr>
                        </thread>
                        <tbody>
                          <c:forEach var="f" items="${friends}" varStatus="vs">
                            <tr>
                              <th><c:out value="${vs.count}"/></th>
                              <th><c:out value="${f.uname}"/></th>
                              <th>查看好友健康信息</th>
                              <th><a href="/deleteFriend/${f.uid}">删除好友</a></th>
                              <%--<th><a>删除好友</a></th>--%>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                      <table class="table table-hover">
                        <thread>
                          <tr>
                            <th>序号</th>
                            <th>申请者账号</th>
                            <th>验证消息</th>
                            <th>操作</th>
                            <th>operation</th>
                          </tr>
                        </thread>
                        <tbody>
                        <c:forEach var="r" items="${requestFriends}" varStatus="vs">
                          <tr>
                            <th><c:out value="${vs.count}"/></th>
                            <th><c:out value="${r.request_user.uname}"/></th>
                            <th><c:out value="${r.information}"/></th>
                            <th><a href="/addFriend/${r.request_user.uid}/${r.id}">加他/她为好友</a></th>
                            <th><a href="/refuseRequest/${r.id}">拒绝申请</a></th>
                          </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                      <table class="table table-hover">
                        <thread>
                          <tr>
                            <th>序号</th>
                            <th>对方账号</th>
                            <th>验证消息</th>
                            <th>操作</th>
                          </tr>
                        </thread>
                        <tbody>
                        <c:forEach var="t" items="${toreceivedFriends}" varStatus="vs">
                          <tr>
                            <th><c:out value="${vs.count}"/></th>
                            <th><c:out value="${t.toreceived_user.uname}"/></th>
                            <th><c:out value="${t.information}"/></th>
                            <th><a href="/cancelRequest/${t.id}">撤销申请</a></th>
                          </tr>
                        </c:forEach>
                        </tbody>
                      </table>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
                      <form action="/addRequest" method="post" id="apply-form" class="col-md-6 col-sm-6" data-parsley-validate>
                        <label for="relaName">好友申请</label>
                        <input type="text" id="relaName" class="form-control col-sm-6 col-md-6" name="relaName" placeholder="请输入对方的用户名" required />
                        <br>
                        <%--<label for="information">验证消息</label>--%>
                        <%--<textarea name="information"  id="information"  class="form-control" ></textarea>--%>
                        <label for="information">验证消息</label>
                        <textarea id="information" required="required" class="form-control" name="information" data-parsley-trigger="keyup"
                                  data-parsley-maxlength="100" data-parsley-maxlength-message="Come on! You need to enter at least a 20 caracters long comment.."></textarea>
                        <br/>
                        <button type="submit" class="btn btn-primary" >提交申请</button><br>
                      </form>
                    </div>
                  </div>
                </div>

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
    <script src="/js/parsley.min.js"></script>
  </body>
</html>
