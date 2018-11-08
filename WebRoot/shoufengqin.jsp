<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--
	
	描述：兼容IE的动态菜单样式
-->
<html>
	<head>
		<meta charset="utf-8" />
		<!-- 通用样式 -->
		<link rel="stylesheet" type="text/css" href="css/public.css"/>
		<!-- 动态菜单CSS -->
		<link rel="stylesheet" type="text/css" href="css/menu.css"/>
		<!-- jquery引入 -->
		<script src="js/jquery-1.4.2.min.js"></script>
		<!-- 动态菜单JS -->
		<script type="text/javascript" src="js/menu.js"></script>
		<title>兼容IE的动态菜单样式</title>
		<style>
		
			body{background-color: #f0f3f4}
		</style>
	</head>
	<body>
		<div class="middle">
			<div class="leftMenu">
				<div class="topMenu">
					<img class="banshi" src="http://www.17sucai.com/preview/1/2017-05-13/menu/img/banshidating.png" />
					<p class="menuTitle">各地名吃菜单</p>
				<!-- 	<img class="changeMenu" src="http://www.17sucai.com/preview/1/2017-05-13/menu/img/shouqicaidan.png" onClick="hidMenu()"/>
				 -->
				</div>
				<div class="menu_list">
					<ul>
						<li class="">
							<p class="fuMenu">武汉名吃</p>
							<img class="xiala" src="http://www.17sucai.com/preview/1/2017-05-13/menu/img/xiala.png" />
							<div class="div1">
								<p class="zcd" id="zcd1">老通城的三鲜豆皮</p>
								<p class="zcd" id="zcd2">四季美的汤包</p>
								<p class="zcd" id="zcd3">蔡林记的热干面</p>
								<p class="zcd" id="zcd4">顺香居的烧麦</p>
								<p class="zcd" id="zcd5">福庆和的牛肉豆丝</p>
								<p class="zcd" id="zcd6">小桃园的煨汤</p>
								<p class="zcd" id="zcd7">田启恒的糊汤粉</p>
								<p class="zcd" id="zcd8">谢荣德的面窝</p>
							</div>
						</li>
						<li class="">
							<p class="fuMenu">山东名吃</p>
							<img class="xiala" src="http://www.17sucai.com/preview/1/2017-05-13/menu/img/xiala.png" />
							<div class="div1">
								<p class="zcd" id="zcd9">威海鲅鱼煎包</p>
								<p class="zcd" id="zcd10">济南拔丝山药</p>
								<p class="zcd" id="zcd11">枣庄菜煎饼</p>
								<p class="zcd" id="zcd12">青岛大包</p>
								<p class="zcd" id="zcd13">潍坊肉火烧</p>
								<p class="zcd" id="zcd14">济宁甏肉干饭</p>
								<p class="zcd" id="zcd15">沂蒙光棍鸡</p>
								<p class="zcd" id="zcd16">莱芜烧饼</p>
								<p class="zcd" id="zcd17">平原签子馒头</p>
								<p class="zcd" id="zcd18">魏集驴肉</p>
							</div>
						</li>
						<li class="">
							<p class="fuMenu">北京名吃</p>
							<img class="xiala" src="http://www.17sucai.com/preview/1/2017-05-13/menu/img/xiala.png" />
							<div class="div1">
								<p class="zcd" id="zcd19">北京烤鸭</p>
								<p class="zcd" id="zcd20">驴打滚</p>
								<p class="zcd" id="zcd19">冰糖葫芦</p>
								<p class="zcd" id="zcd20">灌肠</p>
								<p class="zcd" id="zcd19">豌豆黄</p>
								<p class="zcd" id="zcd20">羊眼包子</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
