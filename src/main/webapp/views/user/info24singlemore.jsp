<%@ page import="java.text.ParsePosition" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.xingou.tools.MyTools" %>
<%@ page import="com.xingou.entity.Info24" %>
<%@ page import="com.xingou.entity.User" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="org.json.JSONObject" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/22
  Time: 20:21
  To change this template use File | Settings | File Templates.
  view page content type=text/html charest=UTF|Fule templates
  使用ajax的方法实时读取比例
  优点是读取数据很快，缺点，当数据量很大的时候，轻轻拖动滚动条，图像就移动位置很多，不连贯，用户体验较差
  这一版本的特点是使用于时间比较长的数据
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%--<link href="/css/custom.min.css" rel="stylesheet">--%>
    <link href="/css/dashboard.css" rel="stylesheet">
</head>
<body class="nav-md">
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-default navbar-custom navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="homepage.jsp"><strong>心狗健康管理系统</strong></a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="/quit">退出登陆</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <%
        String receivedScale = (String) session.getAttribute("scale");
        Float scale= MyTools.strTofloat(receivedScale);
        System.out.println("scale"+scale);
        Info24 single=(Info24)request.getAttribute("info24single");
        User user=(User)session.getAttribute("user");

//        String info="[{'time':'2017-02-05 22:06:44','xdgs':88, 'sxxdgs':65, 'xdgh':99,'fxyb':0,'sxyb':0,'xlbq':0,'sxzb':0,'fxzb':0,'jjxzb':0,'fc':0 },{'time':'2017-02-05 22:06:44','xdgs':88, 'sxxdgs':65, 'xdgh':99,'fxyb':0,'sxyb':0,'xlbq':0,'sxzb':0,'fxzb':0,'jjxzb':0,'fc':0 },{'time':'2017-02-05 22:06:44','xdgs':88, 'sxxdgs':65, 'xdgh':99,'fxyb':0,'sxyb':0,'xlbq':0,'sxzb':0,'fxzb':0,'jjxzb':0,'fc':0 }]";
        String info =single.getConclusion();
        System.out.println(info);
        JSONArray infoJson=new JSONArray();
        try {
            infoJson = new JSONArray(info);
        } catch (JSONException e) {
            e.printStackTrace();
        }
//       得到结束时间
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date starttime=formatter.parse(single.getDate());
        long forendtime=(starttime.getTime()/1000)+single.getTime();
        Date starttime2= formatter.parse(single.getDate());
        starttime2.setTime(forendtime*1000);
        String endtime=formatter.format(starttime2);
        int h = single.getTime() / 3600;
        int m = (single.getTime() % 3600) / 60;
        int s = (single.getTime() % 3600) % 60;
        String w_time = h + "小时" + m + "分" + s + "秒";
    %>
    <div class="row" style="text-align: center">
        <div style="border:black 0.1px solid;-moz-border-radius:20px;-webkit-border-radius:20px;border-radius:20px;width: 1100px;height:1500px;margin-left: auto;margin-right: auto;margin-top:10px; ">
            <h2><img src="/images/logo_sin.jpg" height=50px width=50px type="float:left">24小时Holter心电检测报告</h2>
            <p>
                <font size="4">
                    姓名:<%=user.getUname()%>&nbsp;&nbsp;&nbsp;性别:<%=user.getUserinfo().getGender()%>&nbsp;&nbsp;&nbsp;年龄:<%=user.getUserinfo().getAge()%>&nbsp;&nbsp;&nbsp;时间:<%=single.getDate()%>
                    至<%=endtime%>&nbsp;&nbsp;&nbsp;总时长:<%=w_time%>
                </font>
            </p>
            <div id="box" style="position:relative;width:1002px;height:303px;overflow: hidden;margin-left:auto;margin-right: auto;">
                <div id="pageLoading" style="width:1002px;height:303px;background-color: white;position: absolute;z-index: 2">
                    <img src="/images/loading.gif" style="margin-top: 100px;"/>
                    <p style="text-align: center; vertical-align: central;">
                        请稍等，正在为您加载数据
                    </p>
                </div>
                <canvas id="content" height="303px" width="17027px"  style="position: absolute;z-index: 1;left: 0">
                    您的浏览器不支持canvas
                </canvas>
                <canvas id="contentbg" width="1002px" height="303px" style="position: absolute; z-index: 0;left: 0"></canvas>
            </div>
            <div id="parent" style="width: 1000px;height:20px;background:#d0c5c5;position:relative;top:0;margin-left:auto;margin-right: auto;">
                <div id="child" style="width:30px;height:20px;background:green;position:absolute;"></div>
            </div>
            <div id="box2" style="position: relative;width: 1002px;height: 57px;overflow: hidden;margin-left:auto;margin-right: auto;">
                <canvas id="content2" height="57px" width="8504px" style="position: absolute;z-index: 2;left: 0">
                    您的浏览器不支持canvas
                </canvas>
                <canvas id="selectbg" width="491.34" height="57" style="position:absolute;z-index:1;left:0"></canvas>
                <canvas id="contentbg2" width="1002" height="57" style="position:absolute;z-index:0;left:0"></canvas>
            </div>
            <div id="parent2" style="width: 1000px;height:20px;background:#d0c5c5;position:relative;top:0;margin-left:auto;margin-right: auto;">
                <div id="child2" style="width:30px;height:20px;background:green;position:absolute;"></div>
            </div>
            <canvas id="small" width="1000px" height="30px" style="border:black 0.1px solid">您的浏览器不支持canvas</canvas>
            <br><br>
            <div style="width: 1000px;height: 20px;position: relative;margin-left:auto;margin-right: auto;">
                <span style="position: absolute;left: 0;"><font size="1"><%=single.getDate()%></font></span>
                <div style="width: 50px;height: 15px;background-color: #fe151a;display:inline-block"></div>
                <span >红色部分代表心电图严重异常</span>
                <div style="width: 50px;height: 15px;background-color: #ffff00;display:inline-block"></div>
                <span >黄色区域代表疑似度较高</span>
                <div style="width: 50px;height: 15px;background-color: #49f958;display:inline-block"></div>
                <span >绿色区域代表健康</span>
                <span style="position: absolute;right: 0px;"><font size="1"><%=endtime%></font></span>
            </div>
            <br><br>
            <%--<div style="margin-left: auto;margin-right: auto">--%>
            <div style="border-top:solid;border-bottom:solid; ">
                <div id="chart1" style="border-right : solid red ;width: 48%;height: 400px;display:inline-block"></div>
                <div id="chart2" style="width: 48%;height: 400px;display:inline-block"></div>
            </div>
            <%--</div>--%>
            <%--<p id="test">123</p>--%>
            <%--<button type="button" class="btn btn-primary" onclick="download()">下载心电报告</button>--%>
            <%--</div>--%>
            <br><br><br><br><br>
        </div>
        <br>
    </div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/jspdf/1.3.3/jspdf.debug.js"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>--%>
<script src="/js/html2canvas.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
<script>
    <%--这个是获得屏幕DPI的地方方法--%>
    function js_getDPI() {
        var arrDPI = new Array;
        if (window.screen.deviceXDPI) {
            arrDPI[0] = window.screen.deviceXDPI;
            arrDPI[1] = window.screen.deviceYDPI;
        }
        else {
            var tmpNode = document.createElement("DIV");
            tmpNode.style.cssText = "width:1in;height:1in;position:absolute;left:0px;top:0px;z-index:99;visibility:hidden";
            document.body.appendChild(tmpNode);
            arrDPI[0] = parseInt(tmpNode.offsetWidth);
            arrDPI[1] = parseInt(tmpNode.offsetHeight);
            tmpNode.parentNode.removeChild(tmpNode);
        }
        return arrDPI;
    }
</script>
<%--下面是绘制canvas的那个背景网格的js--%>
<script>
    var canvasbg = document.getElementById("contentbg");
    var canbg=canvasbg.getContext("2d");
    canbg.font="23px Arial";
    var arrDPI = js_getDPI();
    var scale=5*25.4/arrDPI[0];
    //绘制网格
    canbg.beginPath();
    canbg.strokeStyle ="#e03443";//f1c1c5
    canbg.lineWidth=0.18;
    for (var x=0;x<(1002);x +=5/scale){
        canbg.moveTo(x,0);
        canbg.lineTo(x,500/scale);
    }
    for (var y=0;y<501/scale;y+=5/scale){
        canbg.moveTo(0,y);
        canbg.lineTo(1001.57,y);//25*53/1.3229166
    }
    canbg.stroke();
    canbg.beginPath();
    canbg.lineWidth=0.4;
    canbg.strokeStyle ="#e00608";// e03443"#f1dedf";"#f0adaa"//"#e0514b"
    for (var x=0;x<(1002);x +=25/scale){
        canbg.moveTo(x,0);
        canbg.lineTo(x,500/scale);
    }
    for (var y=0;y<501/scale;y+=25/scale){
        canbg.moveTo(0,y);
        canbg.lineTo(1001.57,y);
    }
    canbg.stroke();
    //描述性的文字

    canbg.beginPath();
    canbg.font = "12px Arial";
    canbg.fillText("5mm",25/scale,21/scale);
    canbg.fillRect( 25 / scale, 25 / scale, 25 / scale, 8 / scale);
    canbg.stroke();
    canbg.beginPath();
    canbg.lineWidth=1;
    canbg.font="15px Arial";
    canbg.textAlign = "start";
    <%--canbg.fillText("起始时间:<%=single.getDate()%>",25/scale,25/scale);--%>
    canbg.fillText("增益:10mm/mv",75
        /scale,25/scale);
    canbg.fillText("走速:25mm/s",225/scale,25/scale);
    canbg.stroke();
    //这一部分是标定符号
    canbg.beginPath();
    canbg.lineWidth=2;
    canbg.strokeStyle="#000";

    canbg.moveTo(0/scale,125/scale);
    canbg.lineTo(5/scale,125/scale);
    canbg.lineTo(5/scale,75/scale);
    canbg.lineTo(20/scale,75/scale);
    canbg.lineTo(20/scale,125/scale);
    canbg.lineTo(25/scale,125/scale);

    canbg.moveTo(5/scale,130/scale);
    canbg.lineTo(20/scale,130/scale);
    canbg.moveTo(10/scale,130/scale);
    canbg.lineTo(10/scale,145/scale);
    canbg.moveTo(15/scale,130/scale);
    canbg.lineTo(15/scale,145/scale);
    canbg.moveTo(5/scale,145/scale);
    canbg.lineTo(20/scale,145/scale);
    canbg.stroke();

    var contentbg2 = document.getElementById("contentbg2");
    var canbg2=contentbg2.getContext("2d");
    canbg2.beginPath();
    canbg2.lineWidth=0.4;
    canbg2.strokeStyle ="#e00608";// e03443"#f1dedf";"#f0adaa"//"#e0514b"
    for (var x=0;x<(1002);x +=12.5/scale){
        canbg2.moveTo(x,0);
        canbg2.lineTo(x,75/scale);
    }
    for (var y=0;y<76/scale;y+=12.5/scale){
        canbg2.moveTo(0,y);
        canbg2.lineTo(1001.57,y);
    }
    canbg2.stroke();
</script>

<script>
    var len;
    var Data;
    $.ajax({
        type: "POST",
        url:"/info24SingleDataMore",
        data:{addr:"<%=single.getDataaddr()%>",datascale:0},
        dataType:"json",
        async:false,
        success:function (json) {
            Data = json.Data;
            len = json.len;
        }
    });

    var xData = Data.split(",");
    var datas = eval(<%=info%>);
    var canvas2 = document.getElementById("content2");
    var can2 = canvas2.getContext("2d");
    can2.beginPath();
    can2.strokeStyle = "#000";
    can2.lineWidth = 1.4;
    can2.moveTo(0, (37.5 - xData[0] / 273000) / scale);
    for(var x=1;x<92161;x++) {
        can2.lineTo((0.12207*x)/scale,(37.5 - xData[x] / 273000) / scale)
    }
    can2.stroke();
    var canvas = document.getElementById("content");
    var can=canvas.getContext("2d");
    can.beginPath();
    can.strokeStyle="#000";
    can.lineWidth =1.6;
    can.moveTo(25,(125-xData[0]/136500)/scale);
    for(var x=1;x<92161;x++){
        can.lineTo((25+0.24414*x)/scale,(125-xData[x]/136500)/scale)//标定之前是30000飞哥版本91000
    }
    can.stroke();
    var infoindex = 0;
    can.beginPath();
    can.font = "15px Arial";
    for (var x=0;x<9;x++) {
        var endtime = datas[infoindex + x].time;
        var d = new Date(endtime.substring(0, 4),
            endtime.substring(5, 7) - 1,
            endtime.substring(8, 10),
            endtime.substring(11, 13),
            endtime.substring(14, 16),
            endtime.substring(17, 19));
        d.setTime(d.getTime() - 10 * 1000);
        //alert(d.toLocaleString());
        var mediumtime = d.getFullYear() + "-"
            + (d.getMonth() + 1)
            + "-" + d.getDate()
            + " " + d.getHours()
            + ":" + d.getMinutes()
            + ":" + d.getSeconds();
        can.fillText(mediumtime,(1075+2500*x) / scale, 400 / scale);
        can.fillText(endtime,(2325+2500*x) / scale, 400 / scale);
        can.fillText("心动过速疑似度:" + datas[infoindex+x].xdgs + "%", (2075+2500*x) / scale, 265 / scale);
        can.fillText("室性心动过速疑似度:" + datas[infoindex+x].sxxdgs + "%", (2075+2500*x) / scale, 285 / scale);
        can.fillText("心动过缓疑似度:" + datas[infoindex+x].xdgs + "%", (2075+2500*x) / scale, 305 / scale);
        can.fillText("房性逸搏疑似度:" + datas[infoindex+x].fxyb + "%", (2075+2500*x) / scale, 325 / scale);
        can.fillText("室性逸搏疑似度:" + datas[infoindex+x].sxyb + "个", (2075+2500*x) / scale, 345 / scale);

        can.fillText("心率不齐疑似度:" + datas[infoindex+x].xlbq + "%", (2325+2500*x) / scale, 265 / scale);
        can.fillText("室性早搏疑似度:" + datas[infoindex+x].sxzb + "个", (2325+2500*x) / scale, 285 / scale);
        can.fillText("房性早搏疑似度:" + datas[infoindex+x].fxzb + "%", (2325+2500*x) / scale, 305 / scale);
        can.fillText("交界性早搏疑似度:" + datas[infoindex+x].jjxzb + "%", (2325+2500*x) / scale, 325 / scale);
        can.fillText("房颤疑似度:" + datas[infoindex+x].fc + "%", (2325+2500*x) / scale, 345 / scale);
//                can.fillText("状态:"+datas[infoindex].state,1000/scale,490/scale);
//        can.fillText(datas[infoindex+x].time,(2075+2500*x) / scale,400/scale);
        can.stroke();
    }
    var canvas3 = document.getElementById("selectbg");
    var can3 = canvas3.getContext("2d");
    can3.fillStyle = "rgba(102,179,241,0.6)";
    can3.fillRect(0, 0, 491.34, 57);
    $("#pageLoading").hide();

    window.onload=function () {
        var oParent = document.getElementById("parent");
        var oParent2 = document.getElementById("parent2");
        var oBox = document.getElementById("box");
        var oBox2 = document.getElementById("box2");
        var oChild = document.getElementById("child");
        var oChild2 = document.getElementById("child2");
        var oContent = document.getElementById("content");
        var oContent2 = document.getElementById("content2");

        var disX2=0;
        oChild2.onmousedown = function (ev) {
            var ev = ev || window.event;
            disX2=ev.clientX - oChild2.offsetLeft;
            document.onmousemove=function (ev) {
                $("#pageLoading").show();
                $("#content2").hide();
                var ev = ev || window.event;
//                var oBox = document.getElementById('box');
                var L2 = ev.clientX - disX2;  // 限制小div拖动范围
                if (L2 < 0) {
                    L2 = 0;
                }
                else if (L2 > oParent2.offsetWidth - oChild2.offsetWidth) {
                    L2 = oParent2.offsetWidth - oChild2.offsetWidth;
                }
                dragScale2 = L2 / (oParent2.offsetWidth - oChild2.offsetWidth);
                oChild2.style.left = L2  + 'px';
                oChild.style.left = 0 + 'px';
            };
            document.onmouseup=function(){
                $.ajax({
                    type: "POST",
                    url:"/info24SingleDataMore",
                    data:{addr:"<%=single.getDataaddr()%>",datascale:dragScale2},
                    dataType:"json",
                    async:false,
                    success:function (json) {
                        Data = json.Data;
                    }
                });
                xData = Data.split(",");

                $("#content2").remove();
                $("#content").remove();
                $("#selectbg").remove();
//                document.getElementById("selectbg").style.left = 0;//如果这样的话，会出现问题，颜色越来越深
                $("#contentbg2").after("<canvas id=\"content2\" height=\"57\" width=\"8504px\" style=\"position: absolute;z-index: 2;left: 0\">您的浏览器不支持canvas</canvas>");
                $("#contentbg2").after("<canvas id=\"selectbg\" height=\"57\" width=\"491.34px\" style=\"position: absolute;z-index: 1;left: 0\">您的浏览器不支持canvas</canvas>");
                $("#contentbg").after("<canvas id=\"content\" height=\"303\" width=\"17027px\" style=\"position: absolute;z-index: 1;left: 0\">您的浏览器不支持canvas</canvas>");
                var canvas3 = document.getElementById("selectbg");
                var can3 = canvas3.getContext("2d");
                can3.fillStyle = "rgba(102,179,241,0.6)";
                can3.fillRect(0, 0, 491.34, 57);
                var canvas2 = document.getElementById("content2");
                var can2 = canvas2.getContext("2d");
                can2.beginPath();
                can2.strokeStyle = "#000";
                can2.lineWidth = 1.4;
                can2.moveTo(0, (37.5 - xData[0] / 273000) / scale);
                for(var x=1;x<92161;x++) {
                    can2.lineTo((0.12207*x)/scale,(37.5 - xData[x] / 273000) / scale)
                }
                can2.stroke();
                var canvas = document.getElementById("content");
                var can=canvas.getContext("2d");
                can.beginPath();
                can.strokeStyle="#000";
                can.lineWidth =1.6;
                can.moveTo(25,(125-xData[0]/136500)/scale);
                for(var x=1;x<92161;x++){
                    can.lineTo((25+0.24414*x)/scale,(125-xData[x]/136500)/scale)//标定之前是30000飞哥版本91000
                }
                can.stroke();
                var infoindex = Math.floor(dragScale2 * (len - 92160)/10240);
                var biasScale = (dragScale2 * (len - 92160) / 10240) % 1*2500;
                can.beginPath();
                can.font = "15px Arial";
                for (var x=0;x<10;x++) {
                    var endtime = datas[infoindex + x].time;
                    var d = new Date(endtime.substring(0, 4),
                        endtime.substring(5, 7) - 1,
                        endtime.substring(8, 10),
                        endtime.substring(11, 13),
                        endtime.substring(14, 16),
                        endtime.substring(17, 19));
                    d.setTime(d.getTime() - 10 * 1000);
                    //alert(d.toLocaleString());
                    var mediumtime = d.getFullYear() + "-"
                        + (d.getMonth() + 1)
                        + "-" + d.getDate()
                        + " " + d.getHours()
                        + ":" + d.getMinutes()
                        + ":" + d.getSeconds();
                    can.fillText(mediumtime,(1075+2500*x-biasScale) / scale, 400 / scale);
                    can.fillText(endtime,(2325+2500*x-biasScale) / scale, 400 / scale);
                    can.fillText("心动过速疑似度:" + datas[infoindex+x].xdgs + "%", (2075+2500*x-biasScale) / scale, 265 / scale);
                    can.fillText("室性心动过速疑似度:" + datas[infoindex+x].sxxdgs + "%", (2075+2500*x-biasScale) / scale, 285 / scale);
                    can.fillText("心动过缓疑似度:" + datas[infoindex+x].xdgs + "%", (2075+2500*x-biasScale) / scale, 305 / scale);
                    can.fillText("房性逸搏疑似度:" + datas[infoindex+x].fxyb + "%", (2075+2500*x-biasScale) / scale, 325 / scale);
                    can.fillText("室性逸搏疑似度:" + datas[infoindex+x].sxyb + "个", (2075+2500*x-biasScale) / scale, 345 / scale);

                    can.fillText("心率不齐疑似度:" + datas[infoindex+x].xlbq + "%", (2325+2500*x-biasScale) / scale, 265 / scale);
                    can.fillText("室性早搏疑似度:" + datas[infoindex+x].sxzb + "个", (2325+2500*x-biasScale) / scale, 285 / scale);
                    can.fillText("房性早搏疑似度:" + datas[infoindex+x].fxzb + "%", (2325+2500*x-biasScale) / scale, 305 / scale);
                    can.fillText("交界性早搏疑似度:" + datas[infoindex+x].jjxzb + "%", (2325+2500*x-biasScale) / scale, 325 / scale);
                    can.fillText("房颤疑似度:" + datas[infoindex+x].fc + "%", (2325+2500*x-biasScale) / scale, 345 / scale);
//                can.fillText("状态:"+datas[infoindex].state,1000/scale,490/scale);
//                    can.fillText(endtime,(-2499.9*conscale+2524.9) / scale,490/scale);
                    can.stroke();
                }
                $("#pageLoading").hide();
                document.onmousemove = null;
                document.onmouseup = null;
            }
            return false;
        };

        oChild2.ontouchstart = function (ev) {
            var ev = ev || window.event;
            disX2=ev.touches[0].clientX - oChild2.offsetLeft;
            document.ontouchmove=function (ev) {
                $("#pageLoading").show();
                $("#content2").hide();
                var ev = ev || window.event;
//                var oBox = document.getElementById('box');
                var L2 = ev.touches[0].clientX - disX2;  // 限制小div拖动范围
                if (L2 < 0) {
                    L2 = 0;
                }
                else if (L2 > oParent2.offsetWidth - oChild2.offsetWidth) {
                    L2 = oParent2.offsetWidth - oChild2.offsetWidth;
                }
                dragScale2 = L2 / (oParent2.offsetWidth - oChild2.offsetWidth);
                oChild2.style.left = L2  + 'px';
                oChild.style.left = 0 + 'px';
            };
            document.ontouchend=function(){
                $.ajax({
                    type: "POST",
                    url:"/info24SingleDataMore",
                    data:{addr:"<%=single.getDataaddr()%>",datascale:dragScale2},
                    dataType:"json",
                    async:false,
                    success:function (json) {
                        Data = json.Data;
                    }
                });
                xData = Data.split(",");

                $("#content2").remove();
                $("#content").remove();
                $("#selectbg").remove();
//                document.getElementById("selectbg").style.left = 0;//如果这样的话，会出现问题，颜色越来越深
                $("#contentbg2").after("<canvas id=\"content2\" height=\"57\" width=\"8504px\" style=\"position: absolute;z-index: 2;left: 0\">您的浏览器不支持canvas</canvas>");
                $("#contentbg2").after("<canvas id=\"selectbg\" height=\"57\" width=\"491.34px\" style=\"position: absolute;z-index: 1;left: 0\">您的浏览器不支持canvas</canvas>");
                $("#contentbg").after("<canvas id=\"content\" height=\"303\" width=\"17027px\" style=\"position: absolute;z-index: 1;left: 0\">您的浏览器不支持canvas</canvas>");
                var canvas3 = document.getElementById("selectbg");
                var can3 = canvas3.getContext("2d");
                can3.fillStyle = "rgba(102,179,241,0.6)";
                can3.fillRect(0, 0, 491.34, 57);
                var canvas2 = document.getElementById("content2");
                var can2 = canvas2.getContext("2d");
                can2.beginPath();
                can2.strokeStyle = "#000";
                can2.lineWidth = 1.4;
                can2.moveTo(0, (37.5 - xData[0] / 273000) / scale);
                for(var x=1;x<92161;x++) {
                    can2.lineTo((0.12207*x)/scale,(37.5 - xData[x] / 273000) / scale)
                }
                can2.stroke();
                var canvas = document.getElementById("content");
                var can=canvas.getContext("2d");
                can.beginPath();
                can.strokeStyle="#000";
                can.lineWidth =1.6;
                can.moveTo(25,(125-xData[0]/136500)/scale);
                for(var x=1;x<92161;x++){
                    can.lineTo((25+0.24414*x)/scale,(125-xData[x]/136500)/scale)//标定之前是30000飞哥版本91000
                }
                can.stroke();
                var infoindex = Math.floor(dragScale2 * (len - 92160)/10240);
                var biasScale = (dragScale2 * (len - 92160) / 10240) % 1*2500;
                can.beginPath();
                can.font = "15px Arial";
                for (var x=0;x<10;x++) {
                    var endtime = datas[infoindex + x].time;
                    var d = new Date(endtime.substring(0, 4),
                        endtime.substring(5, 7) - 1,
                        endtime.substring(8, 10),
                        endtime.substring(11, 13),
                        endtime.substring(14, 16),
                        endtime.substring(17, 19));
                    d.setTime(d.getTime() - 10 * 1000);
                    //alert(d.toLocaleString());
                    var mediumtime = d.getFullYear() + "-"
                        + (d.getMonth() + 1)
                        + "-" + d.getDate()
                        + " " + d.getHours()
                        + ":" + d.getMinutes()
                        + ":" + d.getSeconds();
                    can.fillText(mediumtime,(1075+2500*x-biasScale) / scale, 400 / scale);
                    can.fillText(endtime,(2325+2500*x-biasScale) / scale, 400 / scale);
                    can.fillText("心动过速疑似度:" + datas[infoindex+x].xdgs + "%", (2075+2500*x-biasScale) / scale, 265 / scale);
                    can.fillText("室性心动过速疑似度:" + datas[infoindex+x].sxxdgs + "%", (2075+2500*x-biasScale) / scale, 285 / scale);
                    can.fillText("心动过缓疑似度:" + datas[infoindex+x].xdgs + "%", (2075+2500*x-biasScale) / scale, 305 / scale);
                    can.fillText("房性逸搏疑似度:" + datas[infoindex+x].fxyb + "%", (2075+2500*x-biasScale) / scale, 325 / scale);
                    can.fillText("室性逸搏疑似度:" + datas[infoindex+x].sxyb + "个", (2075+2500*x-biasScale) / scale, 345 / scale);

                    can.fillText("心率不齐疑似度:" + datas[infoindex+x].xlbq + "%", (2325+2500*x-biasScale) / scale, 265 / scale);
                    can.fillText("室性早搏疑似度:" + datas[infoindex+x].sxzb + "个", (2325+2500*x-biasScale) / scale, 285 / scale);
                    can.fillText("房性早搏疑似度:" + datas[infoindex+x].fxzb + "%", (2325+2500*x-biasScale) / scale, 305 / scale);
                    can.fillText("交界性早搏疑似度:" + datas[infoindex+x].jjxzb + "%", (2325+2500*x-biasScale) / scale, 325 / scale);
                    can.fillText("房颤疑似度:" + datas[infoindex+x].fc + "%", (2325+2500*x-biasScale) / scale, 345 / scale);
//                can.fillText("状态:"+datas[infoindex].state,1000/scale,490/scale);
//                    can.fillText(endtime,(-2499.9*conscale+2524.9) / scale,490/scale);
                    can.stroke();
                }
                $("#pageLoading").hide();
                document.ontouchmove = null;
                document.ontouchend = null;
            }
            return false;
        };
        var disX = 0;
        oChild.onmousedown=function(ev) {

            var oChild = document.getElementById("child");
            var oChild2 = document.getElementById("child2");
            var oContent = document.getElementById("content");
            var oContent2 = document.getElementById("content2");
            var oSelectbg = document.getElementById("selectbg");
//            alert("滚动条1正在移动");
            var ev = ev || window.event;
            disX = ev.clientX - oChild.offsetLeft;
            document.onmousemove = function (ev) {
                var ev = ev || window.event;
                var L = ev.clientX - disX;  // 限制小div拖动范围
                if (L < 0) {
                    L = 0;
                }
                else if (L > oParent.offsetWidth - oChild.offsetWidth) {
                    L = oParent.offsetWidth - oChild.offsetWidth;
                }
                dragScale = L / (oParent.offsetWidth - oChild.offsetWidth);
                oChild.style.left = L + 'px';
                oContent.style.left = -dragScale * (oContent.offsetWidth-oBox.offsetWidth) + 'px';
                oContent2.style.left = -dragScale * (oContent2.offsetWidth-oBox2.offsetWidth) + 'px';
                oSelectbg.style.left = -dragScale * (oSelectbg.offsetWidth-oBox2.offsetWidth) + 'px';
            };
            document.onmouseup = function () {
                document.onmousemove = null;
                document.onmouseup = null;
            };
            return false;
        };

        oChild.ontouchstart=function(ev) {

            var oChild = document.getElementById("child");
            var oChild2 = document.getElementById("child2");
            var oContent = document.getElementById("content");
            var oContent2 = document.getElementById("content2");
            var oSelectbg = document.getElementById("selectbg");
//            alert("滚动条1正在移动");
            var ev = ev || window.event;
            disX = ev.touches[0].clientX - oChild.offsetLeft;
            document.ontouchmove = function (ev) {
                var ev = ev || window.event;
                var L = ev.touches[0].clientX - disX;  // 限制小div拖动范围
                if (L < 0) {
                    L = 0;
                }
                else if (L > oParent.offsetWidth - oChild.offsetWidth) {
                    L = oParent.offsetWidth - oChild.offsetWidth;
                }
                dragScale = L / (oParent.offsetWidth - oChild.offsetWidth);
                oChild.style.left = L + 'px';
                oContent.style.left = -dragScale * (oContent.offsetWidth-oBox.offsetWidth) + 'px';
                oContent2.style.left = -dragScale * (oContent2.offsetWidth-oBox2.offsetWidth) + 'px';
                oSelectbg.style.left = -dragScale * (oSelectbg.offsetWidth-oBox2.offsetWidth) + 'px';
            };
            document.ontouchend = function () {
                document.ontouchmove = null;
                document.ontouchend = null;
            };
            return false;
        };
    }
</script>
<script type="text/javascript">
    var num_state0=0;
    var num_state1=0;
    var num_state2=0;

    var canvassmall = document.getElementById("small");
    var sm=canvassmall.getContext("2d");
    <%
        for (int i = 0; i < infoJson.length(); i++) {
        JSONObject object = infoJson.getJSONObject(i);
//        String time = object.getString("time");
//        String xdgs = object.getString("xdgs");
        if(object.getInt("state")==1){
    %>
    num_state1+=1;
    sm.fillStyle="#ffff00";
    //    下面这个地方不知道为什么必须要给乘数加括号

    sm.fillRect((<%=i%>)*10240000/len,0,10240000/len,30);
    //    sm.fillRect(0,0,100,100);
    <%
        }else if(object.getInt("state")==2){
            %>
    num_state2+=1;
    sm.fillStyle="#fe151a";
    sm.fillRect((<%=i%>)*10240000/len,0,10240000/len,30);
    <%
        }else{

    %>
    num_state0+=1;
    sm.fillStyle="#09fe0b";
    sm.fillRect((<%=i%>)*10240000/len,0,10240000/len,30);
    <%
        }
    }
    %>
    sm.stroke();
//    找出每种类型的疾病疑似度对应的数量
    var xdgs_0_num=0,sxxdgs_0_num=0,xdgh_0_num=0,sxyb_0_num=0,fxyb_0_num=0,xlbq_0_num=0,sxzb_0_num=0,fxzb_0_num=0,jjxzb_0_num=0,fc_0_num=0;
    var xdgs_1_num=0,sxxdgs_1_num=0,xdgh_1_num=0,sxyb_1_num=0,fxyb_1_num=0,xlbq_1_num=0,sxzb_1_num=0,fxzb_1_num=0,jjxzb_1_num=0,fc_1_num=0;
    var xdgs_2_num=0,sxxdgs_2_num=0,xdgh_2_num=0,sxyb_2_num=0,fxyb_2_num=0,xlbq_2_num=0,sxzb_2_num=0,fxzb_2_num=0,jjxzb_2_num=0,fc_2_num=0;
    <%
       for (int i = 0; i < infoJson.length(); i++) {
       JSONObject object = infoJson.getJSONObject(i);
       if(object.getInt("xdgs")<30){
   %>
    xdgs_0_num+=1;
    <%}else if(object.getInt("xdgs")>50){%>
           xdgs_2_num+=1;
    <%}else{%>
     xdgs_1_num+=1;
    <%};%>
    <%
       if(object.getInt("sxxdgs")<30){
   %>
    sxxdgs_0_num+=1;
    <%}else if(object.getInt("sxxdgs")>50){%>
    sxxdgs_2_num+=1;
    <%}else{%>
    sxxdgs_1_num+=1;
    <%};%>

    <%
       if(object.getInt("xdgh")<30){
   %>
    xdgh_0_num+=1;
    <%}else if(object.getInt("xdgh")>50){%>
    xdgh_2_num+=1;
    <%}else{%>
    xdgh_1_num+=1;
    <%};%>

    <%
       if(object.getInt("sxyb")==0){
   %>
    sxyb_0_num+=1;
    <%}else if (object.getInt("sxyb")>0){%>
    sxyb_2_num+=1;
    <%};%>

    <%
       if(object.getInt("fxyb")<30){
   %>
    fxyb_0_num+=1;
    <%}else if(object.getInt("fxyb")>50){%>
    fxyb_2_num+=1;
    <%}else{%>
    fxyb_1_num+=1;
    <%};%>

    <%
       if(object.getInt("xlbq")<30){
   %>
    xlbq_0_num+=1;
    <%}else if(object.getInt("xlbq")>50){%>
    xlbq_2_num+=1;
    <%}else{%>
    xlbq_1_num+=1;
    <%};%>

    <%
       if(object.getInt("sxzb")==3){
    %>
    sxzb_1_num+=1;
    <%}else if(object.getInt("sxzb")>3){%>
    sxzb_2_num+=1;
    <%}else{%>
    sxzb_0_num+=1;
    <%};%>

    <%
       if(object.getInt("fxzb")<30){
   %>
    fxzb_0_num+=1;
    <%}else if(object.getInt("fxzb")>50){%>
    fxzb_2_num+=1;
    <%}else{%>
    fxzb_1_num+=1;
    <%};%>

    <%
       if(object.getInt("jjxzb")<30){
   %>
    jjxzb_0_num+=1;
    <%}else if(object.getInt("jjxzb")>50){%>
    jjxzb_2_num+=1;
    <%}else{%>
    jjxzb_1_num+=1;
    <%};%>

    <%
       if(object.getInt("fc")<30){
   %>
    fc_0_num+=1;
    <%}else if(object.getInt("fc")>50){%>
    fc_2_num+=1;
    <%}else{%>
    fc_1_num+=1;
    <%}};%>

    //    下面是画扇形图
    var chart1 = echarts.init(document.getElementById("chart1"));
    var option1 = {
        title : {
            text: '诊断结论汇总',
            subtext: '仅供参考',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['健康','疑似度较高','严重异常']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left'
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'诊断结论',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:num_state0, name:'健康'},
                    {value:num_state1, name:'疑似度较高'},
                    {value:num_state2, name:'严重异常'},
                ],
                itemStyle:{
                    normal:{
                        label:{
                            show:true,
                            fotmatter:"{a} <br/>{b} : {c} ({d}%)"
                        },
                        labelLine:{
                            show:true
                        }
                    }
                }
            }
        ],
        color:['rgb(0,255,0)','rgb(238,238,0)','rgb(255,0,0)']
    };
    chart1.setOption(option1);
    var chart2 = echarts.init(document.getElementById("chart2"));
    option2 = {
        title : {
            text: '疾病疑似度柱形图',
//            subtext: '数据来自网络'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['健康', '疑似度较高','严重异常'],
//            orient : 'vertical',
            x : 'right',
        },
        xAxis : [
            {
                type : 'value',
                boundaryGap : [0, 0.01]
            }
        ],
        yAxis : [
            {
                type : 'category',
                data : ['心动过速','室性心动过速','心动过缓','房性逸搏','室性逸搏','心率不齐','室性早搏','房性早搏','交界性早搏','房颤']
            }
        ],
        series : [
            {
                name:'健康',
                type:'bar',
                data:[xdgs_0_num,sxxdgs_0_num,xdgh_0_num,sxyb_0_num,fxyb_0_num,xlbq_0_num,sxzb_0_num,fxzb_0_num,jjxzb_0_num,fc_0_num],
                itemStyle:{
                    normal:{
                        color:'#008000'
                    }
                }
            },

            {
                name:'疑似度较高',
                type:'bar',
                data:[xdgs_1_num,sxxdgs_1_num,xdgh_1_num,sxyb_1_num,fxyb_1_num,xlbq_1_num,sxzb_1_num,fxzb_1_num,jjxzb_1_num,fc_1_num],
                itemStyle:{
                    normal:{
                        color:'#FFFF00'
                    }
                }
            },
            {
                name:'严重异常',
                type:'bar',
                data:[xdgs_2_num,sxxdgs_2_num,xdgh_2_num,sxyb_2_num,fxyb_2_num,xlbq_2_num,sxzb_2_num,fxzb_2_num,jjxzb_2_num,fc_2_num],
                itemStyle:{
                    normal:{
                        color:'#FF0000'
                    }
                }
            }
        ]
    };
    chart2.setOption(option2);
</script>
</body>
</html>
