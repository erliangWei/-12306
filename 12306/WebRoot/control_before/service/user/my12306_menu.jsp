<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	

		<title>My JSP 'my12306_menu.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="../../css/my12306_menu.css" rel="stylesheet" type="text/css" />
		<script src="../../js/jquery-1.11.1.min.js" type="text/javascript">
		</script>
		<script type=text/javascript>
		$(function() {
			$('#menu_content li').mouseover(function() {
				$(this).css("border-bottom-width", "thin");
				$(this).css("border-bottom-color", "#333");
				$(this).css("border-bottom-style", "solid");
			});
			$('#menu_content li').mouseleave(function() {
				$(this).css("border-bottom-style", "none");
	
			});
		});
</script>
</head>
<body>
<div id="container">
	<div id="menu">
		<div id="menu_title">
			<div id="my12306">
				我的12306
			</div>
		</div>
		<div id="menu_content">
			<ul>
				<a href="#"><li class="content_title_first">我的火车票</li></a>
				<a href="unfinished_orders.jsp" target="user"><li class="comtent_content">未完成订单</li></a>
				<a href="#" target="user" ><li class="comtent_content">已完成订单</li></a>
				<a href="#"><li class="content_title">个人信息</li></a>
				<a href="user_info.jsp" target="user"><li class="comtent_content">查看个人信息</li></a>
				<a href="user_safe.jsp" target="user"><li class="comtent_content">账号安全</li></a>
				<a href="#"><li class="content_title">常用信息管理</li></a>
				<a href="passenger.jsp" target="user"><li class="comtent_content">常用联系人</li></a>
				<a href="ticket_express.jsp" target="user"><li class="comtent_content">车票快递地址</li></a>
			</ul>
		</div>
	</div>
		<div id="content">
			<iframe id="user" name="user" src="unfinished_orders.jsp" style="scrolling:no;width:100%; height:550px;border:0;frameSpacing:0;frameBorder:0;"></iframe>
        </div>
	</div>
	
	</body>
</html>
