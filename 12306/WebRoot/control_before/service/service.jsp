<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>DHorse铁路服务中心</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="../css/header_before.css" rel="stylesheet" type="text/css">
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript">
	</script>
	<script type=text/javascript>
		$(function(){
			$('#mobanwang_com li').hover(function(){
				$(this).children('ul').stop(true,true).show('slow');
			},function(){
				$(this).children('ul').stop(true,true).hide('slow');
			});
			
			$('#mobanwang_com li').hover(function(){
				$(this).children('div').stop(true,true).show('slow');
			},function(){
				$(this).children('div').stop(true,true).hide('slow');
			});
		});
		$(function(){
	$("#state_third_list").hide();
	$("#state_third").mouseover(function(){
		$("#state_third_list").show();
		});
	$("#state_third").mouseleave(function(){
		$("#state_third_list").hide();
		});
	
	});
	$(function(){
	$('#state_third_list li').mouseover(function(){
		$(this).css("border-bottom-width","thin");
		$(this).css("border-bottom-color","#333");
		$(this).css("border-bottom-style","solid");
	});
	$('#state_third_list li').mouseleave(function(){
		$(this).css("border-bottom-style","none");
	});
});
	//$("#content").load("book_ticket.jsp");	//加载购票内容页
$(document).ready(function(){
	//$("#content").load("book_ticket.jsp");
	
});
//function page_load(){
		//$("#navigation").
//		alert("lll");
//		$("#content").load("query_ticket.jsp");
//	};
	


	</script>
	</head>
	<body background="../img/bg2.png">
		<div>
			<div id="header">
				<div id="logo"></div>
				<div id="state">
					<ul><li id="state_first"><a href="#" target="_self">登陆</a></li>
						<li id="state_second"><a href="#" target="_self">注册</a></li>
						<li id="state_third"><a href="./user/my12306_menu.jsp" target="show">我的12306<img src="../img/show.gif" /></a>
							<ul id="state_third_list">
								<li id="list_first"><a href="#" target="_self">未完成订单</a></li>
								<li class="list"><a href="#" target="_self">已完成订单(改/退)</a></li>
								<li class="list"><a href="#" target="_self">查看个人信息</a></li>
								<li class="list"><a href="#" target="_self">账号安全</a></li>
								<li class="list"><a href="#" target="_self">常用联系人</a></li>
								<li class="list"><a href="#" target="_self">车票快递地址</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div id="navigation">
					<ul id="mobanwang_com" class="first-menu">
						<li><a href="book_ticket.jsp" target="show" >车票预订</a>
						</li>
						<li><a href="query_ticket.jsp" target="show" >余票查询</a>
						</li>
					<!-- 	<li><a href="#" target="_self">出行向导</a>
							<ul style="display: none;" id="subMusic" class="second-menu">
								<li ><a href="#" class="mobanwang" target="_self">代售点查询</a>
								</li>
								<li><a href="#" class="mobanwang" target="_self">正晚点查询</a>
								</li>
								<li><a href="#" class="mobanwang" target="_self">中转查询</a>
								</li>
								<li><a href="#" class="mobanwang" target="_self">车站车次查询</a>
								</li>
								<li><a href="#" class="mobanwang" target="_self">票价查询</a>
								</li>
							</ul>
						</li>    -->
						<li> 
							<a href="#">信息服务</a>
						</li>
					</ul>
				</div>
			</div>
			<hr style="border: solid thin #00F;" />
			<div id="localtion">
				<p>
					您现在的位置：
				</p>
			</div>
		</div>
		<div id="content">
			<iframe id="show" name="show" src="book_ticket.jsp" style="scrolling:no;width:100%; height:600px;border:0;frameSpacing:0;frameBorder:0;"></iframe>
        </div>
	</body>
</html>
