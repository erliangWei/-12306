<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="/js/jquery-1.11.1.min.js">
</script>
<link href="css/header_behind.css" rel="stylesheet"  />
<script type="text/javascript">
$(function(){
	var wid=screen.availWidth;
		//$("#container").css("width",wid);
		$("#container").width(wid);
		$("#navigation").width(wid);
		$("#manager_state").width(wid-200);
	});


</script>
<style type="text/css">

</style>
</head>

<body>
<div id="container">
<div id="bh_header">
	<div id="bh_logo">
    	<img src="img/bh_logo02.gif" />
    </div>
    <div id="manager_state">
        <ul style="width:500px;">
        	<li><a href="#">
                <div><img src="img/home.gif" /></div>
                <div>主 页</div></a>
            </li>
            <li><a href="#">
            	<div><img src="img/admin.gif" /></div>
                <div>admin</div></a>
            </li>
            <li><a href="#">
            	<div><img src="img/help.gif" /></div>
              	<div>帮 助</div></a>
            </li>
            <li><a href="#">
            	<div><img src="img/exit.gif" /></div>
                <div>安全退出</div></a>
            </li>
        </ul>
    	
  
    </div>
   
</div>
 <div id="navigation">

    <div id="info">
    	<span id="message_show">通知：明天放假</span>
    	<span id="time_show">2014年10月1日  10:01</span>
    </div>
 </div>
 </div>
</body>
</html>
