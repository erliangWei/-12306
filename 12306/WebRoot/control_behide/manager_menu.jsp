<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>导航</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="../js/jquery-1.11.1.min.js">
</script>
<link href="css/manager_menu.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript">
	var flag = new Array(0 , 0 , 0 , 0 , 0);
	var count = 5 ;
	var inf="#menu_list";
	$(function(){		
		var id;
		for(var i=1; i<=count ;i++){	
			id=inf + i;
			$(id).hide();
		}
		});
	function slide_list(id){
		var flg = id.substr(-1,1);
		var list_id = inf + flg;
		if($(list_id).slideUp() && flag[flg] != 1){
			$(list_id).slideDown(500);
			flag[flg]=1;
			for(var i=1; i<=count ;i++){
				if(flg!=i){
					list_id = inf + i;
					if(flag[i] == 1){
						$(list_id).slideUp(500);
						flag[i] = 0;
					}
				}
			}
		}
		else if(flag[flg] == 1){
			$(list_id).slideUp(500);
			flag[flg] = 0;
		}
	}
</script>
</head>

<body>
<div id="menu_container">
	<!-- <div id="admin">
    	<div id="admin_pic">
        	<img src="img/admin2.jpg" />
        </div>
        <div id="admin_info">
        	<p class="info_title">admin:</p>
            <p class="info_show">佳佳</p>
            <p class="info_title">上次登录时间：</p>
            <p class="info_show">2014年9月18日</p>
        </div>
   </div> -->
	<div class="menu">
    	<ul>
    		 <a href="#" id="menu_title1" onclick="slide_list(this.id)"><li class="li_bg">基础数据维护</li></a>
             	  <ul id="menu_list1">
            	  <a href="data_manage/station_manage.jsp" target="content"><li>车站管理</li></a>
                  <a href="data_manage/train_manage.jsp" target="content"><li>列车管理</li></a>
                  <a href="data_manage/route_manage.jsp" target="content"><li>线路管理</li></a>
                  <a href="data_manage/coach_manage.jsp" target="content"><li>列车编组管理</li></a>
                  <a href="data_manage/rate_manage.jsp" target="content"><li>票价率管理</li></a>
                  <a href="data_manage/zone_manage.jsp" target="content"><li>票价旅程区段管理</li></a>
      			  </ul>	
	          <a href="plan_manage/plan_info.jsp" id="menu_title2" onclick="slide_list(id)" target="content"><li class="li_bg">计划管理</li></a>	
<!--	  			  <ul id="menu_list2">-->
<!--	                  <a href="plan_manage/plan_info.jsp" target="content"><li>计划信息</li></a>-->
<!--	                  <a href="plan_manage/seat_info.jsp" target="content"><li>席位信息</li></a>-->
<!--      			  </ul>         -->
              <a href="#" id="menu_title3" onclick="slide_list(id)"><li class="li_bg">订单管理</li></a>
	              <ul id="menu_list3">
	                  <a href="order_manage/order.jsp" target="content"><li>订单统计</li></a>
	                  <a href="order_manage/ticket.jsp" target="content"><li>车票统计</li></a>
      			  </ul>			
              <a href="#" target="content" id="menu_title4" onclick="slide_list(id)"><li class="li_bg">票务管理</li></a>
              <ul id="menu_list4">
	                  <a href="#" target="content"><li>订单统计</li></a>
	                  <a href="#" target="content"><li>车票统计</li></a>
      			  </ul>	
              <a href="user_manage/common_user.jsp" target="content" id="menu_title5" onclick="slide_list(id)"><li class="li_bg">用户管理</li></a>	
             	<!-- <ul id="menu_list5">
                  <a href="#" target="content"><li>超级管理员</li></a>
                  <a href="#" target="content"><li>管理员</li></a>
                  <a href="user_manage/user.html" target="content"><li>普通用户</li></a>
      			  </ul>		 -->  	
		</ul>
	</div>	
</div>
</body>
</html>

