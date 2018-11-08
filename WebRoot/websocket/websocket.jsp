<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>websocket数据页面</title>
		<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
	$(function() {
		var websocket = null;
		if ('WebSocket' in window) {
			websocket = new WebSocket("ws://localhost:8080/gli/go");
		} else {
			alert("浏览器版本不支持websocket!");
		}

		//定义连接错误的回调方法
		websocket.onerror = function() {
			alert('websocket连接出错！');
		}
		
		//定义websocket关闭的回调方法
		websocket.onclose = function() {
			alert('websocket已关闭！')
		}
		
		//当窗口关闭时，主动去关闭websocket连接
		window.onbeforeunload = function() {
			websocket.close();
		}
		
		//接收到消息的回调方法 
		websocket.onmessage = function(event) {
			handleMsg(event.data);
		}
		
		$('#send').click(function() {
			websocket.send($('#input').val());
		});
		
	}); 
	
	
	//把服务器发送过来的信息放到textarea里面
	function handleMsg(msg) {
		$('#msg').append(msg + '\n');
	}
</script>
	</head>
	<body>
		<input name="input" id="input" type="text" />
		&nbsp;
		<input name="send" id="send" type="button" value="发送请求" />
		<br>
		<hr style="width: 50%;" align="left">
		<textarea name="msg" id="msg" style="width: 260px; height: 190px"></textarea>
	</body>

</html>