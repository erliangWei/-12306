<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    
    <title>票价旅程区段管理</title>
    
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
	<script src="../../control_behide/js/zone-list-load.js" type="text/javascript"></script>
	<script src="../../control_behide/js/zone-add.js" type="text/javascript"></script>
	<script src="../../control_behide/js/zone-update.js" type="text/javascript"></script>
	<script src="../../control_behide/js/zone-delete.js" type="text/javascript"></script>
	<script src="../../control_behide/js/table-CSS.js" type="text/javascript"></script>
		<script src="../../control_behide/js/clear-text.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	//alert(0);
	//getZoneList(1);
		loadZoneList(1);
		
	});
	
	
	</script>

</head>
  
<body>
	<div id="container">
	    <div class="title"> <p>票价旅程区段管理</p>
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
		    <table align="center" cellspacing="0" id="zone_list">
		       <tr align="center" height="25px" style="background:url(../img/title_bg.gif)">
		            <td>
		                <input type="checkbox" name="select" id="check_all">
		            </td>
		            <th>序号</th>
		            <th>旅程区段编号</th>
		            <th>里程区段（起点）</th>
		            <th>里程区段（终点）</th>
		            <th>每区段里程</th>
		            <th>区段数</th>
		       </tr>
		       <tbody id="zone_info_list">
		       </tbody>
		    </table>
		</div>
		<div id="page">
		</div>
	</div>
	<div id="add_board">
		<div class="title"> <p>添加票价旅程区段信息</p>
	    </div>
	    <div id="prompt"><span>* 为必填项</span></div>
	    <div id="add_opera">
	        <input type="button" onclick="addZone(this.id)" id="add_save_next" value="保存并添加下一条记录" />
	        <input type="button" onclick="addZone(this.id)" id="add_save_exit" value="保存退出"/>
	        <input type="button" onclick="cancelExitPrompt()" id="add_cancel_exit" value="取消退出"/>
	    </div>
	    <hr />
	    <form id="addOperator" name="addOperator" action="#" method="post">
		    <table align="center">
			    <tr>
			        <td  align="right"><span>* </span>里程区段（起点）：</td>
			        <td> <input type="text" name="zoneFrom" id="add_road_start"  /> </td>
			    </tr>
			    <tr>
			        <td align="right"><span>* </span>里程区段（终点）：  </td>
			        <td><input type="text" name="zoneTo" id="add_road_end" />   </td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>每区段里程：</td>
			        <td>   <input type="text" name="zoneDistance" id="add_road_long" /></td>
			    </tr>
			     <tr>
			        <td align="right"> <span>* </span>区段数：</td>
			        <td>   <input type="text" name="zoneAmount" id="add_roat_num" /></td>
			    </tr>
		    </table>
	    </form>
	</div>

	<div id="update_board">
		<div class="title"> <p>修改票价旅程区段信息</p>
	    </div>
	    <div id="prompt"><span>* 为必填项</span></div>
	    <div id="add_opera">
			<input type="button" onclick="updateZone()" id="update_save_exit" value="保存退出"/>
	        <input type="button" onclick="exitUpdatePrompt()" id="update_cancel_exit" value="取消退出"/>
	    </div>
	    <hr />
	    <form id="updateOperator" name="updateOperator" action="#" method="post">
			<input type="hidden" name="zoneId" id="update_zone_id"  /> </td>
		    <table align="center">
			    <tr>
			        <td  align="right"><span>* </span>里程区段（起点）：</td>
			        <td> <input type="text" name="zoneFrom" id="update_road_start"  /> </td>
			    </tr>
			    <tr>
			        <td align="right"><span>* </span>里程区段（终点）：  </td>
			        <td><input type="text" name="zoneTo" id="update_road_end" />   </td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>每区段里程：</td>
			        <td>   <input type="text" name="zoneDistance" id="update_road_long" /></td>
			    </tr>
			     <tr>
			        <td align="right"> <span>* </span>区段数：</td>
			        <td>   <input type="text" name="zoneAmount" id="update_roat_num" /></td>
			    </tr>
		    </table>
  		</form>
	</div>

  </body>
</html>
