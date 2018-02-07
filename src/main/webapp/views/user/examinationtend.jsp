<%@ page import="com.xingou.entity.Examination" %>
<%@ page import="java.util.List" %>
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
          <div id="tab">
            <ul class="resp-tabs-list hor_1">
              <li>身高</li>
              <li>体重</li>
              <li>收缩压</li>
              <li>舒张压</li>
              <li>心率</li>
              <li>裸眼视力左</li>
              <li>裸眼视力右</li>
              <li>矫正视力左</li>
              <li>矫正视力右</li>
              <li>血糖</li>
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
              <script type="text/javascript">
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
                  var xuetang1Data=[];
                  var ecgData1=[];
                  var ecgData2= [];
                  var ecgData3 = [];
                  var ecgData4 = [];
                  var cancerData1=[];
                  var cancerData2=[];
                  var cancerData3=[];
                  var cancerData4=[];
                  var cancerData5=[];
                  var cancerData6=[];
                  var bloodData1=[];
                  var bloodData2=[];
                  var bloodData3=[];
                  var bloodData4=[];
                  var bloodData5=[];
                  var bloodData6=[];
                  var bloodData7=[];
                  var bloodData8=[];
                  var bloodData9=[];
                  var bloodData10=[];
                  var bloodData11=[];
                  var bloodData12=[];
                  var bloodData13=[];
                  var bloodData14=[];
                  var bloodData15=[];
                  var bloodData16=[];
                  var bloodData17=[];
                  var bloodData18=[];
                  var bloodData19=[];

                  var urineData4=[];
                  var urineData9=[];
                  var urineData10=[];
                  var urineData11=[];
                  var urineData12=[];

                  var liverData1=[];
                  var liverData2=[];
                  var liverData3=[];
                  var liverData4=[];
                  var liverData5=[];
                  var liverData6=[];
                  var liverData7=[];
                  var liverData8=[];
                  var liverData9=[];
                  var liverData10=[];
                  var liverData11=[];
                  var liverData12=[];
                  var bloodfatData1=[];
                  var bloodfatData2=[];
                  var bloodfatData3=[];
                  var bloodfatData4=[];
                  var kidneyData1=[];
                  var kidneyData2=[];
                  var kidneyData3=[];


                  <%
                            List emList=(List)request.getAttribute("emList");
                            int len=emList.size();
//                            for(int i=0;i<len;i++){
                        for(int i=len-1;i>-1;i--){
                            Examination em=(Examination)emList.get(i);
//                            System.out.println(em.getEcg4());

                        %>
                  xData.push('<%=em.getDate()%><%=em.getHospital()%>');
                  yData.push(<%=MyTools.strTofloat(em.getHeight())%>);
                  y1Data.push(<%=MyTools.strTofloat(em.getWeight())%>);
                  y2Data.push(<%=MyTools.strTofloat(em.getShuzhangya())%>)
                  y3Data.push(<%=MyTools.strTofloat(em.getShousuoya())%>)
                  y4Data.push(<%=em.getNeike1()%>)
                  y5Data.push(<%=em.getYanke7()%>)
                  y6Data.push(<%=em.getYanke8()%>)
                  y7Data.push(<%=em.getYanke9()%>)
                  y8Data.push(<%=em.getYanke10()%>);
                  xuetang1Data.push('<%=MyTools.strTofloat(em.getXuetang1())%>');
                  ecgData1.push('<%=MyTools.strTofloat(em.getEcg1())%>');
                  ecgData2.push('<%=MyTools.strTofloat(em.getEcg2())%>');
                  ecgData3 .push('<%=MyTools.strTofloat(em.getEcg3())%>');
                  ecgData4 .push('<%=MyTools.strTofloat(em.getEcg4())%>');
                  cancerData1.push('<%=MyTools.strTofloat(em.getCancer1())%>');
                  cancerData2.push('<%=MyTools.strTofloat(em.getCancer2())%>');
                  cancerData3.push('<%=MyTools.strTofloat(em.getCancer3())%>');
                  cancerData4.push('<%=MyTools.strTofloat(em.getCancer4())%>');
                  cancerData5.push('<%=MyTools.strTofloat(em.getCancer5())%>');
                  cancerData6.push('<%=MyTools.strTofloat(em.getCancer6())%>');
                  bloodData1.push('<%=MyTools.strTofloat(em.getBlood1())%>');
                  bloodData2.push('<%=MyTools.strTofloat(em.getBlood2())%>');
                  bloodData3.push('<%=MyTools.strTofloat(em.getBlood3())%>');
                  bloodData4.push('<%=MyTools.strTofloat(em.getBlood4())%>');
                  bloodData5.push('<%=MyTools.strTofloat(em.getBlood5())%>');
                  bloodData6.push('<%=MyTools.strTofloat(em.getBlood6())%>');
                  bloodData7.push('<%=MyTools.strTofloat(em.getBlood7())%>');
                  bloodData8.push('<%=MyTools.strTofloat(em.getBlood8())%>');
                  bloodData9.push('<%=MyTools.strTofloat(em.getBlood9())%>');
                  bloodData10.push('<%=MyTools.strTofloat(em.getBlood10())%>');
                  bloodData11.push('<%=MyTools.strTofloat(em.getBlood11())%>');
                  bloodData12.push('<%=MyTools.strTofloat(em.getBlood12())%>');
                  bloodData13.push('<%=MyTools.strTofloat(em.getBlood13())%>');
                  bloodData14.push('<%=MyTools.strTofloat(em.getBlood14())%>');
                  bloodData15.push('<%=MyTools.strTofloat(em.getBlood15())%>');
                  bloodData16.push('<%=MyTools.strTofloat(em.getBlood16())%>');
                  bloodData17.push('<%=MyTools.strTofloat(em.getBlood17())%>');
                  bloodData18.push('<%=MyTools.strTofloat(em.getBlood18())%>');
                  bloodData19.push('<%=MyTools.strTofloat(em.getBlood19())%>');


                  urineData4.push('<%=MyTools.strTofloat(em.getUrine4())%>');

                  urineData9.push('<%=MyTools.strTofloat(em.getUrine9())%>');
                  urineData10.push('<%=MyTools.strTofloat(em.getUrine10())%>');
                  urineData11.push('<%=MyTools.strTofloat(em.getUrine11())%>');
                  urineData12.push('<%=MyTools.strTofloat(em.getUrine12())%>');


                  liverData1.push('<%=MyTools.strTofloat(em.getLiver1())%>');
                  liverData2.push('<%=MyTools.strTofloat(em.getLiver2())%>');
                  liverData3.push('<%=MyTools.strTofloat(em.getLiver3())%>');
                  liverData4.push('<%=MyTools.strTofloat(em.getLiver4())%>');
                  liverData5.push('<%=MyTools.strTofloat(em.getLiver5())%>');
                  liverData6.push('<%=MyTools.strTofloat(em.getLiver6())%>');
                  liverData7.push('<%=MyTools.strTofloat(em.getLiver7())%>');
                  liverData8.push('<%=MyTools.strTofloat(em.getLiver8())%>');
                  liverData9.push('<%=MyTools.strTofloat(em.getLiver9())%>');
                  liverData10.push('<%=MyTools.strTofloat(em.getLiver10())%>');
                  liverData11.push('<%=MyTools.strTofloat(em.getLiver11())%>');
                  liverData12.push('<%=MyTools.strTofloat(em.getLiver12())%>');

                  bloodfatData1.push('<%=MyTools.strTofloat(em.getBloodfat1())%>');
                  bloodfatData2.push('<%=MyTools.strTofloat(em.getBloodfat2())%>');
                  bloodfatData3.push('<%=MyTools.strTofloat(em.getBloodfat3())%>');
                  bloodfatData4.push('<%=MyTools.strTofloat(em.getBloodfat4())%>');
                  kidneyData1.push('<%=MyTools.strTofloat(em.getKidney1())%>');
                  kidneyData2.push('<%=MyTools.strTofloat(em.getKidney2())%>');
                  kidneyData3.push('<%=MyTools.strTofloat(em.getKidney3())%>');
                  <%}%>
                  var lenx=xData.length;
                  var myChart = echarts.init(document.getElementById("chart"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "身高",
                          textStyle: {fontSize: 16, color: "black"},
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
                          start : 0,
                          end : 100
                      },
                      calculable: true,
                      xAxis: {
                          type: 'category',
                          boundaryGap: false,
                          name: '体检时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '身高',
                      },
                      series: [{
                          name:'身高',
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
                          text: "体重",
                          textStyle: {fontSize: 16, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
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
                          name: '体检时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '体重',
                      },
                      series: [{
                          name:'体重',
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
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chart2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 140
                  }

                  var option = {
                      title : {
                          text: '收缩压'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'收缩压(mmHg)',
                          }
                      ],
                      series : [
                          {
                              name:'收缩压',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: y2Data,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chart3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 90
                  }

                  var option = {
                      title : {
                          text: '舒张压'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'舒张压(mmHg)',
                          }
                      ],
                      series : [
                          {
                              name:'舒张压',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: y3Data,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chart4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 60
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 100
                  }

                  var option = {
                      title : {
                          text: '心率'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'心率(次/分)',
                          }
                      ],
                      series : [
                          {
                              name:'心率',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: y4Data,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>



              <script type="text/javascript">
                  var myChart = echarts.init(document.getElementById("chart5"));
                  var option = {
                      title: {
                          left: 'center',
                          text: "裸眼视力左",
                          textStyle: {fontSize: 16, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
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
                          name: '体检时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '裸眼视力左',
                      },
                      series: [{
                          name:'裸眼视力左',
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
                          text: "裸眼视力右",
                          textStyle: {fontSize: 16, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
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
                          name: '体检时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '裸眼视力右',
                      },
                      series: [{
                          name:'裸眼视力右',
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
                          text: "矫正视力左",
                          textStyle: {fontSize: 16, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
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
                      },
                      calculable: true,
                      xAxis: {
                          type: 'category',
                          boundaryGap: false,
                          name: '体检时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '矫正视力左',
                      },
                      series: [{
                          name:'矫正视力左',
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
                          text: "矫正视力右",
                          textStyle: {fontSize: 16, color: "black"},
                          subtextStyle: {fontSize: 12}
                      },
                      tooltip: {
                          trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
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
                          name: '体检时间',
                          data: xData
                      },
                      yAxis: {
                          type: 'value',
                          name: '矫正视力右',
                      },
                      series: [{
                          name:'矫正视力右',
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
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chart9"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 3.9
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 6.1
                  }

                  var option = {
                      title : {
                          text: '血糖'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血糖(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'血糖',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: xuetang1Data,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,
                          }
                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

            </div>
          </div>
          <h2 class="sub-header">心电图信息<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="tabecg">
            <ul class="resp-tabs-list hor_1">
              <li>心率</li>
              <li>PR间期</li>
              <li>QT间期</li>
              <li>QRS宽度</li>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chartecg1" style="width:100%;height:400px;"></div>
              <div id="chartecg2" style="width:100%;height:400px;"></div>
              <div id="chartecg3" style="width:100%;height:400px;"></div>
              <div id="chartecg4" style="width:100%;height:400px;"></div>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartecg1"));
                  var option = {
                      title : {
                          text: '心率\n'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'心率(次/分)',
                          }
                      ],
                      series : [
                          {
                              name:'心率',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: ecgData1,
                              markLine:{
                                  itemStyle:{
                                      normal:{lineStyle:{type:'solid',color:'#FFFF00',width:2},label:{show:true,position:'left'}}
                                  },
                                  large:true,
                                  effect:{
                                      show: true,
                                      loop: true,
                                      period: 0,
                                      scaleSize : 2,
                                      color : null,
                                      shadowColor : null,
                                      shadowBlur : null
                                  },
                                  data:[
                                      [
                                          {name: '标线1起点', xAxis: 0, yAxis: 100},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                          {name: '标线1终点', xAxis:lenx, yAxis: 100}             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                      ],
                                      [
                                          {name: '标线1起点', xAxis: 0, yAxis: 60},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
                                          {name: '标线1终点', xAxis:lenx, yAxis: 60}             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                      ],
                                  ]
                              }



                          },

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartecg2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 120
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 200
                  }

                  var option = {
                      title : {
                          text: 'PR间期'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'PR间期(ms)',
                          }
                      ],
                      series : [
                          {
                              name:'PR间期',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: ecgData2,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartecg3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 340
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 430
                  }

                  var option = {
                      title : {
                          text: 'QT间期'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'QT间期(ms)',
                          }
                      ],
                      series : [
                          {
                              name:'QT间期',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: ecgData3,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartecg4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 60
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 100
                  }

                  var option = {
                      title : {
                          text: 'QRS宽度'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'QRS宽度(ms)',
                          }
                      ],
                      series : [
                          {
                              name:'QRS宽度',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: ecgData4,
//                                    markLine:{
//                                        itemStyle:{
//                                            normal:{lineStyle:{type:'solid',color:'#FFFF00',width:2},label:{show:true,position:'left'}}
//                                        },
//                                        large:true,
//                                        effect:{
//                                            show: true,
//                                            loop: true,
//                                            period: 0,
//                                            scaleSize : 2,
//                                            color : null,
//                                            shadowColor : null,
//                                            shadowBlur : null
//                                        },
//                                        data:[
//                                            [
//                                                {name: '标线1起点',value:120, xAxis: 0, yAxis: 120},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
//                                                {name: '标线1终点', xAxis:lenx, yAxis: 120}             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
//                                            ],
//                                            [
//                                                {name: '标线1起点', xAxis: 0, yAxis: 200},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index，通过xAxis:-1|MAXNUMBER可以让线到达grid边缘
//                                                {name: '标线1终点', xAxis:lenx, yAxis: 200}             // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
//                                            ],
//                                        ]
//                                    }
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
            </div>
          </div>
          <h2 class="sub-header">肿瘤指标检测<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="tabcancer">
            <ul class="resp-tabs-list hor_1">
              <li>癌胚抗原</li>
              <li>甲胎蛋白</li>
              <li>鳞状癌抗原</li>
              <li>前列腺特异抗原</li>
              <li>糖类抗原(CA199)	</li>
              <li>糖类抗原(CA211)</li>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chartcancer1" style="width:100%;height:400px;"></div>
              <div id="chartcancer2" style="width:100%;height:400px;"></div>
              <div id="chartcancer3" style="width:100%;height:400px;"></div>
              <div id="chartcancer4" style="width:100%;height:400px;"></div>
              <div id="chartcancer5" style="width:100%;height:400px;"></div>
              <div id="chartcancer6" style="width:100%;height:400px;"></div>


              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartcancer1"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 10
                  }

                  var option = {
                      title : {
                          text: '癌胚抗原'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'癌胚抗原(ug/L)',
                          }
                      ],
                      series : [
                          {
                              name:'癌胚抗原',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: cancerData1,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartcancer2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 25
                  }

                  var option = {
                      title : {
                          text: '甲胎蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'甲胎蛋白(ug/L)',
                          }
                      ],
                      series : [
                          {
                              name:'甲胎蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: cancerData2,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartcancer3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 2.9
                  }

                  var option = {
                      title : {
                          text: '鳞状癌抗原'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'鳞状癌抗原(mg/L)',
                          }
                      ],
                      series : [
                          {
                              name:'癌胚抗原',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: cancerData3,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartcancer4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 5
                  }

                  var option = {
                      title : {
                          text: '前列腺特异抗原'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'前列腺特异抗原(ug/L)',
                          }
                      ],
                      series : [
                          {
                              name:'前列腺特异抗原',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: cancerData4,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartcancer5"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 35
                  }

                  var option = {
                      title : {
                          text: '糖类抗原(CA199)'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'糖类抗原(CA199)(KU/L)',
                          }
                      ],
                      series : [
                          {
                              name:'糖类抗原',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: cancerData5,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartcancer6"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 4.9
                  }

                  var option = {
                      title : {
                          text: '糖类抗原(CA211)'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'糖类抗原(CA211)(mg/L)',
                          }
                      ],
                      series : [
                          {
                              name:'糖类抗原(CA211)',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: cancerData6,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

            </div>
          </div>
          <h2 class="sub-header">血常规检测<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="tabblood">
            <ul class="resp-tabs-list hor_1">
              <li>红细胞计数</li>
              <li>红细胞积压</li>
              <li>红细胞平均体积</li>
              <li>红细胞平均血红蛋白</li>
              <li>平均血红蛋白浓度</li>
              <li>血小板计数</li>
              <li>血小板平均体积</li>
              <li>血小板压积</li>
              <li>血小板体积分布密度</li>
              <li>血红蛋白</li>
              <li>白细胞计数</li>
              <li>淋巴细胞绝对值</li>
              <li>中性粒细胞绝对值	</li>
              <li>单核细胞绝对值</li>
              <li>淋巴细胞相对百分比</li>
              <li>粒细胞相对百分比</li>
              <li>单核细胞相对百分比</li>
              <li>红细胞体积分布宽度</li>
              <li>血沉</li>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chartblood1" style="width:100%;height:400px;"></div>
              <div id="chartblood2" style="width:100%;height:400px;"></div>
              <div id="chartblood3" style="width:100%;height:400px;"></div>
              <div id="chartblood4" style="width:100%;height:400px;"></div>
              <div id="chartblood5" style="width:100%;height:400px;"></div>
              <div id="chartblood6" style="width:100%;height:400px;"></div>
              <div id="chartblood7" style="width:100%;height:400px;"></div>
              <div id="chartblood8" style="width:100%;height:400px;"></div>
              <div id="chartblood9" style="width:100%;height:400px;"></div>
              <div id="chartblood10" style="width:100%;height:400px;"></div>
              <div id="chartblood11" style="width:100%;height:400px;"></div>
              <div id="chartblood12" style="width:100%;height:400px;"></div>
              <div id="chartblood13" style="width:100%;height:400px;"></div>
              <div id="chartblood14" style="width:100%;height:400px;"></div>
              <div id="chartblood15" style="width:100%;height:400px;"></div>
              <div id="chartblood16" style="width:100%;height:400px;"></div>
              <div id="chartblood17" style="width:100%;height:400px;"></div>
              <div id="chartblood18" style="width:100%;height:400px;"></div>
              <div id="chartblood19" style="width:100%;height:400px;"></div>



              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood1"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 4
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 5.5
                  }

                  var option = {
                      title : {
                          text: '红细胞计数'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'红细胞计数(10E12/L)',
                          }
                      ],
                      series : [
                          {
                              name:'红细胞计数',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData1,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 42
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 49
                  }

                  var option = {
                      title : {
                          text: '红细胞压积'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'红细胞压积(L/L)',
                          }
                      ],
                      series : [
                          {
                              name:'红细胞压积',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData2,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 82
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 95
                  }

                  var option = {
                      title : {
                          text: '红细胞平均体积'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'红细胞平均体积(f1)',
                          }
                      ],
                      series : [
                          {
                              name:'红细胞平均体积',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData3,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 27
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 33
                  }

                  var option = {
                      title : {
                          text: '红细胞平均血红蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'红细胞平均血红蛋白(单位:pg)',
                          }
                      ],
                      series : [
                          {
                              name:'红细胞平均血红蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData4,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood5"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 320
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 360
                  }

                  var option = {
                      title : {
                          text: '平均血红蛋白浓度	'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'红细胞平均血红蛋白(g/L)',
                          }
                      ],
                      series : [
                          {
                              name:'红细胞平均血红蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData5,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood6"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 100
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 300
                  }

                  var option = {
                      title : {
                          text: '血小板计数'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血小板计数(10E9/L)',
                          }
                      ],
                      series : [
                          {
                              name:'血小板计数',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData6,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood7"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 6
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 14
                  }

                  var option = {
                      title : {
                          text: '血小板平均体积'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血小板平均体积(f1)',
                          }
                      ],
                      series : [
                          {
                              name:'血小板平均体积',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData7,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood8"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0.108
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 0.282
                  }

                  var option = {
                      title : {
                          text: '血小板压积'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血小板压积(L/F)',
                          }
                      ],
                      series : [
                          {
                              name:'血小板压积',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData8,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood9"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 15
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 17
                  }

                  var option = {
                      title : {
                          text: '血小板体积分布密度'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血小板体积分布密度(%)',
                          }
                      ],
                      series : [
                          {
                              name:'血小板体积分布密度',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData9,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood10"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 120
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 160
                  }

                  var option = {
                      title : {
                          text: '血红蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血红蛋白(g/L)',
                          }
                      ],
                      series : [
                          {
                              name:'血红蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData10,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood11"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 4
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 10
                  }

                  var option = {
                      title : {
                          text: '白细胞计数'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'白细胞计数(10E9/L)',
                          }
                      ],
                      series : [
                          {
                              name:'白细胞计数',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData11,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood12"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0.8
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 4
                  }

                  var option = {
                      title : {
                          text: '淋巴细胞绝对值'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'淋巴细胞绝对值(10E9/L)',
                          }
                      ],
                      series : [
                          {
                              name:'淋巴细胞绝对值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData12,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood13"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 2
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 7
                  }

                  var option = {
                      title : {
                          text: '中性粒细胞绝对值'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'中性粒细胞绝对值(10E9/L)',
                          }
                      ],
                      series : [
                          {
                              name:'中性粒细胞绝对值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData13,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood14"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0.1
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 0.9
                  }

                  var option = {
                      title : {
                          text: '单核细胞绝对值'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'单核细胞绝对值(10E9/L)',
                          }
                      ],
                      series : [
                          {
                              name:'单核细胞绝对值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData14,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood15"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 20
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 40
                  }

                  var option = {
                      title : {
                          text: '淋巴细胞相对百分比'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'淋巴细胞相对百分比(%)',
                          }
                      ],
                      series : [
                          {
                              name:'淋巴细胞相对百分比',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData15,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood16"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 50
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 75
                  }

                  var option = {
                      title : {
                          text: '粒细胞相对百分比'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'粒细胞相对百分比(%)',
                          }
                      ],
                      series : [
                          {
                              name:'粒细胞相对百分比',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData16,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood17"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 3
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] =9
                  }

                  var option = {
                      title : {
                          text: '单核细胞相对百分比'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'单核细胞相对百分比(%)',
                          }
                      ],
                      series : [
                          {
                              name:'单核细胞相对百分比',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData17,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood18"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 10.6
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 15
                  }

                  var option = {
                      title : {
                          text: '红细胞体积分布宽度	'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'红细胞体积分布宽度(%)',
                          }
                      ],
                      series : [
                          {
                              name:'红细胞体积分布宽度',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData18,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartblood19"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 15
                  }

                  var option = {
                      title : {
                          text: '血沉'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'血沉(mm/h)',
                          }
                      ],
                      series : [
                          {
                              name:'血沉',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodData19,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>


            </div>
          </div>
          <h2 class="sub-header">尿常规检测<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="taburine">
            <ul class="resp-tabs-list hor_1">
              <li>尿胆原（URO）</li>
              <li>尿比重</li>
              <li>尿酸碱值</li>
              <li>镜检红细胞</li>
              <li>镜检白细胞</li>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="charturine1" style="width:100%;height:400px;"></div>
              <div id="charturine2" style="width:100%;height:400px;"></div>
              <div id="charturine3" style="width:100%;height:400px;"></div>
              <div id="charturine4" style="width:100%;height:400px;"></div>
              <div id="charturine5" style="width:100%;height:400px;"></div>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("charturine1"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 15
                  }

                  var option = {
                      title : {
                          text: '尿胆原'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'尿胆原(umol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'尿胆原',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: urineData4,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("charturine2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 1
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 1.03
                  }

                  var option = {
                      title : {
                          text: '尿比重'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'尿比重',
                          }
                      ],
                      series : [
                          {
                              name:'尿比重',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: urineData9,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("charturine3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 4.5
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 8
                  }

                  var option = {
                      title : {
                          text: '尿酸碱值'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'尿酸碱值',
                          }
                      ],
                      series : [
                          {
                              name:'尿酸碱值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: urineData10,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("charturine4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 3
                  }

                  var option = {
                      title : {
                          text: '镜检红细胞'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'镜检红细胞',
                          }
                      ],
                      series : [
                          {
                              name:'镜检红细胞',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: urineData11,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("charturine5"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 5
                  }

                  var option = {
                      title : {
                          text: '镜检白细胞'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'镜检白细胞',
                          }
                      ],
                      series : [
                          {
                              name:'镜检白细胞',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: urineData12,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);
              </script>
            </div>
          </div>
          <h2 class="sub-header">肝功能检测<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="tabliver">
            <ul class="resp-tabs-list hor_1">

              <li>总胆红素</li>
              <li>谷草转氨酶</li>
              <li>谷丙转氨酶</li>
              <li>总蛋白</li>
              <li>白蛋白</li>
              <li>球蛋白</li>
              <li>白球比</li>
              <li>碱性磷酸酶</li>
              <li>直接胆红素</li>
              <li>间接胆红素</li>
              <li>总胆汁酸</li>
              <li>r-谷氨酸基转移酶</li>

            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chartliver1" style="width:100%;height:400px;"></div>
              <div id="chartliver2" style="width:100%;height:400px;"></div>
              <div id="chartliver3" style="width:100%;height:400px;"></div>
              <div id="chartliver4" style="width:100%;height:400px;"></div>
              <div id="chartliver5" style="width:100%;height:400px;"></div>
              <div id="chartliver6" style="width:100%;height:400px;"></div>
              <div id="chartliver7" style="width:100%;height:400px;"></div>
              <div id="chartliver8" style="width:100%;height:400px;"></div>
              <div id="chartliver9" style="width:100%;height:400px;"></div>
              <div id="chartliver10" style="width:100%;height:400px;"></div>
              <div id="chartliver11" style="width:100%;height:400px;"></div>
              <div id="chartliver12" style="width:100%;height:400px;"></div>




              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver1"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 5
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 22
                  }

                  var option = {
                      title : {
                          text: '总胆红素'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'总胆红素(umol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'总胆红素',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData1,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 5
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 40
                  }

                  var option = {
                      title : {
                          text: '谷草转氨酶'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'谷草转氨酶(L/L)',
                          }
                      ],
                      series : [
                          {
                              name:'谷草转氨酶',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData2,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 55
                  }

                  var option = {
                      title : {
                          text: '谷丙转氨酶'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'谷丙转氨酶(U/L)',
                          }
                      ],
                      series : [
                          {
                              name:'谷丙转氨酶',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData3,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 62
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 82
                  }

                  var option = {
                      title : {
                          text: '总蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'总蛋白(g/L)',
                          }
                      ],
                      series : [
                          {
                              name:'总蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData4,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver5"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 35
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 55
                  }

                  var option = {
                      title : {
                          text: '白蛋白	'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'白蛋白(U/L)',
                          }
                      ],
                      series : [
                          {
                              name:'白蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData5,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver6"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 20
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 34
                  }

                  var option = {
                      title : {
                          text: '球蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'球蛋白(U/L)',
                          }
                      ],
                      series : [
                          {
                              name:'球蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData6,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver7"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 1.5
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 2.5
                  }

                  var option = {
                      title : {
                          text: '白球比'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'白球比',
                          }
                      ],
                      series : [
                          {
                              name:'白球比',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData7,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver8"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 40
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] =150
                  }

                  var option = {
                      title : {
                          text: '碱性磷酸酶'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'碱性磷酸酶(u/L)',
                          }
                      ],
                      series : [
                          {
                              name:'碱性磷酸酶',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData8,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver9"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 1.7
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 6.8
                  }

                  var option = {
                      title : {
                          text: '直接胆红素'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'直接胆红素(umol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'血小板体积分布密度',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData9,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver10"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 3.3
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 15.2
                  }

                  var option = {
                      title : {
                          text: '间接胆红素'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'间接胆红素(umol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'血红蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData10,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver11"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 10
                  }

                  var option = {
                      title : {
                          text: '总胆汁酸'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'总胆汁酸(umol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'总胆汁酸',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData11,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,
                          }
                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartliver12"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 7
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 50
                  }

                  var option = {
                      title : {
                          text: 'r-谷氨酸基转移酶'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'r-谷氨酸基转移酶(u/L)',
                          }
                      ],
                      series : [
                          {
                              name:'r-谷氨酸基转移酶',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: liverData12,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }
                      ]
                  };
                  // 为echarts对象加载数据
                  myChart.setOption(option);
              </script>

            </div>
          </div>
          <h2 class="sub-header">血脂检测<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="tabbloodfat">
            <ul class="resp-tabs-list hor_1">

              <li>总胆固醇</li>
              <li>甘油三酯</li>
              <li>低密度脂蛋白</li>
              <li>高密度脂蛋白</li>
            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chartbloodfat1" style="width:100%;height:400px;"></div>
              <div id="chartbloodfat2" style="width:100%;height:400px;"></div>
              <div id="chartbloodfat3" style="width:100%;height:400px;"></div>
              <div id="chartbloodfat4" style="width:100%;height:400px;"></div>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartbloodfat1"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 2.3
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 5.7
                  }

                  var option = {
                      title : {
                          text: '总胆固醇'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'总胆固醇(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'总胆固醇',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodfatData1,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartbloodfat2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0.5
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 1.7
                  }

                  var option = {
                      title : {
                          text: '甘油三酯'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'甘油三酯(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'甘油三酯',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodfatData2,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartbloodfat3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 2.1
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 3.1
                  }

                  var option = {
                      title : {
                          text: '低密度脂蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'低密度脂蛋白(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'低密度脂蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodfatData3,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartbloodfat4"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 0.8
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 1.8
                  }

                  var option = {
                      title : {
                          text: '高密度脂蛋白'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'高密度脂蛋白(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'高密度脂蛋白',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: bloodfatData4,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

            </div>
          </div>
          <h2 class="sub-header">肾功能检测<font size="5" color="#dc143c">(提示:黄线以内为参考正常范围)</font></h2>
          <div id="tabkidney">
            <ul class="resp-tabs-list hor_1">

              <li>肌酐</li>
              <li>尿素氮</li>
              <li>尿酸</li>

            </ul>
            <div class="resp-tabs-container hor_1">
              <div id="chartkidney1" style="width:100%;height:400px;"></div>
              <div id="chartkidney2" style="width:100%;height:400px;"></div>
              <div id="chartkidney3" style="width:100%;height:400px;"></div>


              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartkidney1"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 53
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 136
                  }

                  var option = {
                      title : {
                          text: '肌酐'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'肌酐(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'肌酐',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: kidneyData1,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartkidney2"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 2.3
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 7.2
                  }

                  var option = {
                      title : {
                          text: '尿素氮'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'尿素氮(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'尿素氮',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: kidneyData2,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>

              <script type="text/javascript">
                  // 基于准备好的dom，初始化echarts图表
                  var myChart = echarts.init(document.getElementById("chartkidney3"));
                  var nommin=[];
                  for(var n = 0; n < lenx; n++) {
                      nommin[n] = 155
                  }
                  var nommax=[];
                  for(var n = 0; n < lenx; n++) {
                      nommax[n] = 428
                  }

                  var option = {
                      title : {
                          text: '尿酸'
                      },
                      tooltip : {
                          trigger: 'axis'
                      },

                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      dataZoom : {
                          show : true,
                          realtime : true,
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              boundaryGap : false,
                              data : xData
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              name:'尿酸(mmol/L)',
                          }
                      ],
                      series : [
                          {
                              name:'尿酸',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                  }
                              },
                              data: kidneyData3,
                          },
                          {
                              name:'参考范围最低值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommin,

                          },
                          {
                              name:'参考范围最高值',
                              type:'line',

                              itemStyle: {
                                  normal: {
                                      color: '#ffff00'  <!--线条颜色-->
                                  }
                              },
                              data:nommax,

                          }

                      ]
                  };

                  // 为echarts对象加载数据
                  myChart.setOption(option);

              </script>
            </div>
          </div>
          </br></br>
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
    <script type="text/javascript" src="js/easyResponsiveTabs.js"></script>
    <script>
        $(document).ready(function() {
            //Horizontal Tab
            $('#tab').easyResponsiveTabs({
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
            $('#tabecg').easyResponsiveTabs({
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
            $('#tabcancer').easyResponsiveTabs({
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
            $('#tabblood').easyResponsiveTabs({
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
            $('#taburine').easyResponsiveTabs({
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
            $('#tabliver').easyResponsiveTabs({
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
            $('#tabbloodfat').easyResponsiveTabs({
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
            $('#tabkidney').easyResponsiveTabs({
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
