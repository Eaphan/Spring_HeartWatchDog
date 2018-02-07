<%@ page import="com.xingou.entity.Examination" %>
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
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
  </head>
  <%
    Examination em = (Examination) request.getAttribute("em");
  %>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main" id="content">
          <!-- top tiles -->
          <h2 align="center">体检报告</h2>
          <div >
            <h4  class="sub-header">姓名:<%=em.getName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别:<%=em.getGender()%>&nbsp;&nbsp;&nbsp;&nbsp;年龄:<%=em.getAge()%>&nbsp;&nbsp;&nbsp;&nbsp医院:<%=em.getHospital()%>&nbsp;&nbsp;&nbsp;&nbsp;体检时间:<%=em.getDate()%></h4>
            <table class="table table-bordered	">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>体质检查</b></td>
              </tr>
              <tr>
                <td><b>身高</b></td>
                <td><%=em.getHeight()%>&nbsp;cm</td>
                <td><b>体重</b></td>
                <td><%=em.getWeight()%>&nbsp;kg</td>
              </tr>
              <tr>
                <td><b>收缩压</b></td>
                <td><%=em.getShousuoya()%>&nbsp;mmHg</td>
                <td><b>舒张压</b></td>
                <td><%=em.getShuzhangya()%>&nbsp;mmHg</td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getTizhicon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>内科</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
              </tr>
              <tr>
                <td><b>心率</b></td>
                <td><%=em.getNeike1()%>次/分</td>
                <td><b>心律</b></td>
                <td><%=em.getNeike2()%></td>
              </tr>
              <tr>
                <td><b>心音</b></td>
                <td><%=em.getNeike3()%></td>
                <td><b>肺脏</b></td>
                <td><%=em.getNeike4()%></td>
              </tr>
              <tr>
                <td><b>腹</b></td>
                <td><%=em.getNeike5()%></td>
                <td><b>肝触诊</b></td>
                <td><%=em.getNeike6()%></td>
              </tr>
              <tr>
                <td><b>脾触诊</b></td>
                <td><%=em.getNeike7()%></td>
                <td><b>胆囊触诊</b></td>
                <td><%=em.getNeike8()%></td>
              </tr>
              <tr>
                <td><b>肾触诊</b></td>
                <td><%=em.getNeike9()%></td>
                <td><b>神经反射</b></td>
                <td><%=em.getNeike10()%></td>
              </tr>
              <tr>
                <td><b>肠鸣音</b></td>
                <td><%=em.getNeike11()%></td>
                <td><b>其他</b></td>
                <td><%=em.getNeike12()%></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getNeikecon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>外科</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
              </tr>
              <tr>
                <td><b>淋巴结</b></td>
                <td><%=em.getWaike1()%></td>
                <td><b>甲状腺</b></td>
                <td><%=em.getWaike2()%></td>
              </tr>
              <tr>
                <td><b>四肢关节</b></td>
                <td><%=em.getWaike3()%></td>
                <td><b>乳房</b></td>
                <td><%=em.getWaike4()%></td>
              </tr>
              <tr>
                <td><b>头面部</b></td>
                <td><%=em.getWaike5()%></td>
                <td><b>皮肤</b></td>
                <td><%=em.getWaike6()%></td>
              </tr>
              <tr>
                <td><b>生殖器</b></td>
                <td><%=em.getWaike7()%></td>
                <td><b>胆囊触诊</b></td>
                <td><%=em.getWaike8()%></td>
              </tr>
              <tr>
                <td><b>关节</b></td>
                <td><%=em.getWaike9()%></td>
                <td><b>肛门直肠</b></td>
                <td><%=em.getWaike10()%></td>
              </tr>
              <tr>
                <td><b>疝气</b></td>
                <td><%=em.getWaike11()%></td>
                <td><b>脊柱</b></td>
                <td><%=em.getWaike12()%></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getWaikecon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>眼科</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
              </tr>
              <tr>
                <td><b>晶体</b></td>
                <td><%=em.getYanke1()%></td>
                <td><b>眼睑</b></td>
                <td><%=em.getYanke2()%></td>
              </tr>
              <tr>
                <td><b>球结膜</b></td>
                <td><%=em.getYanke3()%></td>
                <td><b>角膜</b></td>
                <td><%=em.getYanke4()%></td>
              </tr>
              <tr>
                <td><b>色盲</b></td>
                <td><%=em.getYanke5()%></td>
                <td><b>色弱</b></td>
                <td><%=em.getYanke6()%></td>
              </tr>
              <tr>
                <td><b>裸眼视力左</b></td>
                <td><%=em.getYanke7()%></td>
                <td><b>裸眼视力右</b></td>
                <td><%=em.getYanke8()%></td>
              </tr>
              <tr>
                <td><b>矫正视力左</b></td>
                <td><%=em.getYanke9()%></td>
                <td><b>矫正视力右</b></td>
                <td><%=em.getYanke10()%></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getYankecon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>耳鼻喉</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
              </tr>
              <tr>
                <td><b>耳</b></td>
                <td><%=em.getEr()%></td>
                <td><b>鼻</b></td>
                <td><%=em.getBi()%></td>
              </tr>
              <tr>
                <td><b>咽</b></td>
                <td><%=em.getYan()%></td>
                <td><b>扁桃体</b></td>
                <td><%=em.getBiantaoti()%></td>
              </tr>
              <tr>
                <td><b>喉</b></td>
                <td><%=em.getHou()%></td>
                <td><b></b></td>
                <td></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getErbihoucon()%></div></td>
              </tr>
            </table>

            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>口腔</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
              </tr>
              <tr>
                <td><b>口腔粘膜</b></td>
                <td><%=em.getOral1()%></td>
                <td><b>牙及牙龈</b></td>
                <td><%=em.getOral2()%></td>
              </tr>
              <tr>
                <td><b>舌</b></td>
                <td><%=em.getOral3()%></td>
                <td><b></b></td>
                <td></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getOralcon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>心电图报告</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
              </tr>
              <tr>
                <td><b>心率(次/分)</b></td>
                <td><%=em.getEcg1()%></td>
                <td><b>PR间期(ms)</b></td>
                <td><%=em.getEcg2()%></td>
              </tr>
              <tr>
                <td><b>QT间期(ms)</b></td>
                <td><%=em.getEcg3()%></td>
                <td><b>QRS宽度(ms)</b></td>
                <td><%=em.getEcg4()%></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>心电图报告小结:</b><br><br>
                  <div align="center"><%=em.getEcgcon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>超声检测报告</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>肝、胆、脾、胰、肾、前列腺</b></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getBchaocon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="2" align="center" bgcolor="#e6e6e6"><b>放射科</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>胸腔透视</b></td>
              </tr>
              <tr>
                <td><b>检测结果</b></td>
                <td><%=em.getFangshe1()%></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getFangshecon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>肿瘤指标检测</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>癌胚抗原</b></td>
                <td><%=em.getCancer1()%></td>
                <td>0.00-10.00</td>
                <td>ug/L</td>
              </tr>
              <tr>
                <td><b>甲胎蛋白</b></td>
                <td><%=em.getCancer2()%></td>
                <td>0.00-25.00</td>
                <td>ug/L</td>
              </tr>
              <tr>
                <td><b>鳞状癌抗原</b></td>
                <td><%=em.getCancer3()%></td>
                <td>0.00-2.90</td>
                <td>mg/L</td>
              </tr>
              <tr>
                <td><b>前列腺特异抗原</b></td>
                <td><%=em.getCancer4()%></td>
                <td>0.00-5.00</td>
                <td>ug/L</td>
              </tr>
              <tr>
                <td><b>糖类抗原(CA199)</b></td>
                <td><%=em.getCancer5()%></td>
                <td>0.00-35.00</td>
                <td>KU/L</td>
              </tr>
              <tr>
                <td><b>糖类抗原(CA211)</b></td>
                <td><%=em.getCancer6()%></td>
                <td>0.00-4.90</td>
                <td>mg/L</td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getCancercon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>血常规</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>红细胞计数</b></td>
                <td><%=em.getBlood1()%></td>
                <td>4-5.5</td>
                <td>10E12/L</td>
              </tr>
              <tr>
                <td><b>红细胞压积</b></td>
                <td><%=em.getBlood2()%></td>
                <td>42-49</td>
                <td>L/L</td>
              </tr>
              <tr>
                <td><b>红细胞平均体积</b></td>
                <td><%=em.getBlood3()%></td>
                <td>82-95</td>
                <td>f1</td>
              </tr>
              <tr>
                <td><b>红细胞平均血红蛋白</b></td>
                <td><%=em.getBlood4()%></td>
                <td>27-33</td>
                <td>pg</td>
              </tr>
              <tr>
                <td><b>平均血红蛋白浓度</b></td>
                <td><%=em.getBlood5()%></td>
                <td>320-360</td>
                <td>g/L</td>
              </tr>
              <tr>
                <td><b>血小板计数</b></td>
                <td><%=em.getBlood6()%></td>
                <td>100-300</td>
                <td>10E9/L</td>
              </tr>
              <tr>
                <td><b>血小板平均体积</b></td>
                <td><%=em.getBlood7()%></td>
                <td>6-14</td>
                <td>f1</td>
              </tr>
              <tr>
                <td><b>血小板压积</b></td>
                <td><%=em.getBlood8()%></td>
                <td>0.108-0.282</td>
                <td>L/F</td>
              </tr>
              <tr>
                <td><b>血小板体积分布密度</b></td>
                <td><%=em.getBlood9()%></td>
                <td>15-17</td>
                <td>%</td>
              </tr>
              <tr>
                <td><b>血红蛋白</b></td>
                <td><%=em.getBlood10()%></td>
                <td>120-160</td>
                <td>g/L</td>
              </tr>
              <tr>
                <td><b>白细胞计数</b></td>
                <td><%=em.getBlood11()%></td>
                <td>4-10</td>
                <td>10E9/L</td>
              </tr>
              <tr>
                <td><b>淋巴细胞绝对值</b></td>
                <td><%=em.getBlood12()%></td>
                <td>0.8-4</td>
                <td>10E9/L</td>
              </tr>
              <tr>
                <td><b>中性粒细胞绝对值</b></td>
                <td><%=em.getBlood13()%></td>
                <td>2-7</td>
                <td>10E9/L</td>
              </tr>
              <tr>
                <td><b>单核细胞绝对值</b></td>
                <td><%=em.getBlood14()%></td>
                <td>0.1-0.9</td>
                <td>10E9/L</td>
              </tr>
              <tr>
                <td><b>淋巴细胞相对百分比</b></td>
                <td><%=em.getBlood15()%></td>
                <td>20-40</td>
                <td>%</td>
              </tr>
              <tr>
                <td><b>粒细胞相对百分比</b></td>
                <td><%=em.getBlood16()%></td>
                <td>50-75</td>
                <td>%</td>
              </tr>
              <tr>
                <td><b>单核细胞相对百分比</b></td>
                <td><%=em.getBlood17()%></td>
                <td>3-9</td>
                <td>%</td>
              </tr>
              <tr>
                <td><b>红细胞体积分布宽度</b></td>
                <td><%=em.getBlood18()%></td>
                <td>10.6-15</td>
                <td>%</td>
              </tr>
              <tr>
                <td><b>血沉</b></td>
                <td><%=em.getBlood19()%></td>
                <td>0-15</td>
                <td></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getBloodcon()%></div>
                </td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>尿常规</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>尿蛋白(PRO)</b></td>
                <td><%=em.getUrine1()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>尿糖（GLU)</b></td>
                <td><%=em.getUrine2()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>鸟胆红素（BLL）</b></td>
                <td><%=em.getUrine3()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>尿胆原（URO）</b></td>
                <td><%=em.getUrine4()%></td>
                <td>0-15</td>
                <td>umol/L</td>
              </tr>
              <tr>
                <td><b>尿潜血（BLO）</b></td>
                <td><%=em.getUrine5()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>尿酮体（KET）</b></td>
                <td><%=em.getUrine6()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>亚硝酸盐（NIT）</b></td>
                <td><%=em.getUrine7()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>尿白细胞（LEU)</b></td>
                <td><%=em.getUrine8()%></td>
                <td>阴性</td>
                <td></td>
              </tr>
              <tr>
                <td><b>尿比重（）</b></td>
                <td><%=em.getUrine9()%></td>
                <td>1-1.03</td>
                <td></td>
              </tr>
              <tr>
                <td><b>尿酸碱值</b></td>
                <td><%=em.getUrine10()%></td>
                <td>4.5-8</td>
                <td></td>
              </tr>
              <tr>
                <td><b>镜检红细胞</b></td>
                <td><%=em.getUrine11()%></td>
                <td>0-3</td>
                <td></td>
              </tr>
              <tr>
                <td><b>镜检白细胞</b></td>
                <td><%=em.getUrine12()%></td>
                <td>0-5</td>
                <td></td>
              </tr>
              <tr>
                <td><b>上皮细胞</b></td>
                <td><%=em.getUrine13()%></td>
                <td>未见</td>
                <td></td>
              </tr>
              <tr>
                <td><b>管型</b></td>
                <td><%=em.getUrine14()%></td>
                <td>未见</td>
                <td></td>
              </tr>
              <tr>
                <td><b>结晶</b></td>
                <td><%=em.getUrine15()%></td>
                <td>未见</td>
                <td></td>
              </tr>
              <tr>
                <td><b>粘液丝</b></td>
                <td><%=em.getUrine16()%></td>
                <td>未见</td>
                <td></td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getUrinecon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>肝动能</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>总胆红素</b></td>
                <td><%=em.getLiver1()%></td>
                <td>5-22</td>
                <td>umol/L</td>
              </tr>
              <tr>
                <td><b>谷草转氨酶</b></td>
                <td><%=em.getLiver2()%></td>
                <td>5-40</td>
                <td> U/L</td>
              </tr>
              <tr>
                <td><b>谷丙转氨酶</b></td>
                <td><%=em.getLiver3()%></td>
                <td>0-55</td>
                <td> U/L</td>
              </tr>
              <tr>
                <td><b>总蛋白</b></td>
                <td><%=em.getLiver4()%></td>
                <td>62-82</td>
                <td>g/L</td>
              </tr>
              <tr>
                <td><b>白蛋白</b></td>
                <td><%=em.getLiver5()%></td>
                <td>35-55</td>
                <td> U/L</td>
              </tr>
              <tr>
                <td><b>球蛋白</b></td>
                <td><%=em.getLiver6()%></td>
                <td>20-34</td>
                <td> U/L</td>
              </tr>
              <tr>
                <td><b>白球比</b></td>
                <td><%=em.getLiver7()%></td>
                <td>1.5-2.5</td>
                <td>%</td>
              </tr>
              <tr>
                <td><b>碱性磷酸酶</b></td>
                <td><%=em.getLiver8()%></td>
                <td>40-150</td>
                <td>u/L</td>
              </tr>
              <tr>
                <td><b> 直接胆红素</b></td>
                <td><%=em.getLiver9()%></td>
                <td>1.7-6.8</td>
                <td>umol/L</td>
              </tr>
              <tr>
                <td><b> 间接胆红素</b></td>
                <td><%=em.getLiver10()%></td>
                <td>3.3-15.2</td>
                <td>umol/L</td>
              </tr>
              <tr>
                <td><b>总胆汁酸</b></td>
                <td><%=em.getLiver11()%></td>
                <td>0-10</td>
                <td>umol/L</td>
              </tr>
              <tr>
                <td><b>r-谷氨酸基转移酶</b></td>
                <td><%=em.getLiver12()%></td>
                <td>7-50</td>
                <td>u/L</td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getLivercon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>血脂</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>总胆固醇</b></td>
                <td><%=em.getBloodfat1()%></td>
                <td>2.3-5.7</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td><b>甘油三酯</b></td>
                <td><%=em.getBloodfat2()%></td>
                <td>0.5-1.7</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td><b>低密度脂蛋白</b></td>
                <td><%=em.getBloodfat3()%></td>
                <td>2.1-3.1</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td><b>高密度脂蛋白</b></td>
                <td><%=em.getBloodfat4()%></td>
                <td>0.8-1.8</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getLivercon()%></div></td>
              </tr>
            </table>

            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>肾功能</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>肌酐</b></td>
                <td><%=em.getKidney1()%></td>
                <td>53-136</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td><b>尿素氮</b></td>
                <td><%=em.getKidney2()%></td>
                <td>2.3-7.2</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td><b>尿酸</b></td>
                <td><%=em.getKidney3()%></td>
                <td>155-428</td>
                <td>mmol/L</td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getLivercon()%></div></td>
              </tr>
            </table>

            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>血糖</b></td>
              </tr>
              <tr>
                <td><b>项目名称</b></td>
                <td><b>检测结果</b></td>
                <td><b>参考值</b></td>
                <td><b>单位</b></td>
              </tr>
              <tr>
                <td><b>空腹血糖</b></td>
                <td><%=em.getXuetang1()%></td>
                <td>3.9-6.1</td>
                <td>mmmol/L</td>
              </tr>
              <tr>
                <td colspan="4">
                  <b>本科小结:</b><br><br>
                  <div align="center"><%=em.getXuetangcon()%></div></td>
              </tr>
            </table>
            <table class="table table-bordered  ">
              <tr>
                <td colspan="4" align="center" bgcolor="#e6e6e6"><b>总结结论</b></td>
              </tr>
              <tr>
                <td><%=em.getSummary()%></td>
              </tr>
            </table>
          </div>
          <a class="btn btn-primary" href="/examinationModify/<%=em.getId()%>" role="button">修改报告</a>&nbsp;&nbsp;&nbsp;&nbsp;
          <button type="button" class="btn btn-primary" id="export">下载心电报告</button>
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
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <%--<script src="js/html2canvas.js"></script>--%>
    <%--<script src="//cdn.bootcss.com/jspdf/1.3.3/jspdf.debug.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="/js/jQuery.print.js"></script>

    <script src="/js/renderPDF.js"></script>
    <script>
        document.getElementById("export").onclick = function() {
            html2canvas(document.getElementById("content"),{
                onrendered: function (canvas) {
                    var contentWidth = canvas.width;
                    var contentHeight = canvas.height*1.4;

                    //一页pdf显示html页面生成的canvas高度;
                    var pageHeight = contentWidth / 210 * 297;
                    //未生成pdf的html页面高度
                    var leftHeight = contentHeight;
                    //页面偏移
                    var position = 0;
                    //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
                    var imgWidth = 210;
                    var imgHeight = 210 / contentWidth * contentHeight;

                    var pageData = canvas.toDataURL('image/png', 1.0);

                    var pdf = new jsPDF('', 'mm', 'a4');

                    //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                    //当内容未超过pdf一页显示的范围，无需分页
                    if (leftHeight < pageHeight) {
                        pdf.addImage(pageData, 'PNG', 0, 0, imgWidth, imgHeight);
                    } else {
                        while (leftHeight > 0) {
                            pdf.addImage(pageData, 'PNG', 0, position, imgWidth, imgHeight)
                            leftHeight -= pageHeight;
                            position -= 297;
                            //避免添加空白页
                            if (leftHeight > 0) {
                                pdf.addPage();
                            }
                        }
                    }
                    pdf.save('examination_pdf_' + new Date().getTime() + '.pdf');
                }
            })
        }

    </script>

  </body>
</html>
