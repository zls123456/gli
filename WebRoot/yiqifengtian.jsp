<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'yiqi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 引入jquery easyui -->
		<link rel="stylesheet" type="text/css" href="<%=path%>/jquery-easyui-1.4.2/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/jquery-easyui-1.4.2/themes/icon.css" /> 
		<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>   
		<script type="text/javascript" src="<%=path%>/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script> 
	
	 <script type="text/javascript">
		
	</script>
	
	
  </head>
  
  <body>
   <div id="cen" style="overflow:auto;">
        	<input id="search" type="button" value="查找" />
        	<input id="add" type="button" value="新增" />
        	<input id="delete" type="button" value="删除" />
        	<input id="update" type="button" value="修改" />
    <table id="dg" class="easyui-datagrid" title="My Users" style="width:100%;height:100%" fit=true url="getyiqi.action"
		rownumbers=true fitColumns=true singleSelect=true pagination=true pageSize=10 pageList=[10,20,30] pagePosition=bottom>
		<thead>
			<tr>
				<th field="id" checkbox=true>编号</th>
				<th field="firstname" width="50" editor="{type:'validatebox',options:{required:true}}">位置名称</th>
				<th field="lastname" width="50" editor="{type:'validatebox',options:{required:true}}">创建时间</th>
				<th field="phone" width="50" editor="text">电话</th>
				<th field="email" width="50" editor="{type:'validatebox',options:{validType:'email'}}">邮箱</th>
				<th field="email" width="50">客服人员</th>
			</tr>
		</thead>
	</table>
 </div>
  </body>
  
 
  
</html>
