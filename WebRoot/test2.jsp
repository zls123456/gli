<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
	<script>
	window.onload=function(){
	var dragged;
	document.addEventListener("dragstart", function(event) {
		
		// 保存被拖拉节点 
			dragged = event.target;
			// 被拖拉节点的背景色变透明 
		//	event.target.style.opacity = 0.5;
			this.style.backgroundColor = "red";
			// 兼容Firefox 
			event.dataTransfer.setData('text/plain', 'anything');
		}, false);
	document.addEventListener('dragend', function(event) {
		// 被拖拉节点的背景色恢复正常
			event.target.style.opacity = '';
		}, false);
	document.addEventListener('dragover', function(event) {
		// 防止拖拉效果被重置，允许被拖拉的节点放入目标节点
			event.preventDefault();
		}, false);
	document.addEventListener('dragenter', function(event) {
		// 目标节点的背景色变紫色 
			// 由于该事件会冒泡，所以要过滤节点 
			if (event.target.className == 'dropzone') {
				event.target.style.background = 'purple';
			}
		}, false);
	document.addEventListener('dragleave', function(event) {
		// 目标节点的背景色恢复原样
			if (event.target.className == 'dropzone') {
				event.target.style.background = "";
			}
		}, false);
	document.addEventListener('drop', function(event) {
		// 防止事件默认行为（比如某些Elment节点上可以打开链接）
			event.preventDefault();
			if (event.target.className === 'dropzone') {
				// 恢复目标节点背景色 
			event.target.style.background = '';
			// 将被拖拉节点插入目标节点 
			dragged.parentNode.removeChild(dragged);
			event.target.appendChild(dragged);
		}
	}, false);
	}
</script>
	<style>
#clock { /* Make the clock look nice */
	font: bold 24pt sans;
	background: #ddf;
	padding: 10px;
	border: solid black 2px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div class="dropzone"> 
	  <div id="draggable" draggable="true"> 
	         该节点可拖拉  
	  </div> 
	 </div>
	  <div class="dropzone"></div>
	   <div class="dropzone"></div> 
	  <div class="dropzone"></div>

</body>

</html>
