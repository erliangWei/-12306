<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>列车管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
<!--<script src="../js/behide_common.js" type="text/javascript"></script>-->
<script src="../js/train-add.js" type="text/javascript"></script>
<script src="../js/train-list-load.js" type="text/javascript"></script>
<script src="../js/clear-text.js" type="text/javascript"></script>
<script src="../js/train-update.js" type="text/javascript"></script>
<script src="../js/train-delete.js" type="text/javascript"></script>

<script src="../js/table-CSS.js" type="text/javascript"></script>
	

<link href="../css/behide_common.css" rel="stylesheet" />
<style type="text/css">
	#search_py{width:150px; background-color:yellow; border:1px solid #333;position:absolute;}
	#search_py p{padding:3px 10px;}
</style>
<script type="text/javascript">
	
$(document).ready(function() {
	loadTrainList(1);
	$("#search_py").hide();
	
});
	

</script>
</head>
  
<body>
<div id="container">
    <div class="title"> <p>e列车管理</p>
    </div>
    <table id="search" align="center">
        <tr>
        	<td class="opera"><input type="button" value="添加" id="add" ></td>
        	<td class="opera"><input type="button" value="删除" id="delete" ></td>
            <td class="opera"><input type="button" value="修改" id="update" ></td>
            <td align="right">
                <input type="text" placeholder="请输入车次">
            	<input type="button" value="查询" id="search_but" ></td>
        </tr>
    </table>

<div id="list">
    <table align="center" cellspacing="0" id = "train_list">
     <tr align="center" style="background:url(../img/title_bg.gif)">
    	<th>
        	<input type="checkbox" name="select" id="check_all">
        </th>
        <th>序号</th>
        <th>车次代码</th>
        <th>列车类型</th>
        <th>车辆车体分类</th>
        <th>始发站</th>
        <th>终点站</th>
        <th>里程</th>
        <th>始发时间</th>
        <th>终到时间</th>
        <th>历时</th>
        <th>无座票数量</th>
    </tr>
    <tbody id="train_info_list">
    </tbody>
    </table>
</div>
<div id="page">
</div>
</div>
<div id="add_board">
	<div class="title"> <p>添加列车信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
    <div id="add_opera">
  		<input type="button" id="add_save_next" onclick="addTrain(this.id)" value="保存并添加下一条记录" />
        <input type="button" id="add_save_exit"  onclick="addTrain(this.id);" value="保存退出"/>
        <input type="button" id="add_cancel_exit" onclick="cancelExitPrompt();" value="取消退出"/>     
    </div>
    <hr />
    <form id="addOperator" name="addOperator" action="#" method="post">
	    <table align="center">
		    <tr>
		        <td  align="right"><span>* </span>列车代码：</td>
		        <td> 
		        	<input type="text" name="trainCode" id="add_train_code"  />
		        	 <input type="hidden" name="trainId" id="add_train_id"  />
		        	 </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>列车类型：</td>
		        <td>
			        <select name="trainType" id="add_trainType">
			        	<option value="高铁">高铁</option>
			        	<option value="特快">特快</option>
			        	<option value="普快">普快</option>
			        </select>
			     </td>
		 	</tr>
		    <tr>
		        <td align="right"><span>* </span>车辆车体分类：   </td>
		        <td> 
		        	<select name="trainBody" id="add_trainBody">
			        	<option value="有空调">有空调</option>
			        	<option value="无空调">无空调</option>
			        </select>
				</td>
		    </tr>
		    <tr>
		        <td  align="right"><span>* </span>始发站：</td>
		        <td> 
		        	<select name = "statrStation" id="add_first_station">
		        	
		        	</select>
		    </tr>
		    
		    <tr>
		        <td align="right"><span>* </span>终点站：  </td>
		        <td><input type="text" name="endStation" id="add_final_station" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>始发时间：  </td>
		        <td><input type="text" name="startTime" id="add_start_time" /></td>
		    </tr>
		    <tr>
		        <td align="right"> 终到时间：  </td>
		        <td><input type="text" name="endTime" id="add_end_time"/> </td>
		    </tr>
		    <tr>
		        <td align="right">历时：   </td>
		        <td> <input type="hidden" name="totalTime" id="add_total_time" /> 
		        	<input type="text" id="add_hour" style="width:40px;"/> 小时 
		        	<input type="text" id="add_second" style="width:40px;"/> 分
		        </td>
		    </tr>
		    <tr>
		        <td align="right">里程：   </td>
		        <td> <input type="text" name="totalDistance" id="add_total_distance" />  </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>无座票数量：   </td>
		        <td> <input type="text" name="standTicketNum" id="add_site_count" />  </td>
		    </tr>
	    </table>
    </form>
</div>

<div id="update_board">
	<div class="title"> <p>修改列车信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
    <div id="add_opera">
    	<input type="button" id="update_save_exit" onclick="updateTrain()" value="保存退出"/>
        <input type="button" id="update_cancel_exit" onclick="exitUpdatePrompt()" value="取消退出"/>   
    </div>
    <hr />
   <form id="updateOperator" name="updateOperator" action="#" method="post">
   		<input type="hidden" id="update_trainId" name="trainId"/>
	    <table align="center">
		    <tr>
		        <td align="right"><span>* </span>列车类型：</td>
		        <td>
			        <select name="trainType" id = "update_trainType">
			        	<option value="高铁">高铁</option>
			        	<option value="特快">特快</option>
			        	<option value="普快">普快</option>
			        </select>
			     </td>
		 	</tr>
		    <tr>
		        <td align="right"><span>* </span>车辆车体分类：   </td>
		        <td> 
		        	<select name="trainBody" id="update_trainBoey">
			        	<option value="有空调">有空调</option>
			        	<option value="无空调">无空调</option>
			        </select>
				</td>
		    </tr>
		    <tr>
		        <td  align="right"><span>* </span>始发站：</td>
		        <td> 
		        	<input type="text" name="statrStation" id="update_first_station"  /> </td>
		    </tr>
		    
		    <tr>
		        <td align="right"><span>* </span>终点站：  </td>
		        <td><input type="text" name="endStation" id="update_final_station" />   </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>始发时间：  </td>
		        <td><input type="text" name="startTime" id="update_start_time" /></td>
		    </tr>
		    <tr>
		        <td align="right"> 终到时间：  </td>
		        <td><input type="text" name="endTime" id="update_end_time"/> </td>
		    </tr>
		    <tr>
		        <td align="right">历时：   </td>
		        <td> <input type="hidden" name="totalTime" id="update_total_time" /> 
		        	<input type="text" id="update_hour" style="width:40px;"/> 小时 
		        	<input type="text" id="update_second" style="width:40px;"/> 分
		        </td>
		    </tr>
		    <tr>
		        <td align="right">里程：   </td>
		        <td> <input type="text" name="totalDistance" id="update_total_distance" />  </td>
		    </tr>
		    <tr>
		        <td align="right"><span>* </span>无座票数量：   </td>
		        <td> <input type="text" name="standTicketNum" id="update_site_count" />  </td>
		    </tr>
	    </table>
    </form>
</div>
<div id="search_py">
	
</div>
</body>
</html>
