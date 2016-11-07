<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>线路管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link href="../css/behide_common.css" rel="stylesheet" />
	<style type="text/css">
	#show_route{background-color:#666; color:#FFF;width:300px; margin:0 auto; padding:5px; border:2px solid #FFF; border-radius:5px; font-size:13px; position:absolute; }
	#show_route table {color:#fff;}
	a:link {
		text-decoration: none;
	}
	a:visited {
		text-decoration: none;
	}
	a:hover {
		text-decoration: none;
	}
	a:active {
		text-decoration: none;
	}
	.way_station, .update_station {width:100px; margin-right:5px;}
	</style>
<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
<!--<script src="../../js/behide_common.js" type="text/javascript"></script>-->
<script src="../../control_behide/js/route-list-load.js" type="text/javascript"></script>
<script src="../../control_behide/js/show-route-station.js" type="text/javascript"></script>
<script src="../../control_behide/js/route-add.js" type="text/javascript"></script>
<script src="../../control_behide/js/route-delete.js" type="text/javascript"></script>
<script src="../../control_behide/js/table-CSS.js" type="text/javascript"></script>
<script src="../../control_behide/js/route-update.js" type="text/javascript"></script>
	<script src="../../control_behide/js/clear-text.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		loadRouteList(1);
	});
		
</script>

</head>
  
<body>
  <div id="container">
    <div class="title"> <p>线路管理</p>
    </div>
    <table id="search" align="center">
        <tr>
        	<td class="opera"><input type="button" value="添加" id="add" ></td>
        	<td class="opera"><input type="button" value="删除" id="delete" ></td>
            <td class="opera"><input type="button" value="修改" id="update" ></td>
            <td align="right">
            	<input type="text" placeholder="请输入站名或车次">
            	<input type="button" value="查询" id="search_but" ></td>
        </tr>
    </table>

<div id="list">
    <table align="center" cellspacing="0" id = "route_list">
    <tr align="center" height="25px" style="background:url(../img/title_bg.gif)">
    	<td>
        	<input type="checkbox" name="select" id="check_all">
        </td>
        <th>序号</th>
        <th>路线编号</th>
        <th>车次代码</th>
        <th>起点时间</th>
        <th>终点时间</th>
        <th>途经车站</th>
        <th>里程（公里）</th>
        <th>历时</th>
    </tr>
   	<tbody id="route_info_list">
   	</tbody>
    </table>
</div>
<div id="page">
</div>


</div>
<div id="add_board">
	<div class="title"> <p>添加路线信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
    <div id="add_opera">
        <input type="button" onclick="addRoute(this.id)" id="add_save_next" value="保存并添加下一条记录" />
        <input type="button" onclick="addRoute(this.id)" id="add_save_exit" value="保存退出"/>
        <input type="button" onclick="cancelExitPrompt()" id="add_cancel_exit" value="取消退出"/>
    </div>
    <hr />
    <form id="addOperator" name="addOperator" action="#" method="post">
	    <table align="center">
		    <tr>
		        <td  align="right"><span>* </span>车次代码：</td>
		        <td> <input type="text" name="trainId" id="add_train_id"  /> </td>
		    </tr>   
		    <tr>
		        <td align="right"><span>* </span>起点时间：  </td>
		        <td><input type="text" name="leaveTime" id="add_leave_time" />   </td>
		    </tr>
		    <tr>
		        <td align="right"> <span>* </span>终点时间：</td>
		        <td>   <input type="text" name="arriveTime" id="add_arrive_time" /></td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>里程：</td>
		        <td> <input type="text" name="totalDistance" id="add_total_distance" />  </td>
		    </tr>  
		    <tr>
		        <td align="right"><span>* </span>历时：</td>
		        <td> <input type="hidden" name="totalTime" id="add_total_time" />
		        	<input type="text" id="add_hour" style="width:40px;"/> 小时 
		        	<input type="text" id="add_second" style="width:40px;"/> 分钟
		        </td>  
		    </tr>  
		    <tr>
		        <td align="right"><span>* </span>途经车站：</td>
		        <td>
		        	<input type="hidden" class="" name="stationAll" id="way_station"/>
		        	车站 <input type="text" class="" name="" id="station" style="width:60px"/>
		        	到站时间 <input type="text" class="" name="" id="end_time" style="width:60px"/>
		        	发车时间 <input type="text" class="" name="" id="start_time" style="width:60px"/>
		        	停留时间 <input type="text" class="" name="" id="stay_time" style="width:60px"/>
		        	<input type="button" value="添加" id="add_station_button" style="width:40px"/>
		        </td>
		    </tr>  
		    <tr>
		        <td align="right"></td>
		        <td align="left">
		        	<table style="width:300px;" align="left" id="station_time_table">
				    	<tr>
					    	<th>序号</th>
					    	<th>车站名</th>
					    	<th>到站时间</th>
					    	<th>发车时间</th>
					    	<th>停留时间（分钟）</th>
				    	</tr>
				    	<tbody id="show_way_station">
				    	</tbody>
			    	</table>
		        </td>    
		    </tr>  
	    </table>
    </form>
</div>


<div id="update_board">
	<div class="title"> <p>修改车站信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
    <div id="add_opera">
        <input type="button" onclick="updateRoute()" id="update_save_exit" value="保存退出"/>
        <input type="button" onclick="exitUpdatePrompt()" id="update_cancel_exit" value="取消退出"/>
    </div>
    <hr />
   <form id="updateOperator" name="addOperator" action="#" method="post">
	    <table align="center">
		    <tr>
		        <td  align="right"><span>* </span>车次代码：</td>
		        <td><input type="text" name="trainId" id="update_train_id"  />
		        	<input type="hidden" name="routeId" id="update_route_id"  /> </td>
		    </tr>   
		    <tr>
		        <td align="right"><span>* </span>起点时间：  </td>
		        <td><input type="text" name="leaveTime" id="update_leave_time" />   </td>
		    </tr>
		    <tr>
		        <td align="right"> <span>* </span>终点时间：</td>
		        <td>   <input type="text" name="arriveTime" id="update_arrive_time" /></td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>里程：</td>
		        <td> <input type="text" name="totalDistance" id="update_total_distance" />  </td>
		    </tr>  
		    <tr>
		        <td align="right"><span>* </span>历时：</td>
		        <td> <input type="hidden" name="totalTime" id="update_total_time" />
		        	<input type="text" id="update_hour" style="width:40px;"/> 小时 
		        	<input type="text" id="update_second" style="width:40px;"/> 分
		        </td>  
		    </tr>  
		    <tr>
		        <td align="right"><span>* </span>途经车站：</td>
		        <td>
		        	<input type="hidden" class="" name="stationAll" id="update_way_station"/>
		        	车站 <input type="text" class="" name="" id="station" style="width:60px"/>
		        	到站时间 <input type="text" class="" name="" id="end_time" style="width:60px"/>
		        	发车时间 <input type="text" class="" name="" id="start_time" style="width:60px"/>
		        	停留时间 <input type="text" class="" name="" id="stay_time" style="width:60px"/>
		        	<input type="button" value="添加" id="add_station_button" style="width:40px"/>
		        	
		        </td>
	        </tr>
	        <tr>
	        	<td></td>
	        
		        <td>
			        <table style="width:500px;" align="left" id="update_station_time_table">
					    <tr>
					    	<th>序号</th>
					    	<th>车站名</th>
					    	<th>到站时间</th>
					    	<th>发车时间</th>
					    	<th>停留时间（分钟）</th>
					    	<th>操作</th>
				    	</tr>
				    	<tbody id="update_show_way_station">
				    	</tbody>
			    	</table>
		        </td> 
	        </tr>    
	    </table>
    </form>
</div>
<div id="show_route">
	<table style="width:300px;" align="center" id="station_time_table" cellspacing="0" border="1" bordercolor="#fff";>
    	<tr align="center">
	    	<td>序号</td>
	    	<td>车站名</td>
	    	<td>到站时间</td>
	    	<td>发车时间</td>
	    	<td>停留时间（分钟）</td>
    	</tr>
    	<tbody id="show_way_station2">
    	</tbody>
   	</table>
</div>
  

</body>
</html>
