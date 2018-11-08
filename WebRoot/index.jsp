<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>一汽集团</title>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!-- 引入jquery easyui -->
		<link rel="stylesheet" type="text/css" href="<%=path%>/jquery-easyui-1.4.2/themes/black/easyui.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/jquery-easyui-1.4.2/themes/icon.css" /> 
		<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>   
		<script type="text/javascript" src="<%=path%>/jquery-easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script> 
		
	<style type="text/css">
		input {
			border-radius: 1.5px;
			cursor: pointer
		}
		
		.panel-title {
			text-align:center;
		}
	</style>
		
		
		
	<script type="text/javascript">
		
	
		<%-- 点击左侧节点，填充选项卡 
		$(".easyui-linkbutton").click(function(){
			var tabtext = $(this).text();
			alert(tabtext);
			var hr=$(this).attr("title");
			alert(hr);
			var htm=$("#cen").html();
			var biaoge= $("#table").html();
		//	$("#tt").append(hr);
			
			console.log(tabtext);
			if($("#tt").tabs("exists",tabtext)){
				$("#tt").tabs("select",tabtext);
			}else{
				$("#tt").append(biaoge);
				$("#tt").append(htm);
				
				$("#tt").tabs('add',{
					title:tabtext,
					closable:true,
					content:'<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				});
			}
			--%>
			$(function(){
			//去除tree前面的图标
				$("#treeul").find("span.tree-icon.tree-file").removeClass("tree-icon tree-file");
			
			});
			
			//点击树节点，添加tab页
			function addTab(tabtext,url){
				if($("#tt").tabs("exists",tabtext)){
				$("#tt").tabs("select",tabtext);
			}else{
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$("#tt").tabs('add',{
					title:tabtext,
					closable:true,
					content:content
				});
			
			}
		}
	
	
	
		 
		
		
	
	</script>
	
	
	
  </head>
  
  <body class="easyui-layout" >
     	 
     <div data-options="region:'north'" style="height:100px;">
     	<img src="<%=path %>/img/yiqiwenzi.jpg" width="100%" height="98px"/>
     </div>
      
     <!-- 管理菜单 -->
     <div data-options="region:'west',title:'管理目录',split:true,width:'10%'">
     	<!-- 手风琴菜单 -->
     	<div id="ac" class="easyui-accordion" data-options="fit:true,animate:true,selected:99999">
		    <div title="品牌信息" >
		    <ul id="treeul" class="easyui-tree">
		    
			<li>   <a id="add_tab" style="width:100%" onclick="addTab('新标签页','http://www.jq22.com/demo/jquery-xiangqi-141214215742/')">新标签页</a></li> 
			  <li>  <a style="width:100%" onclick="addTab('一汽大众','<%=path %>/yiqidazhong.jsp');">一汽大众</a></li> 
			   
			 <li>  <a style="width:100%" title="一汽丰田" onclick="addTab('一汽丰田','<%=path %>/yiqifengtian.jsp');">一汽丰田</a></li> 
			<li>   <a style="width:100%" title="其他品牌" onclick="addTab('其他品牌','<%=path %>/qita.jsp');">其他品牌</a></li> 
		   </ul>
		    </div>
		    <div title="销售信息">
		    	<a style="width:100%" title="手风琴" href="#" onclick="addTab('手风琴','<%=path %>/shoufengqin.jsp');">手风琴</a> 
		    </div>
		    <div title="招聘信息">这是员工招聘信息模块</div>
		    <div title="公司简介">这是公司简介信息模块</div>
		 </div>    
    </div>   
    <!-- 中间部分 -->
        <div data-options="region:'center',title:'center title'" style="padding:5px;">
        <!-- 相关tab -->
        	 <div id="tt" class="easyui-tabs" data-options="fit:true">   
			    <div title="欢迎页" style="padding:20px;" data-options="closable:true">   
			         
			    </div>   
			  
			</div>  
        
        </div>  
        
        
  </body>  
</html>
