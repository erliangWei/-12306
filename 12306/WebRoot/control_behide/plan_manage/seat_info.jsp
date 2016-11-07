<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>座位信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css"><link href="/12306/WebRoot/control_behide/css/behide_common.css" rel="stylesheet" />
	-->
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<link href="../../control_behide/css/behide_common.css" rel="stylesheet" />
	
<style type="text/css">
.add_next_station,.update_next_station {width:100px; margin-right:5px;}
#show_next_station{ width:200px; font-size:13px; z-index:9999;position:absolute;}
#show_next_station table tr td{border:1px solid #fff; color:#fff; }
#show_next_station table{ background-color:#666;}

</style>
<script type="text/javascript">
</script>
  </head>
  <body>
    <div id="container">
    <div class="title"> <p>座位信息管理</p>
    </div>
    <table id="search" align="center">
        <tr>
        	<td class="opera"><input type="button" value="添加" id="add" ></td>
        	<td class="opera"><input type="button" value="删除" id="delete" onclick="delete_station()"></td>
            <td class="opera"><input type="button" value="修改" id="update" ></td>
            <td align="right">
            	<input type="text" placeholder="站名/拼音码/所属铁路局">
            	<input type="button" value="查询" id="search_but" ></td>
        </tr>
    </table>
<form action="#" name="stationList" id="station_list_form">
	<div id="list">
	    <table align="center" cellspacing="0" id="station_list">
		    <tr align="center" style="background:url(../img/title_bg.gif)">
		    	<th>
		        	<input type="checkbox" name="select" id="check_all">
		        </th>
		        <th>序号</th>
		        <th>席位代码</th>
		        <th>车次</th>
		        <th>日期</th>
		        <th>车厢号</th>
		        <th>座位号</th>
		        <th>乘车区间起始站</th>
		        <th>乘车区间终到站</th>
		        <th>售票状态</th>
		    </tr> 
			<!--	显示车站列表     -->
		   	<tbody id="station_info_list">
		   	</tbody>
	    </table>
	</div>
<div id="page">
</div>

</form>
</div>
<div id="add_board">
	<div class="title"> <p>添加座位信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
 	<form id="addOperator" name="addOperator" action="#" method="post">
    <div id="add_opera">		
        <input type="button" id="add_save_next" onclick="addStation(this.id)" value="保存并添加下一条记录" />
        <input type="button" id="add_save_exit"  onclick="addStation(this.id);" value="保存退出"/>
        <input type="button" id="add_cancel_exit" onclick="cancelExitPrompt();" value="取消退出"/>
    </div>
    <hr />
   
    <table align="center">
    <tr>
        <td  align="right"><span>* </span>席位代码：</td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>车次：  </td>
        <td><input type="text" name="" id="" />   </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>日期：  </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>车厢号：   </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>座位号：   </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>乘车区间起始站：   </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>乘车区间终到站：</td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>售票状态：</td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    </table>
    </form>
</div>

<div id="update_board">
	<div class="title"> <p>修改座位信息</p>			  
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
    <form id="updateOperator" name="updateOperator" action="#" method="post">
    <div id="add_opera">
        <input type="button" id="update_save_exit" onclick="updateStation(this.id)" value="保存退出"/>
        <input type="button" id="update_cancel_exit" onclick="exitUpdatePrompt()"  value="取消退出"/>
    </div>
    <hr />
    <input type="hidden" name="usVO.udateStationId" id="update_station_id" />
    <table align="center">
    <tr>
        <td  align="right"><span>* </span>席位代码：</td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>车次：  </td>
        <td><input type="text" name="" id="" />   </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>日期：  </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>车厢号：   </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>座位号：   </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>乘车区间起始站：   </td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>乘车区间终到站：</td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    <tr>
        <td align="right"><span>* </span>售票状态：</td>
        <td> <input type="text" name="" id=""  /> </td>
    </tr>
    </table>
    </form>
</div>

  </body>
</html>
