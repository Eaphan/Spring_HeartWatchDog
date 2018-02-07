<%@ page import="java.util.List" %>
<%@ page import="com.xingou.entity.Temperature" %>
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
    <link rel="stylesheet" href="/css/easy-responsive-tabs.css" type="text/css">
    <script src="https://cdn.bootcss.com/echarts/3.6.2/echarts.min.js"></script>
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <%@include file="sidebar.jsp"%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div id="demoTab">
            <ul class="resp-tabs-list hor_1">
              <li>全部记录</li>
              <li>每日最高体温</li>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chart" style="width:100%;height:400px;"></div>
              <div id="chart1" style="width:100%;height:400px;"></div>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart"));
                  var xData = [];
                  var yData = [];

                  <%
                  List tempList=(List)request.getAttribute("tempList");
                  int len=tempList.size();
                  int len_sub=len-1;
                  for(int i=0;i<len;i++){
              //                for(int i=len-1;i>-1;i--){
              //                            System.out.pri11ntln(i);
                  Temperature single=(Temperature) tempList.get(i);
                  %>
                  xData.push('<%=single.getDate()%>');
                  <%--console.log(<%=single.getDate()%>);--%>
                  yData.push(<%=single.getTemp()%>);
                  <%}%>
                  var option = {
                      title: {
                          left: 'center',
                          text: "温度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' ,//触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
                      },
                      toolbox: {
                          show : true,
                          feature : {
//                            mark : {show: true},
//                            dataZoom : {show: true},
//                            dataView : {show: true,readOnly:true},
//                            magicType : {show: true, type: ['line', 'bar']},
//                            restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                          start : 20,
                          end : 80
                      },
                      calculable: true,
                      xAxis: {
                          type: 'category',
                          boundaryGap: false,
                          name: '检测时间',
                          data: xData
                      },
                      yAxis: {
//                        type: 'value',
//                        name: '温度',
                          type : 'value',
//                        scale:true,
                          axisLabel : {
                              formatter: '{value}℃'
                          },
                          min:35,
                          max:40,
                      },
                      series: [
                          {
                              name:'温度',
                              type: 'line', <!--图表类型-->
                              <!--平滑显示-->
                              smooth:true,
//symbol是去掉点的
//                        symbol:'none',
                              sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: yData,
                              markArea:{
//                            silent:true,
//                #bfe2f8
                                  label:{normal:{
                                      position:'inside'
                                  }},
                                  itemStyle:{
                                      normal:{color:'pink',borderWidth:1,borderType:'dashed'}},
                                  data: [ [{
                                      name: '高体温区间',
                                      yAxis: 36.5
                                  }, {
                                      yAxis: 37
                                  }],
//                                [{
//                                name: '低体温区间',
//                                yAxis: 36
//                            }, {
//                                yAxis: 36.5
//                            }]
                                  ]
                              }
                          },
                          {
                              type:'line',
                              markArea:{
//                          silent:true,
//                          #bfe2f8
                                  label:{normal:{
                                      position:'inside'
                                  }},
                                  itemStyle:{
                                      normal:{color:'#bfe2f8',borderWidth:1,borderType:'dashed'}},
                                  data: [ [{
                                      name: '低体温区间',
                                      yAxis: 36
                                  }, {
                                      yAxis: 36.5
                                  }]]
                              }
                          }
                      ],

                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart1 = echarts.init(document.getElementById("chart1"));
                  var x1Data = [];
                  var y1Data = [];

                  <%List tempMaxList=(List)request.getAttribute("tempMaxList");
                  int max_len=tempMaxList.size();
                  for(int i=0;i<max_len;i++){
              //                for(int i=len-1;i>-1;i--){
              //                            System.out.pri11ntln(i);
                  Temperature single=(Temperature) tempMaxList.get(i);
                  %>
                  x1Data.push('<%=single.getDate()%>');
                  y1Data.push(<%=single.getTemp()%>);
                  <%}%>
                  var option = {
                      title: {
                          left: 'center',
                          text: "温度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' ,//触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
                      },
                      toolbox: {
                          show : true,
                          feature : {
//                            mark : {show: true},
//                            dataZoom : {show: true},
//                            dataView : {show: true,readOnly:true},
//                            magicType : {show: true, type: ['line', 'bar']},
//                            restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                          start : 0,
                          end : 100
                      },
                      calculable: true,
                      xAxis: {
                          type: 'category',
                          boundaryGap: false,
                          name: '检测时间',
                          data: x1Data
                      },
                      yAxis: {
//                        type: 'value',
//                        name: '温度',
                          type : 'value',
//                        scale:true,
                          axisLabel : {
                              formatter: '{value}℃'
                          },
                          min:35,
                          max:40,
                      },
                      series: [
                          {
                              name:'温度',
                              type: 'line', <!--图表类型-->
                              <!--平滑显示-->
                              smooth:true,
//symbol是去掉点的
//                        symbol:'none',
                              sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: y1Data,
                              markArea:{
//                            silent:true,
//                #bfe2f8
                                  label:{normal:{
                                      position:'inside'
                                  }},
                                  itemStyle:{
                                      normal:{color:'pink',borderWidth:1,borderType:'dashed'}},
                                  data: [ [{
                                      name: '高体温区间',
                                      yAxis: 36.5
                                  }, {
                                      yAxis: 37
                                  }],
//                                [{
//                                name: '低体温区间',
//                                yAxis: 36
//                            }, {
//                                yAxis: 36.5
//                            }]
                                  ]
                              }
                          },
                          {
                              type:'line',
                              markArea:{
//                          silent:true,
//                          #bfe2f8
                                  label:{normal:{
                                      position:'inside'
                                  }},
                                  itemStyle:{
                                      normal:{color:'#bfe2f8',borderWidth:1,borderType:'dashed'}},
                                  data: [ [{
                                      name: '低体温区间',
                                      yAxis: 36
                                  }, {
                                      yAxis: 36.5
                                  }]]
                              }
                          }
                      ],

                  };
                  myChart1.setOption(option);
              </script>
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
    <script type="text/javascript" src="/js/easyResponsiveTabs.js"></script>
    <script>
        $(document).ready(function() {
            //Horizontal Tab
            $('#demoTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                tabidentify: 'hor_1', // The tab groups identifier
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#nested-tabInfo');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });
        })
    </script>
  </body>
</html>
