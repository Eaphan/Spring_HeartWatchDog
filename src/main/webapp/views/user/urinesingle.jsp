<%@ page import="com.xingou.entity.Urine" %>
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
  <%Urine single=(Urine)request.getAttribute("urinesingle");%>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <h2 class="sub-header">尿液检测结论</h2>
          <%--<div class="table-responsive">--%>
          <div>
            <table class="table table-responsive">
              <thread>
                <tr>
                  <td>编号</td>
                  <td>检测项目</td>
                  <td>结果</td>
                  <td>参考值</td>
                </tr>
              </thread>
              <tr id="tr_leu">
                <td>1</td>
                <td>白细胞(LEU)</td>
                <td id="leu"><%=single.getLeu()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_nit">
                <td>2</td>
                <td>亚硝酸盐(NIT)</td>
                <td id="nit"><%=single.getNit()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_ubg">
                <td>3</td>
                <td>尿胆原(UBG)</td>
                <td id="ubg"><%=single.getUbg()%></td>
                <td>阴性/弱阳性</td>
              </tr>
              <tr id="tr_pro">
                <td>4</td>
                <td>蛋白质(PRO)</td>
                <td id="pro"><%=single.getPro()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_ph">
                <td>5</td>
                <td>酸碱度(pH)</td>
                <td id="ph"><%=single.getPh()%></td>
                <td>4.5-8.0</td>
              </tr>
              <tr id="tr_sg">
                <td>6</td>
                <td>尿比重(SG)</td>
                <td id="sg"><%=single.getSg()%></td>
                <td>1.015-1.025</td>
              </tr>
              <tr id="tr_ca">
                <td>7</td>
                <td>钙离子(Ca)</td>
                <td id="ca"><%=single.getCa()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_bld">
                <td>8</td>
                <td>潜血(BLD)</td>
                <td id="bld"><%=single.getBld()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_ket">
                <td>9</td>
                <td>酮体(KET)</td>
                <td id="ket"><%=single.getKet()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_bil">
                <td>10</td>
                <td>胆红素(BIL)</td>
                <td id="bil"><%=single.getBil()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_glu">
                <td>11</td>
                <td>葡萄糖(GLU)</td>
                <td id="glu"><%=single.getGlu()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_vc">
                <td>12</td>
                <td>维生素C(VC)</td>
                <td id="vc"><%=single.getVc()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_ma">
                <td>13</td>
                <td>微量白蛋白(MA)</td>
                <td id="ma"><%=single.getMa()%></td>
                <td>阴性</td>
              </tr>
              <tr id="tr_cr">
                <td>14</td>
                <td>肌酐(Cr)</td>
                <td id="cr"><%=single.getCr()%></td>
                <td>阴性</td>
              </tr>
            </table>
            <br><br>
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
    <script>
        $(document).ready(function () {
            var leu = "<%=single.getLeu()%>";
            var nit = "<%=single.getNit()%>";
            var ubg = "<%=single.getUbg()%>";
            var pro = "<%=single.getPro()%>";
            var ph = <%=single.getPh()%>;
            var sg = <%=single.getSg()%>;
            var ca = "<%=single.getCa()%>";
            var bld = "<%=single.getBld()%>";
            var ket = "<%=single.getKet()%>";
            var bil = "<%=single.getBil()%>";
            var glu = "<%=single.getGlu()%>";
            var vc = "<%=single.getVc()%>";
            var ma = "<%=single.getMa()%>";
            var cr = "<%=single.getCr()%>";
            console.log(leu);
            if (leu!="阴性") {
                $("#tr_leu").addClass("danger");
            };
            if (nit!="阴性") {
                $("#tr_nit").addClass("danger");
            };
            if (ubg!="阴性"&&ubg!="+-") {
                $("#tr_ubg").addClass("danger");
            };
            if (pro!="阴性") {
                $("#tr_pro").addClass("danger");
            };
            if (ph<4.5||ph>8) {
                $("#tr_ph").addClass("danger");
            };
            if (sg<1.015||sg>1.025) {
                $("#tr_sg").addClass("danger");
            };
            if (ca!="阴性") {
                $("#tr_ca").addClass("danger");
            };
            if (bld!="阴性") {
                $("#tr_bld").addClass("danger");
            };
            if (ket!="阴性") {
                $("#tr_ket").addClass("danger");
            }
            if (bil!="阴性") {
                $("#tr_bil").addClass("danger");
            }
            if (glu!="阴性") {
                $("#tr_glu").addClass("danger");
            }
            if (vc!="阴性") {
                $("#tr_vc").addClass("danger");
            }
            if (ma!="阴性") {
                $("#tr_ma").addClass("danger");
            }
            if (cr!="阴性") {
                $("#tr_cr").addClass("danger");
            }
        })
    </script>

  </body>
</html>
