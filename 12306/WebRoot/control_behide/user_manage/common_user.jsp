<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>普通用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="../css/behide_common.css" rel="stylesheet" />
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="../../control_behide/js/user_list_load.js" type="text/javascript"></script>
	<script src="../../control_behide/js/table-CSS.js" type="text/javascript"></script>
	<script src="../../control_behide/js/user-delete.js" type="text/javascript"></script>
	<script src="../../control_behide/js/passenger-list-load.js" type="text/javascript"></script>

	
<script type="text/javascript">
	$(document).ready(function(e) {
		$("#user_info_board").hide();
		loadUserList(1);
	});

	
</script>

<style type="text/css">
#user_info_board{width:99%; border:1px solid #09F; border-top-right-radius:6px; border-top-left-radius:6px;}
#passenger{border:1px solid #09F; border-top-right-radius:5px; border-top-left-radius:5px;}
#user_more_info tr td{height:25px;font-size:14px;}
#user_more_info {padding-bottom:10px;}
#passenger_board p{padding:15px 0 10px 30px; font-size:16px; font-weight:bold;}
#passenger_board table tr td{height:20px;}
#passenger_board {height:450px;}
.user_info_title{font-weight:bold;}
</style>

</head>
  
<body>
    <div id="container">
	    <div class="title"> <p>普通用户管理</p>
	    </div>
	    <table id="search" align="center">
	        <tr>
	        	<td class="opera"><input type="button" value="删除" id="delete" ></td>
	            <td align="right">
	            	<input type="text" placeholder="请输入车次">
	            	<input type="button" value="查询" id="search_but" ></td>
	        </tr>
	    </table>
		<div id="list">
		    <table align="center" cellspacing="0" id = "user_list">
		       <tr align="center" height="25px" style="background:url(../img/title_bg.gif)">
		            <th>
		                <input type="checkbox" name="select" id="check_all">
		            </th>
		            <th>序号</th>
		            <th>用户名</th>
		            <th>姓名</th>
		            <th>性别</th>
		            <th>证件类型</th>
		            <th>证件号码</th>
		            <th>出生日期</th>
		            <th>旅客类型</th>
		            <th>最近登录时间</th>
		            <th>详细信息</th>
		 	    </tr>
				<tbody id="user_info_list">
					
		   		</tbody>
		    </table>
		</div>
		<div id="page">
		</div>
	</div>
	<div id="user_info_board">
		<div class="title" > <p>普通用户详细信息</p>
		</div>
		<div id="user_info">
		    <table align="center" style="padding-top:20px;" id="user_more_info">
			    <tr>
			        <td  align="right" style="width:100px;" class="user_info_title"> 用户名：</td>
			        <td id="user_name"></td>
			        <td  align="right" class="user_info_title"> 姓名：</td>
			        <td id="name"></td>
			        <td  align="right" class="user_info_title"> 性别：</td>
			        <td id="sex"></td>
			        <td  align="right" class="user_info_title"> 证件类型：</td>
			        <td id="ID_type"></td>
			        <td  align="right" class="user_info_title"> 证件号码：</td>
			        <td id="ID_code"></td>
			    </tr>
			    <tr>
			        <td  align="right" class="user_info_title">出生日期：</td>
			        <td id="birth_day"></td>
			        <td  align="right" class="user_info_title"> 旅客类型：</td>
			        <td id="passenger_type"></td>
			        <td  align="right" class="user_info_title"> 手机号码：</td>
			        <td id="phone_num"></td>
			        <td  align="right" class="user_info_title">固定电话：</td>
			        <td id="tell_num"></td>
			        <td  align="right" class="user_info_title"> 电子邮件：</td>
			        <td id="email"></td>
			    </tr>
			    <tr>
			        <td  align="right" class="user_info_title">地址：</td>
			        <td  colspan="5" id="address"></td>
			        <td  align="right" class="user_info_title">邮编：</td>
			        <td id="post_code"> </td>
			        <td  align="right" class="user_info_title">最近登录时间：</td>
			        <td id="last_login_time"></td>
			    </tr>
			    <tr>
		    </table>
	    </div>
	    <hr/>
	    <div id="passenger_board">
		    <p> 常用联系人	</p>
		    <table align="center" cellspacing="0" id = "passenger">
		       <tr align="center" height="25px" style="background:url(../img/title_bg.gif)">
		            <th>序号</th>
		            <th>姓名</th>
		            <th>性别</th>
		            <th>证件类型</th>
		            <th>证件号码</th>
		            <th>旅客类型</th>
		            <th>手机号码</th>
		            <th>固定电话</th>
		            <th>电子邮件</th>
		            <th>地址</th>
		            <th>邮编</th>
		 	    </tr>
		 
				<tbody id="passenger_info_list">
					
		   		</tbody>
		    </table>
		</div>
	</div>
  </body>
</html>
