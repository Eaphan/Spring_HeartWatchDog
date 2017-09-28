<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.xingou.entity.Info" %>
<%@ page import="com.xingou.tools.MyTools" %>
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
                <a href="quit">退出登陆</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
    <div class="row" style="text-align: center">
      <br>
      <canvas id="ecg" width="793.7px" height="1122.52px" style="border:black 1px solid">您的浏览器不支持canvas</canvas><br>
      <button type="button" class="btn btn-primary" onclick="download()">下载心电报告</button>
      <%--</div>--%>
      <br><br><br><br><br>
      <br>
    </div>
    <div class="row">
      <div id="footer" class="container">
        <nav class="navbar navbar-default navbar-fixed-bottom">
          <div class="navbar-inner navbar-content-center">
            <div class="text-center">
              <p class="text-muted credit" style="padding:10px;">
                &copy 上海夏先机电科技发展有限公司 版权所有 2014-2016 服务热线:400-775-2629
              </p>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </div>
    <!-- jQuery -->
    <script src="/js/jquery.js"></script>
    <!-- Bootstrap -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/js/custom.min.js"></script>
    <script src="//cdn.bootcss.com/jspdf/1.3.3/jspdf.debug.js"></script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>--%>
    <script src="/js/html2canvas.js"></script>
    <script>
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
    <script type="text/javascript">
        <%  Info single=(Info)request.getAttribute("infosingle");
    //    formatter中format是将时间转换为字符串，而parse是将字符串转化为时间
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date starttime=formatter.parse(single.getDate());
            SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String time=formatter1.format(starttime);
            long forendtime=(starttime.getTime()/1000)+20;
            Date starttime2= formatter.parse(single.getDate());
            starttime2.setTime(forendtime*1000);
            String endtime=formatter.format(starttime2);
        %>
        var arrDPI = js_getDPI();
        var scale=5*25.4/arrDPI[0];
        var canvas=document.getElementById('ecg');
        can=canvas.getContext('2d');
        can.font="23px Arial";

        var spaceShip=new Image();
        spaceShip.addEventListener('load',eventShipLoaded,false);
        spaceShip.src="/images/logo.png"
        function eventShipLoaded(){
            drawScreen();
        }
        function drawScreen(){
            can.drawImage(spaceShip,790/scale,60/scale,177/scale,59.2/scale)
        }
        can.textAlign="start";
        can.fillText("心电检测报告",430/scale,100/scale);
        can.moveTo(75/scale,120/scale);
        can.lineTo(975/scale,120/scale);
        can.moveTo(75/scale,130/scale);
        can.lineTo(975/scale,130/scale);
        can.stroke();
        can.beginPath();
        can.font="15px Arial";
        can.textAlign="start";
        can.fillText("姓名: ${user.uname}${infosingle.user.userinfo.height}",100/scale,170/scale);
        can.fillText("性别:${user.userinfo.gender}",300/scale,170/scale);
        can.fillText("年龄:${user.userinfo.age}",500/scale,170/scale);
        can.fillText("时间: <%=time%>",700/scale,170/scale);
        can.moveTo(75/scale,185/scale);
        can.lineTo(975/scale,185/scale);
        can.stroke();
        <%--can.fillText("测试时间: <%=single.getDate()%>",100/scale,220/scale);--%>
        <%--can.fillText("时长: 20s",600/scale,220/scale);--%>
        <%--can.fillText("心率 :<%=single.getXinlv()%>bpm",100/scale,250/scale);--%>

        can.fillText("PR间期:<%=single.getPr()%>ms",100/scale,230/scale);
        can.fillText("QT间期:<%=single.getQt()%>ms",400/scale,230/scale);
        can.fillText("QTc间期:<%=single.getQtc()%>ms",700/scale,230/scale);
        can.fillText("心率:<%=single.getXinlv()%>bpm",100/scale,270/scale);
        can.fillText("P时限:<%=single.getP()%>ms",400/scale,270/scale);
        can.fillText("QRS时限:<%=single.getQrs()%>ms",700/scale,270/scale);
        can.beginPath();
        can.strokeStyle ="#f1c1c5";
        can.lineWidth=0.18;
        for (var x=75/scale;x<976/scale;x +=5/scale){
            can.moveTo(x,290/scale);
            can.lineTo(x,990/scale);
            can.stroke();
        }
        for (var y=290/scale;y<991/scale;y+=5/scale){
            can.moveTo(75/scale,y);
            can.lineTo(975/scale,y);
            can.stroke();
        }
        can.beginPath();
        can.lineWidth=0.4;
        can.strokeStyle ="#e03433";// "#f1dedf";"#f0adaa"//"#e0514b"
        for (var x=75/scale;x<976/scale;x +=25/scale){
            can.moveTo(x,290/scale);
            can.lineTo(x,990/scale);
            can.stroke();
        }
        for (var y=290/scale;y<991/scale;y+=25/scale){
            can.moveTo(75/scale,y);
            can.lineTo(975/scale,y);
            can.stroke();
        }
        //这一部分是标定符号
        can.beginPath();
        can.lineWidth=2;
        can.strokeStyle="#000";
        can.moveTo(75/scale,440/scale);
        can.lineTo(80/scale,440/scale);
        can.lineTo(80/scale,390/scale);
        can.lineTo(95/scale,390/scale);
        can.lineTo(95/scale,440/scale);
        can.lineTo(100/scale,440/scale);

        can.moveTo(80/scale,445/scale);
        can.lineTo(95/scale,445/scale);
        can.moveTo(85/scale,445/scale);
        can.lineTo(85/scale,460/scale);
        can.moveTo(90/scale,445/scale);
        can.lineTo(90/scale,460/scale);
        can.moveTo(80/scale,460/scale);
        can.lineTo(95/scale,460/scale);

        can.moveTo(75/scale,665/scale);
        can.lineTo(80/scale,665/scale);
        can.lineTo(80/scale,615/scale);
        can.lineTo(95/scale,615/scale);
        can.lineTo(95/scale,665/scale);
        can.lineTo(100/scale,665/scale);

        can.moveTo(75/scale,890/scale);
        can.lineTo(80/scale,890/scale);
        can.lineTo(80/scale,840/scale);
        can.lineTo(95/scale,840/scale);
        can.lineTo(95/scale,890/scale);
        can.lineTo(100/scale,890/scale);
        can.stroke();
        var xData = [];
        var yData = [];
        <%
        java.text.NumberFormat percentFormat = java.text.NumberFormat.getPercentInstance();
                    percentFormat.setMaximumFractionDigits(2); //最大小数位数
        String str=single.getData();
        String[] ylist=str.split(",");
        int len=ylist.length;
        for(int i=0;i<len;i++){
        %>
        xData.push(<%=i%>);
        yData.push(<%=MyTools.strTofloat(ylist[i])%>);
        <%}%>
        can.beginPath();
        can.lineWidth=1;
        can.moveTo(100/scale,(440-yData[0]/91000)/scale);
        for(var x=1;x<3585;x++){
            can.lineTo((100+0.24414*x)/scale,(440-yData[x]/136500)/scale)//标定之前是30000飞哥版本91000
        }
        can.stroke();
        can.beginPath();
        can.moveTo(100/scale,(665-yData[3584]/91000)/scale);
        for(var x=3585;x<7169;x++){
            can.lineTo((100+0.24414*(x-3584))/scale,(665-yData[x]/136500)/scale)
        }
        can.stroke();
        can.beginPath();
        can.moveTo(100/scale,(890-yData[7168]/91000)/scale);
        for(var x=7169;x<yData.length+1;x++){
            can.lineTo((100+0.24414*(x-7168))/scale,(890-yData[x]/136500)/scale)
        }
        can.stroke();
        can.beginPath();
        can.font = "12px Arial";
        can.fillText("5mm", 100 / scale, 310 / scale);
        can.fillStyle="#000000";
        can.fillRect(100 / scale, 315 / scale, 25 / scale, 8 / scale);
        can.stroke();
        can.beginPath();
        can.lineWidth=2;
        can.font="18px Arial";
        <%--can.fillText("增益:10mm/mV",600/scale,250/scale);--%>
        <%--can.fillText("走速:25mm/s",800/scale,250/scale);--%>
        can.fillText("<%=single.getDate()%>",150/scale,323/scale);
        can.fillText("增益:10mm/mV",600/scale,323/scale);
        can.fillText("走速:25mm/s",800/scale,323/scale);
        can.fillText("<%=endtime%>",750/scale,975/scale);
        can.stroke();
        can.beginPath();
        can.lineWidth=1;
        can.font="15px Arial";
        can.textAlign="start";
        can.fillText("NO.",100/scale,1030/scale);
        can.fillText("检测项目",300/scale,1030/scale);
        can.fillText("疑似度",630/scale,1030/scale);
        can.fillText("结论",900/scale,1030/scale);
        can.moveTo(75/scale,1040/scale);
        can.lineTo(975/scale,1040/scale);
        can.fillText("1",110/scale,1065/scale)
        can.fillText("心动过速",300/scale,1065/scale)
        can.fillText("<%=percentFormat.format(single.getXdgs()/100.0)%>",630/scale,1065/scale)
        can.fillText("<%=single.getCon1()%>",900/scale,1065/scale)
        can.moveTo(75/scale,1070/scale);
        can.lineTo(975/scale,1070/scale);
        can.fillText("2",110/scale,1095/scale)
        can.fillText("室性心动过速",300/scale,1095/scale)
        can.fillText("<%=percentFormat.format(single.getSxxdgs()/100.0)%>",630/scale,1095/scale)
        can.fillText("<%=single.getCon2()%>",900/scale,1095/scale)
        can.moveTo(75/scale,1100/scale);
        can.lineTo(975/scale,1100/scale);
        can.fillText("3",110/scale,1125/scale)
        can.fillText("心动过缓",300/scale,1125/scale)
        can.fillText("<%=percentFormat.format(single.getXdgh()/100.0)%>",630/scale,1125/scale)
        can.fillText("<%=single.getCon3()%>",900/scale,1125/scale)
        can.moveTo(75/scale,1130/scale);
        can.lineTo(975/scale,1130/scale);
        can.fillText("4",110/scale,1155/scale)
        can.fillText("房性逸搏",300/scale,1155/scale)
        can.fillText("<%=percentFormat.format(single.getFxyb()/100.0)%>",630/scale,1155/scale)
        can.fillText("<%=single.getCon4()%>",900/scale,1155/scale)
        can.moveTo(75/scale,1160/scale);
        can.lineTo(975/scale,1160/scale);
        can.fillText("5",110/scale,1185/scale)
        can.fillText("室性逸搏",300/scale,1185/scale)
        can.fillText("<%=(int)single.getSxyb()%>"+"个",630/scale,1185/scale)
        can.fillText("<%=single.getCon5()%>",900/scale,1185/scale)
        can.moveTo(75/scale,1190/scale);
        can.lineTo(975/scale,1190/scale);
        can.fillText("6",110/scale,1215/scale)
        can.fillText("心率不齐",300/scale,1215/scale)
        can.fillText("<%=percentFormat.format(single.getXlbq()/100.0)%>",630/scale,1215/scale)
        can.fillText("<%=single.getCon6()%>",900/scale,1215/scale)
        can.moveTo(75/scale,1220/scale);
        can.lineTo(975/scale,1220/scale);
        can.fillText("7",110/scale,1245/scale)
        can.fillText("室性早搏",300/scale,1245/scale)
        can.fillText("<%=(int)single.getSxzb()%>"+"个",630/scale,1245/scale)
        can.fillText("<%=single.getCon7()%>",900/scale,1245/scale)
        can.moveTo(75/scale,1250/scale);
        can.lineTo(975/scale,1250/scale);
        can.fillText("8",110/scale,1275/scale)
        can.fillText("房性早搏",300/scale,1275/scale)
        can.fillText("<%=percentFormat.format(single.getFxzb()/100.0)%>",630/scale,1275/scale)
        can.fillText("<%=single.getCon8()%>",900/scale,1275/scale)
        can.moveTo(75/scale,1280/scale);
        can.lineTo(975/scale,1280/scale);
        can.fillText("9",110/scale,1305/scale)
        can.fillText("交界性早搏",300/scale,1305/scale)
        can.fillText("<%=percentFormat.format(single.getJjxzb()/100.0)%>",630/scale,1305/scale)
        can.fillText("<%=single.getCon9()%>",900/scale,1305/scale)
        can.moveTo(75/scale,1310/scale);
        can.lineTo(975/scale,1310/scale);
        can.fillText("10",110/scale,1335/scale)
        can.fillText("房颤",300/scale,1335/scale)
        can.fillText("<%=percentFormat.format(single.getFc()/100.0)%>",630/scale,1335/scale)
        can.fillText("<%=single.getCon10()%>",900/scale,1335/scale)
        can.moveTo(75/scale,1340/scale);
        can.lineTo(975/scale,1340/scale);
        can.fillText("<提示>报告仅供参考，请结合临床情况",640/scale,1370/scale)
        can.stroke();
    </script>
    <script>
        function download() {
            var canvas=document.getElementById('ecg');
            var imgData = canvas.toDataURL();
            var canWidth = canvas.width;
            var canHeight = canvas.height;
//                document.write(canHeight,canWidth,yData.length);
            var arrDPI = js_getDPI();//获取显示器DPI（这个方法没贴出来）
            var dpiX = 96;
            var dpiY = 96;
            if(arrDPI.length>0){
                dpiX = arrDPI[0];
                dpiY = arrDPI[1];
            }
            //l:横向， p：纵向；单位： in:英寸，mm毫米；画布大小：a3,a4,leter,[]（当内容为数组时，为自定义大小）
            //   var doc = new jsPDF('l', 'in', [(canWidth+10)/dpiX,(canHeight+10)/dpiY]);//设置PDF宽高为要显示的元素的宽高，将像素转化为英寸
            var doc=new jsPDF('p','mm',[(canWidth*25.4)/dpiX,(canHeight*25.4)/dpiY]);
//                var doc=new jsPDF('p','in',[(canWidth)/dpiX,(canHeight)/dpiY]);
//                var doc=new jsPDF('p','mm',[210,297]);
            //doc.addImage(imgData, 'png', 7/dpiX,5/dpiY); //写入位置：x:5, y:5 单位:英寸
            doc.addImage(imgData,'png',0,0)
            doc.save('report_pdf_' + new Date().getTime()+'.pdf');
        }
    </script>
</body>
</html>
