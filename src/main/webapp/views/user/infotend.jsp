<%@ page import="java.util.List" %>
<%@ page import="com.xingou.entity.Info" %>
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
    <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
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
              <li>心率</li>
              <li>心动过速</li>
              <li>室性心动过速</li>
              <li>心动过缓</li>
              <li>房性逸搏</li>
              <li>室性逸搏</li>
              <li>心率不齐 </li>
              <li>室性早搏</li>
              <li>房性早搏</li>
              <li>交界性早搏</li>
              <li>心动房颤</li>
            </ul>

            <div class="resp-tabs-container hor_1">
              <div id="chart" style="width:100%;height:400px;"></div>
              <div id="chart1" style="width:100%;height:400px;"></div>
              <div id="chart2" style="width:100%;height:400px;"></div>
              <div id="chart3" style="width:100%;height:400px;"></div>
              <div id="chart4" style="width:100%;height:400px;"></div>
              <div id="chart5" style="width:100%;height:400px;"></div>
              <div id="chart6" style="width:100%;height:400px;"></div>
              <div id="chart7" style="width:100%;height:400px;"></div>
              <div id="chart8" style="width:100%;height:400px;"></div>
              <div id="chart9" style="width:100%;height:400px;"></div>
              <div id="chart10" style="width:100%;height:400px;"></div>

              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart"));
                  var xData = [];
                  var yData = [];
                  var y1Data = [];
                  var y2Data = [];
                  var y3Data = [];
                  var y4Data = [];
                  var y5Data = [];
                  var y6Data = [];
                  var y7Data = [];
                  var y8Data = [];
                  var y9Data = [];
                  var y10Data = [];
                  <%List infolist=(List)request.getAttribute("infoList");
                  int len=infolist.size();
                  int len_sub=len-1;
//                        for(int i=0;i<len;i++){
                  for(int i=len-1;i>-1;i--){
//                            System.out.println(i);
                  Info single=(Info)infolist.get(i);
                  %>
                  xData.push('<%=single.getDate()%>');
                  yData.push(<%=single.getXinlv()%>);
                  y1Data.push(<%=single.getXdgs()%>)
                  y2Data.push(<%=single.getSxxdgs()%>)
                  y3Data.push(<%=single.getXdgh()%>)
                  y4Data.push(<%=single.getFxyb()%>)
                  y5Data.push(<%=single.getSxyb()%>)
                  y6Data.push(<%=single.getXlbq()%>)
                  y7Data.push(<%=single.getSxzb()%>)
                  y8Data.push(<%=single.getFxzb()%>)
                  y9Data.push(<%=single.getJjxzb()%>)
                  y10Data.push(<%=single.getFc()%>)
                  <%}%>
                  var option = {
                      title: {
                          left: 'center',
                          text: "心率趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' ,//触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '心率',
                      },
                      series: [{
                          name:'心率',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: yData
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart1"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "心动过速疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '心动过速疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y1Data
                      }]
                  };
                  myChart.setOption(option);
              </script>

              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart2"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "室性心动过速疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '室性心动过速疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y2Data
                      }]
                  };
                  myChart.setOption(option);
              </script>

              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart3"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "心动过缓疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ':' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '心动过缓疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y3Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart4"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "房性逸搏疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '心动过速疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y4Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart5"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "室性逸博疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
//                                formatter:function(params)
//                                {
//                                    var relVal = params[0].name;
//                                    for (var i = 0, l = params.length; i < l; i++) {
//                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
//                                    }
//                                    return relVal;
//                                }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '室性逸搏疑似度/个数',
//                                axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y5Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart6"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "心律不齐疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '心率不齐疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y6Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart7"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "室性早搏疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
//                                formatter:function(params)
//                                {
//                                    var relVal = params[0].name;
//                                    for (var i = 0, l = params.length; i < l; i++) {
//                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
//                                    }
//                                    return relVal;
//                                }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '室性早搏疑似度/个数',
//                                axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y7Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart8"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "房性早搏疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '房性早搏疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y8Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart9"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "交界性早搏疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '交界性早搏疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y9Data
                      }]
                  };
                  myChart.setOption(option);
              </script>
              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart10"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "房颤疑似度趋势图",
                          textStyle: {fontSize: 24, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis',
                          formatter:function(params)
                          {
                              var relVal = params[0].name;
                              for (var i = 0, l = params.length; i < l; i++) {
                                  relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                              }
                              return relVal;
                          }
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataZoom : {show: true},
                              dataView : {show: true,readOnly:true},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
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
                          name: '上传时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '心动过速疑似度',
                          axisLabel: {  formatter: '{value} %' }
                      },
                      series: [{
                          name:'疑似度',
                          type: 'line', <!--图表类型-->
                          <!--平滑显示-->
                          symbol: 'none',
                          sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                          itemStyle: {
                              normal: {
                                  color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                              }
                          },
                          data: y10Data
                      }]
                  };
                  myChart.setOption(option);
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
