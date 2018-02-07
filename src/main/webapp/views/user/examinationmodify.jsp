<!DOCTYPE html>
<%@ page import="com.xingou.entity.Examination" %>
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
    <link href="/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap-select.min.css">
  </head>
  <%
    Examination em = (Examination) request.getAttribute("em");
  %>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <h2 align="center">体检报告</h2>
          <%--<div class="table-responsive">--%>
            <form  class="form-horizontal" action="/modifyExamination" method="post" onsubmit="return change(this)">
              <input class="hidden" name="id" value="<%=em.getId()%>">
              <div class="form-group">
                <label for="name" class="col-sm-1 control-label">姓名</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" id="name" name="name" value="<%=em.getName()%>" required>
                </div>
                <label for="age" class="col-sm-1 control-label">年龄</label>
                <div class="col-sm-2">
                  <input type="number" class="form-control" id="age" name="age" value="<%=em.getAge()%>" required>
                </div>
                <label for="gender" class="col-sm-1 control-label">性别</label>
                <div class="col-sm-2">
                  <select id="gender" class="selectpicker show-tick form-control" name="gender">
                    <option selected>男</option>
                    <option>女</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label for="hospital" class="col-sm-1 control-label">hospital</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" id="hospital" name="hospital" value="<%=em.getHospital()%>" requied>
                </div>
                <label for="date_id" class="col-sm-1 control-label">体检时间</label>
                <div class="input-group date timepicker col-sm-4" data-date="" data-date-format="yyyy-mm-dd" data-link-field="date_id" data-link-format="yyyy-mm-dd">
                  <input type="text" class="form-control" size="16" value="<%=em.getDate()%>" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                </div>
                <input type="hidden" id="date_id" name="date" value="<%=em.getDate()%>" required>
              </div>

              <table class="table table-bordered table-responsive ">
                <tr>
                  <td colspan="4" align="center" bgcolor="#e6e6e6"><b>体质检查</b></td>
                </tr>
                <tr>
                  <td><b>身高</b></td>
                  <td><input type="number" value="<%=em.getHeight()%>" name="height">&nbsp;cm</td>
                  <td><b>体重</b></td>
                  <td><input type="number" value="<%=em.getWeight()%>" name="weight">&nbsp;kg</td>
                </tr>
                <tr>
                  <td><b>收缩压</b></td>
                  <td><input type="text" name="shousuoya" value="<%=em.getShousuoya()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;mmHg</td>
                  <td><b>舒张压</b></td>
                  <td><input type="text" name="shuzhangya" value="<%=em.getShuzhangya()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;mmHg</td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                        <textarea name="tizhicon" style="resize:none;width:100%;height:80px"
                                  maxlength="50" placeholder="注意字数少于50" ><%=em.getTizhicon()%></textarea>
                    </div>
                  </td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="number" name="neike1" value="<%=em.getNeike1()%>">次/分</td>
                  <td><b>心律</b></td>
                  <td><input type="text"name="neike2" value="<%=em.getNeike2()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>心音</b></td>
                  <td><input type="text"name="neike3" value="<%=em.getNeike3()%>" maxlength="15"></td>
                  <td><b>肺脏</b></td>
                  <td><input type="text"name="neik4" value="<%=em.getNeike4()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>腹</b></td>
                  <td><input type="text"name="neike5" value="<%=em.getNeike5()%>" maxlength="15"></td>
                  <td><b>肝触诊</b></td>
                  <td><input type="text"name="neike6" value="<%=em.getNeike6()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>脾触诊</b></td>
                  <td><input type="text"name="neike7" value="<%=em.getNeike7()%>" maxlength="15"></td>
                  <td><b>胆囊触诊</b></td>
                  <td><input type="text"name="neike8" value="<%=em.getNeike8()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>肾触诊</b></td>
                  <td><input type="text"name="neike9" value="<%=em.getNeike9()%>" maxlength="15"></td>
                  <td><b>神经反射</b></td>
                  <td><input type="text"name="neike10" value="<%=em.getNeike10()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>肠鸣音</b></td>
                  <td><input type="text"name="neike11" value="<%=em.getNeike11()%>" maxlength="15"></td>
                  <td><b>其他</b></td>
                  <td><input type="text"name="neike12" value="<%=em.getNeike12()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b><br><br>
                    <div align="center">
                                    <textarea name="neikecon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getNeikecon()%></textarea>
                    </div>
                  </td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text"name="waike1" value="<%=em.getWaike1()%>" maxlength="15"></td>
                  <td><b>甲状腺</b></td>
                  <td><input type="text"name="waike2" value="<%=em.getWaike2()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>四肢关节</b></td>
                  <td><input type="text"name="waike3" value="<%=em.getWaike3()%>" maxlength="15"></td>
                  <td><b>乳房</b></td>
                  <td><input type="text"name="waike4" value="<%=em.getWaike4()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>头面部</b></td>
                  <td><input type="text"name="waike5" value="<%=em.getWaike5()%>" maxlength="15"></td>

                  <td><b>皮肤</b></td>
                  <td><input type="text"name="waike6" value="<%=em.getWaike6()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>生殖器</b></td>
                  <td><input type="text"name="waike7" value="<%=em.getWaike7()%>" maxlength="15"></td>
                  <td><b>胆囊触诊</b></td>
                  <td><input type="text"name="waike8" value="<%=em.getWaike8()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>关节</b></td>
                  <td><input type="text"name="waike9" value="<%=em.getWaike9()%>" maxlength="15"></td>
                  <td><b>肛门直肠</b></td>
                  <td><input type="text"name="waike10" value="<%=em.getWaike10()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>疝气</b></td>
                  <td><input type="text"name="waike11" value="<%=em.getWaike11()%>" maxlength="15"></td>
                  <td><b>脊柱</b></td>
                  <td><input type="text"name="waike12" value="<%=em.getWaike12()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b><br><br>
                    <div align="center">
                                    <textarea name="waikecon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getWaikecon()%></textarea>
                    </div>
                  </td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="yanke1" value="<%=em.getYanke1()%>" maxlength="15"></td>
                  <td><b>眼睑</b></td>
                  <td><input type="text" name="yanke2" value="<%=em.getYanke2()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>球结膜</b></td>
                  <td><input type="text" name="yanke3" value="<%=em.getYanke3()%>" maxlength="15"></td>
                  <td><b>角膜</b></td>
                  <td><input type="text" name="yanke4" value="<%=em.getYanke4()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>色盲</b></td>
                  <td><input type="text" name="yanke5" value="<%=em.getYanke5()%>" maxlength="15"></td>
                  <td><b>色弱</b></td>
                  <<td><input type="text" name="yanke6" value="<%=em.getYanke6()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>裸眼视力左</b></td>
                  <td><input type="text" name="yanke7" maxlength="5" value="<%=em.getYanke7()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                  <td><b>裸眼视力右</b></td>
                  <td><input type="text" name="yanke8" maxlength="5"  value="<%=em.getYanke8()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                </tr>
                <tr>
                  <td><b>矫正视力左</b></td>
                  <td><input type="text" name="yanke9" maxlength="5" value="<%=em.getYanke9()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                  <td><b>矫正视力右</b></td>
                  <td><input type="text" name="yanke10" maxlength="5" value="<%=em.getYanke10()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b><br><br>
                    <div align="center">
                                    <textarea name="yankecon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getYankecon()%></textarea>
                    </div>
                  </td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="er" value="<%=em.getEr()%> " maxlength="15"></td>
                  <td><b>鼻</b></td>
                  <td><input type="text" name="bi" value="<%=em.getBi()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>咽</b></td>
                  <td><input type="text" name="yan" value="<%=em.getYan()%>" maxlength="15"></td>
                  <td><b>扁桃体</b></td>
                  <td><input type="text" name="biantaoti" value="<%=em.getBiantaoti()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>喉</b></td>
                  <td><input type="text" name="hou" value="<%=em.getHou()%>" maxlength="15"></td>
                  <td><b></b></td>
                  <td></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b><br><br>
                    <div align="center">
                                    <textarea name="erbihoucon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getYankecon()%></textarea>
                    </div>
                  </td>
                </tr>
              </table>

              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="oral1" value="<%=em.getOral1()%>" maxlength="15"></td>
                  <td><b>牙及牙龈</b></td>
                  <td><input type="text" name="oral2" value="<%=em.getOral2()%>" maxlength="15"></td>
                </tr>
                <tr>
                  <td><b>舌</b></td>
                  <td><input type="text" name="oral3" value="<%=em.getOral3()%>" maxlength="15"></td>
                  <td><b></b></td>
                  <td></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b><br><br>
                    <div align="center">
                                    <textarea name="oralcon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getYankecon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="ecg1" maxlength="5" value="<%=em.getEcg1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                  <td><b>PR间期(ms)</b></td>
                  <td><input type="text" name="ecg2" maxlength="5" value="<%=em.getEcg2()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                </tr>
                <tr>
                  <td><b>QT间期(ms)</b></td>
                  <td><input type="text" name="ecg3" maxlength="5" value="<%=em.getEcg3()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                  <td><b>QRS宽度(ms)</b></td>
                  <td><input type="text" name="ecg4" amxlength="5" value="<%=em.getEcg4()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>心电图报告小结:</b><br><br>
                    <div align="center">
                                    <textarea name="ecgcon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getEcgcon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
                <tr>
                  <td colspan="4" align="center" bgcolor="#e6e6e6"><b>超声检测报告</b></td>
                </tr>
                <tr>
                  <td><b>项目名称</b></td>
                  <td><b>肝、胆、脾、胰、肾、前列腺</b></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>超声波检测报告:</b><br><br>
                    <div align="center">
                                    <textarea name="ecgcon" style="resize:none;width:100%;height:80px"
                                              maxlength="80" placeholder="注意字数少于80" ><%=em.getBchaocon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
                <tr>
                  <td colspan="2" align="center" bgcolor="#e6e6e6"><b>放射科</b></td>
                </tr>
                <tr>
                  <td><b>项目名称</b></td>
                  <td><b>检测结果</b></td>
                </tr>
                <tr>
                  <td><b>胸腔透视</b></td>
                  <td colspan="4">
                    <div align="center">
                                    <textarea name="fangshe1" style="resize:none;width:100%;height:80px"
                                              maxlength="80" placeholder="注意字数少于80" ><%=em.getFangshe1()%></textarea>
                    </div></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b><br><br>
                    <div align="center">
                                    <textarea name="fangshecon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getFangshecon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" maxlength="10" name="cancer1" value="<%=em.getCancer1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.00-10.00</td>
                  <td>ug/L</td>
                </tr>
                <tr>
                  <td><b>甲胎蛋白</b></td>
                  <td><input type="text" name="cancer2" maxlength="10" value="<%=em.getCancer2()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.00-25.00</td>
                  <td>ug/L</td>
                </tr>
                <tr>
                  <td><b>鳞状癌抗原</b></td>
                  <td><input type="text" name="cancer3" maxlength="10" value="<%=em.getCancer3()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.00-2.90</td>
                  <td>mg/L</td>
                </tr>
                <tr>
                  <td><b>前列腺特异抗原</b></td>
                  <td><input type="text" name="cancer4" maxlength="10" value="<%=em.getCancer4()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.00-5.00</td>
                  <td>ug/L</td>
                </tr>
                <tr>
                  <td><b>糖类抗原(CA199)</b></td>
                  <td><input type="text" name="cancer5" maxlength="10" value="<%=em.getCancer5()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.00-35.00</td>
                  <td>KU/L</td>
                </tr>
                <tr>
                  <td><b>糖类抗原(CA211)</b></td>
                  <td><input type="text" name="cancer6" maxlength="10" value="<%=em.getCancer6()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.00-4.90</td>
                  <td>mg/L</td>
                </tr>
                <tr>

                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                                    <textarea name="cancercon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getCancercon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="blood1" maxlength="8" value="<%=em.getBlood1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>4-5.5</td>
                  <td>10E12/L</td>
                </tr>
                <tr>
                  <td><b>红细胞压积</b></td>
                  <td><input type="text" name="blood2" maxlength="8" value="<%=em.getBlood2()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>42-49</td>
                  <td>L/L</td>
                </tr>
                <tr>
                  <td><b>红细胞平均体积</b></td>
                  <td><input type="text" name="blood3" maxlength="8" value="<%=em.getBlood3()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>82-95</td>
                  <td>f1</td>
                </tr>
                <tr>
                  <td><b>红细胞平均血红蛋白</b></td>
                  <td><input type="text" name="blood4" maxlength="8" value="<%=em.getBlood4()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>27-33</td>
                  <td>pg</td>
                </tr>
                <tr>
                  <td><b>平均血红蛋白浓度</b></td>
                  <td><input type="text" name="blood5" maxlength="8" value="<%=em.getBlood5()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>320-360</td>
                  <td>g/L</td>
                </tr>
                <tr>
                  <td><b>血小板计数</b></td>
                  <td><input type="text" name="blood6" maxlength="8" value="<%=em.getBlood6()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>100-300</td>
                  <td>10E9/L</td>
                </tr>
                <tr>
                  <td><b>血小板平均体积</b></td>
                  <td><input type="text" name="blood7" value="<%=em.getBlood7()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>6-14</td>
                  <td>f1</td>
                </tr>
                <tr>
                  <td><b>血小板压积</b></td>
                  <td><input type="text" name="blood8" maxlength="8" value="<%=em.getBlood8()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.108-0.282</td>
                  <td>L/F</td>
                </tr>
                <tr>
                  <td><b>血小板体积分布密度</b></td>
                  <td><input type="text" name="blood9"  maxlength="8" value="<%=em.getBlood9()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>15-17</td>
                  <td>%</td>
                </tr>
                <tr>
                  <td><b>血红蛋白</b></td>
                  <td><input type="text" name="blood10" maxlength="8" value="<%=em.getBlood10()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>120-160</td>
                  <td>g/L</td>
                </tr>
                <tr>
                  <td><b>白细胞计数</b></td>
                  <td><input type="text" name="blood11" maxlength="8" value="<%=em.getBlood11()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>4-10</td>
                  <td>10E9/L</td>
                </tr>
                <tr>
                  <td><b>淋巴细胞绝对值</b></td>
                  <td><input type="text" name="blood12" maxlength="8" value="<%=em.getBlood12()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.8-4</td>
                  <td>10E9/L</td>
                </tr>
                <tr>
                  <td><b>中性粒细胞绝对值</b></td>
                  <td><input type="text" name="blood13" maxlength="8" value="<%=em.getBlood13()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>2-7</td>
                  <td>10E9/L</td>
                </tr>
                <tr>
                  <td><b>单核细胞绝对值</b></td>
                  <td><input type="text" name="blood14" maxlength="8" value="<%=em.getBlood14()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.1-0.9</td>
                  <td>10E9/L</td>
                </tr>
                <tr>
                  <td><b>淋巴细胞相对百分比</b></td>
                  <td><input type="text" name="blood15" maxlength="8" value="<%=em.getBlood15()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>20-40</td>
                  <td>%</td>
                </tr>
                <tr>
                  <td><b>粒细胞相对百分比</b></td>
                  <td><input type="text" name="blood16" maxlength="8" value="<%=em.getBlood16()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>50-75</td>
                  <td>%</td>
                </tr>
                <tr>
                  <td><b>单核细胞相对百分比</b></td>
                  <td><input type="text" name="blood17" maxlength="8" value="<%=em.getBlood17()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>3-9</td>
                  <td>%</td>
                </tr>
                <tr>
                  <td><b>红细胞体积分布宽度</b></td>
                  <td><input type="text" name="blood18" maxlength="8" value="<%=em.getBlood18()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>10.6-15</td>
                  <td>%</td>
                </tr>
                <tr>
                  <td><b>血沉</b></td>
                  <td><input type="text" name="blood19" maxlength="8" value="<%=em.getBlood19()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0-15</td>
                  <td></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                                    <textarea name="bloodcon" style="resize:none;width:100%;height:80px"
                                              maxlength="80" placeholder="注意字数少于80" ><%=em.getBloodcon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="urine1" value="<%=em.getUrine1()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>尿糖（GLU)</b></td>
                  <td><input type="text" name="urine2" value="<%=em.getUrine2()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>鸟胆红素（BLL）</b></td>
                  <td><input type="text" name="urine3" value="<%=em.getUrine3()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>尿胆原（URO）</b></td>
                  <td><input type="text"  name="urine4" maxlength="10" value="<%=em.getUrine4()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0-15</td>
                  <td>umol/L</td>
                </tr>
                <tr>
                  <td><b>尿潜血（BLO）</b></td>
                  <td><input type="text" name="urine5"  value="<%=em.getUrine5()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td>umol/L</td>
                </tr>
                <tr>
                  <td><b>尿酮体（KET）</b></td>
                  <td><input type="text" name="urine6" value="<%=em.getUrine6()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td>mg/L</td>
                </tr>
                <tr>
                  <td><b>亚硝酸盐（NIT）</b></td>
                  <td><input type="text" name="urine7" value="<%=em.getUrine7()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>尿白细胞（LEU)</b></td>
                  <td><input type="text" name="urine8" value="<%=em.getUrine8()%>" maxlength="10"></td>
                  <td>阴性</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>尿比重（）</b></td>
                  <td><input type="text" name="urine9" maxlength="10" value="<%=em.getUrine9()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>1-1.03</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>尿酸碱值</b></td>
                  <td><input type="text" name="urine10" maxlength="10" value="<%=em.getUrine10()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>4.5-8</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>镜检红细胞</b></td>
                  <td><input type="text" name="urine11" maxlength="10" value="<%=em.getUrine11()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0-3</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>镜检白细胞</b></td>
                  <td><input type="text" name="urine12" maxlength="10" value="<%=em.getUrine12()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0-5</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>上皮细胞</b></td>
                  <td><input type="text" name="urine13" value="<%=em.getUrine13()%>" maxlength="10"></td>
                  <td>未见</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>管型</b></td>
                  <td><input type="text" name="urine14" value="<%=em.getUrine14()%>" maxlength="10"></td>
                  <td>未见</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>结晶</b></td>
                  <td><input type="text" name="urine15" value="<%=em.getUrine15()%>" maxlength="10"></td>
                  <td>未见</td>
                  <td></td>
                </tr>
                <tr>
                  <td><b>粘液丝</b></td>
                  <td><input type="text" name="urine16" value="<%=em.getUrine16()%>" maxlength="10"></td>
                  <td>未见</td>
                  <td></td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                                    <textarea name="urinecon" style="resize:none;width:100%;height:80px"
                                              maxlength="80" placeholder="注意字数少于80" ><%=em.getUrinecon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="liver1"  maxlength="8" value="<%=em.getLiver1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>5-22</td>
                  <td>umol/L</td>
                </tr>
                <tr>
                  <td><b>谷草转氨酶</b></td>
                  <td><input type="text" name="liver2" maxlength="8" value="<%=em.getLiver2()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>5-40</td>
                  <td> U/L</td>
                </tr>
                <tr>
                  <td><b>谷丙转氨酶</b></td>
                  <td><input type="text" name="liver3" maxlength="8" value="<%=em.getLiver3()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0-55</td>
                  <td> U/L</td>
                </tr>
                <tr>
                  <td><b>总蛋白</b></td>
                  <td><input type="text" name="liver4"  maxlength="8" value="<%=em.getLiver4()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>62-82</td>
                  <td>g/L</td>
                </tr>
                <tr>
                  <td><b>白蛋白</b></td>
                  <td><input type="text" name="liver5" maxlength="8" value="<%=em.getLiver5()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>35-55</td>
                  <td> U/L</td>
                </tr>
                <tr>
                  <td><b>球蛋白</b></td>
                  <td><input type="text" name="liver6" maxlength="8" value="<%=em.getLiver6()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>20-34</td>
                  <td> U/L</td>
                </tr>
                <tr>
                  <td><b>白球比</b></td>
                  <td><input type="text" name="liver7" maxlength="8" value="<%=em.getLiver7()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>1.5-2.5</td>
                  <td>%</td>
                </tr>
                <tr>
                  <td><b>碱性磷酸酶</b></td>
                  <td><input type="text" name="liver8" maxlength="8" value="<%=em.getLiver8()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>40-150</td>
                  <td>u/L</td>
                </tr>
                <tr>
                  <td><b> 直接胆红素</b></td>
                  <td><input type="text" name="liver9" maxlength="8" value="<%=em.getLiver9()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>1.7-6.8</td>
                  <td>umol/L</td>
                </tr>
                <tr>
                  <td><b> 间接胆红素</b></td>
                  <td><input type="text" name="liver10" maxlength="8" value="<%=em.getLiver10()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>3.3-15.2</td>
                  <td>umol/L</td>
                </tr>
                <tr>
                  <td><b>总胆汁酸</b></td>
                  <td><input type="text" name="liver11" maxlength="8" value="<%=em.getLiver11()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0-10</td>
                  <td>umol/L</td>
                </tr>
                <tr>
                  <td><b>r-谷氨酸基转移酶</b></td>
                  <td><input type="text" name="liver12" maxlength="8" value="<%=em.getLiver12()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>7-50</td>
                  <td>u/L</td>
                </tr>
                <tr>

                  <td colspan="4"><b>本科小结:</b>
                    <div align="center">
                                    <textarea name="livercon" style="resize:none;width:100%;height:80px"
                                              maxlength="80" placeholder="注意字数少于80" ><%=em.getLivercon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="bloodfat1" maxlength="8" value="<%=em.getBloodfat1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>2.3-5.7</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td><b>甘油三酯</b></td>
                  <td><input type="text" name="bloodfat2" maxlength="8" value="<%=em.getBloodfat2()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.5-1.7</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td><b>低密度脂蛋白</b></td>
                  <td><input type="text" name="bloodfat3" maxlength="8" value="<%=em.getBloodfat3()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>2.1-3.1</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td><b>高密度脂蛋白</b></td>
                  <td><input type="text" name="bloodfat4" maxlength="8" value="<%=em.getBloodfat4()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>0.8-1.8</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                                    <textarea name="bloodfatcon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getBloodfatcon()%></textarea>
                    </div></td>
                </tr>
              </table>

              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="kidney1" maxlength="8" value="<%=em.getKidney1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>53-136</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td><b>尿素氮</b></td>
                  <td><input type="text" name="kidney2" maxlength="8" value="<%=em.getKidney2()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>2.3-7.2</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td><b>尿酸</b></td>
                  <td><input type="text" name="kidney3" maxlength="8" value="<%=em.getKidney3()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>155-428</td>
                  <td>mmol/L</td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                                    <textarea name="kidneycon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getKidneycon()%></textarea>
                    </div></td>
                </tr>
              </table>

              <table class="table table-bordered table-responsive ">
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
                  <td><input type="text" name="xuetang1" maxlength="8" value="<%=em.getXuetang1()%>" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" /></td>
                  <td>3.9-6.1</td>
                  <td>mmmol/L</td>
                </tr>
                <tr>
                  <td colspan="4">
                    <b>本科小结:</b>
                    <div align="center">
                                    <textarea name="xuetangcon" style="resize:none;width:100%;height:80px"
                                              maxlength="50" placeholder="注意字数少于50" ><%=em.getXuetangcon()%></textarea>
                    </div></td>
                </tr>
              </table>
              <table class="table table-bordered table-responsive ">
                <tr>
                  <td colspan="4" align="center" bgcolor="#e6e6e6"><b>总结结论</b></td>
                </tr>
                <tr>
                  <td>
                    <div align="center">
                                    <textarea name="summary" style="resize:none;width:100%;height:80px"
                                              maxlength="200" placeholder="注意字数少于200" ></textarea>
                    </div>
                  </td>
                </tr>
              </table>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-primary">确认修改</button><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                  <button type="button" onclick="javascript:window.location.href='redirect:/examinationList';" class="btn btn-primary">放弃更改</button>
                </div>
              </div>
            </form>
          <%--</div>--%>
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
        $('.timepicker').datetimepicker({
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
        function ValidateNumber(e, pnumber)
        {
            if (!/^\d+[.]?\d*$/.test(pnumber))
            {
                e.value = /^\d+[.]?\d*/.exec(e.value);
            }
            return false;
        }
        function change(form) {
            if (form.date.value == "") {
                swal({title:"错误",text:"体检时间不能为空！",type:"warning"});
                return false;
            }
        }

    </script>
  </body>
</html>
