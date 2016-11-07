<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>计划信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css"><link href="/12306/WebRoot/control_behide/css/behide_common.css" rel="stylesheet" />
	-->
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="../../control_behide/js/plan-list-load.js" type="text/javascript"></script>
	<script src="../../control_behide/js/plan-add.js" type="text/javascript"></script>
	<script src="../../control_behide/js/table-CSS.js" type="text/javascript"></script>
	<script src="../../control_behide/js/plan-update.js" type="text/javascript"></script>
	<script src="../../control_behide/js/plan-delete.js" type="text/javascript"></script>
	<link href="../../control_behide/css/behide_common.css" rel="stylesheet" />
	
<style type="text/css">
#seat_opera_container{width:99%;border:1px solid #09F; border-top-right-radius:6px; border-top-left-radius:6px;}
#base_info{margin-top:15px; margin-left:25px; width:95%; border-bottom:2px dashed #09F}
#base_info p span{font-size:14px; font-weight:bold;color:#000;}
#base_info p #span2,#base_info p #span3{margin-left:20px; }
#base_info p{padding-bottom:10px; font-size:14px; font-weight:bold; }

</style>

<script type="text/javascript">
	$(document).ready(function(){
		loadPlanList(1);	
	});	
</script>
</head>
<body>
    <div id="container">
    <div class="title"> <p>计划信息管理</p>
    </div>
    <table id="search" align="center">
        <tr>
        	<td class="opera"><input type="button" value="添加" id="add" ></td>
        	<td class="opera"><input type="button" value="删除" id="delete"></td>
            <td class="opera"><input type="button" value="修改" id="update" ></td>
            <td align="right">
            	<input type="text" placeholder="站名/拼音码/所属铁路局">
            	<input type="button" value="查询" id="search_but" ></td>
        </tr>
    </table>
	<form action="#" name="stationList" id="station_list_form">
		<div id="list">
		    <table align="center" cellspacing="0" id="plan_list">
			    <tr align="center" style="background:url(../img/title_bg.gif)">
			    	<th>
			        	<input type="checkbox" name="select" id="check_all">
			        </th>
			        <th>序号</th>
			        <th>计划代码</th>
			        <th>车次代码</th>
			        <th>车厢号</th>
			        <th>乘车区间起始站</th>
			        <th>乘车区间终到站</th>
			        <th>发布日期</th>
			        <th>实行日期</th>
			    </tr> 
				<!--	显示车站列表     -->
			   	<tbody id="plan_info_list">
			   	</tbody>
		    </table>
		</div>
		<div id="page">
		</div>
	</form>
</div>
<div id="add_board">
	<div class="title"> <p>添加计划信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
 	
    <div id="add_opera">		
        <input type="button" id="add_save_next" onclick="addPlan(this.id)" value="保存并添加下一条记录" />
        <input type="button" id="add_save_exit"  onclick="addPlan(this.id);" value="保存退出"/>
        <input type="button" id="add_cancel_exit" onclick="cancelExitPrompt();" value="取消退出"/>
    </div>
    <hr />
    <form id="addOperator" name="addOperator" action="#" method="post">
	    <table align="center">
		    <tr>
		        <td  align="right"><span>* </span>车次代码：</td>
		        <td> <input type="text" name="trainId" id="add_train_id"  /> </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>车厢号：  </td>
		        <td><input type="text" name="coachNO" id="add_coach_no" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>乘车区间起始站：  </td>
		       <td><input type="text" name="startStation" id="add_start_station" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>乘车区间终到站：   </td>
		        <td><input type="text" name="endStation" id="add_end_station" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>发布日期：   </td>
		        <td><input type="text" name="publishTime" id="add_publishTime" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>实行日期：   </td>
		        <td><input type="text" name="implementTime" id="add_implementTime" />   </td>
		    </tr>
	    </table>
    </form>
</div>

<div id="update_board">
	<div class="title"> <p>修改计划站信息</p>			  
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
   
    <div id="add_opera">
        <input type="button" id="update_save_exit" onclick="updateRate()" value="保存退出"/>
        <input type="button" id="update_cancel_exit" onclick="exitUpdatePrompt()"  value="取消退出"/>
    </div>
    <hr />
   
    <form id="updateOperator" name="updateOperator" action="#" method="post">
     	<input type="hidden" name="planId" id="update_plan_id" />
	    <table align="center">
		    <tr>
		        <td  align="right"><span>* </span>车次代码：</td>
		        <td> <input type="text" name="trainId" id="update_train_id"  /> </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>车厢号：  </td>
		        <td><input type="text" name="coachNO" id="update_coach_no" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>乘车区间起始站：  </td>
		       <td><input type="text" name="startStation" id="update_start_station" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>乘车区间终到站：   </td>
		        <td><input type="text" name="endStation" id="update_end_station" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>发布日期：   </td>
		        <td><input type="text" name="publishTime" id="update_publishTime" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>实行日期：   </td>
		        <td><input type="text" name="implementTime" id="update_implementTime" />   </td>
		    </tr>
	    </table>
    </form>
</div>


<!--<div id="seat_opera_container">-->
<!--    <div class="title"> <p>席位信息管理</p>-->
<!--    </div>-->
<!--    <div id="base_info">-->
<!--    	<p>	-->
<!--    		<span id="span1">计划代码：</span>-->
<!--	    	<span id="span2">车次代码：</span>-->
<!--	    	<span id="span3">车厢号：</span>-->
<!--    	</p>-->
<!--    </div>-->
<!--    <table id="search" align="center">-->
<!--        <tr>-->
<!--        	<td class="opera"><input type="button" value="添加" id="add" ></td>-->
<!--        	<td class="opera"><input type="button" value="删除" id="delete"></td>-->
<!--            <td class="opera"><input type="button" value="修改" id="update" ></td>-->
<!--            <td align="right">-->
<!--            	<input type="text" placeholder="站名/拼音码/所属铁路局">-->
<!--            	<input type="button" value="查询" id="search_but" ></td>-->
<!--        </tr>-->
<!--    </table>-->
<!--	<form action="#" name="stationList" id="station_list_form">-->
<!--		<div id="list">-->
<!--		    <table align="center" cellspacing="0" id="plan_list">-->
<!--			    <tr align="center" style="background:url(../img/title_bg.gif)">-->
<!--			    	<th>-->
<!--			        	<input type="checkbox" name="select" id="check_all">-->
<!--			        </th>-->
<!--			        <th>序号</th>-->
<!--			        <th>席位发布计划代码</th>-->
<!--			        <th>发布日期</th>-->
<!--			        <th>实行日期</th>-->
<!--			        <th>座位数量</th>-->
<!--			        <th>无座数量</th>-->
<!--			        <th>乘车区间起始站</th>-->
<!--			        <th>乘车区间终到站</th>-->
<!--			        <th>状态</th>-->
<!--			    </tr> -->
<!--			   	<tbody id="plan_info_list">-->
<!--			   	</tbody>-->
<!--		    </table>-->
<!--		</div>-->
<!--		<div id="page">-->
<!--		</div>-->
<!--	</form>-->
<!--</div>-->
<!--<div id="add_board">-->
<!--	<div class="title"> <p>添加计划信息</p>-->
<!--    </div>-->
<!--    <div id="prompt"><span>* 为必填项</span></div>-->
<!-- 	-->
<!--    <div id="add_opera">		-->
<!--        <input type="button" id="add_save_next" onclick="addPlan(this.id)" value="保存并添加下一条记录" />-->
<!--        <input type="button" id="add_save_exit"  onclick="addPlan(this.id);" value="保存退出"/>-->
<!--        <input type="button" id="add_cancel_exit" onclick="cancelExitPrompt();" value="取消退出"/>-->
<!--    </div>-->
<!--    <hr />-->
<!--    <form id="addOperator" name="addOperator" action="#" method="post">-->
<!--	    <table align="center">-->
<!--		    <tr>-->
<!--		        <td  align="right"><span>* </span>车次代码：</td>-->
<!--		        <td> <input type="text" name="trainId" id="add_train_id"  /> </td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		        <td align="right"><span>* </span>车厢号：  </td>-->
<!--		        <td><input type="text" name="coachNO" id="add_coach_no" />   </td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		        <td align="right"><span>* </span>始发站：  </td>-->
<!--		       <td><input type="text" name="startStation" id="add_start_station" />   </td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		        <td align="right"><span>* </span>终点站：   </td>-->
<!--		        <td><input type="text" name="endStation" id="add_end_station" />   </td>-->
<!--		    </tr>-->
<!--	    </table>-->
<!--    </form>-->
<!--</div>-->
<!---->
<!--<div id="update_board">-->
<!--	<div class="title"> <p>修改计划站信息</p>			  -->
<!--    </div>-->
<!--    <div id="prompt"><span>* 为必填项</span></div>-->
<!--   -->
<!--    <div id="add_opera">-->
<!--        <input type="button" id="update_save_exit" onclick="updateRate()" value="保存退出"/>-->
<!--        <input type="button" id="update_cancel_exit" onclick="exitUpdatePrompt()"  value="取消退出"/>-->
<!--    </div>-->
<!--    <hr />-->
<!--   -->
<!--    <form id="updateOperator" name="updateOperator" action="#" method="post">-->
<!--     	<input type="hidden" name="planId" id="update_plan_id" />-->
<!--	    <table align="center">-->
<!--		    <tr>-->
<!--		        <td  align="right"><span>* </span>车次代码：</td>-->
<!--		        <td> <input type="text" name="trainId" id="update_train_id"  /> </td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		        <td align="right"><span>* </span>车厢号：  </td>-->
<!--		        <td><input type="text" name="coachNO" id="update_coach_no" />   </td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		        <td align="right"><span>* </span>始发站：  </td>-->
<!--		       <td><input type="text" name="startStation" id="update_start_station" />   </td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		        <td align="right"><span>* </span>终点站：   </td>-->
<!--		        <td><input type="text" name="endStation" id="update_end_station" />   </td>-->
<!--		    </tr>-->
<!--	    </table>-->
<!--    </form>-->
<!--</div>-->


</body>
</html>
