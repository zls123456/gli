<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'qita.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
  <body>
   <canvas id="canvas" width="500" height="400"></canvas>

    
  </body>
  
  <script src="<%=path %>/js/sChart.min.js"></script>
    <script>
        var data = [
            {name:'2014', value:2260},
            {name:'2015', value:1170},
            {name:'2016', value:970},
            {name:'2017', value:1450},
            {name:'2018', value:2500}
            
        ]
        new sChart('canvas', 'bar', data, {
            title: '商店近年营业总额',	// The title of a bar chart
            autoWidth: true     // 设置宽高自适应父元素宽高
        });
    </script>
  
</html>
