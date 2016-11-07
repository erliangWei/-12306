<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>车站管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css"><link href="/12306/WebRoot/control_behide/css/behide_common.css" rel="stylesheet" />
	-->
	<script type="text/javascript"  src="../js/comm.js"></script>
	<script type="text/javascript" src="../js/linkagesel-min.js"></script>
	<script type="text/javascript" src="../js/district-all.js"></script>
	<script type="text/javascript" src="../js/district-level1.js"></script>	
	<script type="text/javascript" src="../js/district-level2.js"></script>	
	<script type="text/javascript" src="../js/linkagesel.js"></script>	<!-- 下拉菜单相关js -->
	 
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<!--	相邻车站	-->
	<script src="../../control_behide/js/station-next.js" type="text/javascript" ></script>
	<!--	加载车站列表-->
	<script src="../../control_behide/js/station-list-load.js" type="text/javascript" ></script>
	<!--	添加车站-->
	<script src="../../control_behide/js/station-add.js" type="text/javascript" ></script>
	<!--	删除车站-->
	<script src="../../control_behide/js/station-delete.js" type="text/javascript" ></script>
	<!--	修改车站-->
	<script src="../../control_behide/js/station-update.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/table-CSS.js" type="text/javascript" ></script>
		<script src="../../control_behide/js/clear-text.js" type="text/javascript"></script>
	<!--	通用CSS-->
	<link href="../../control_behide/css/behide_common.css" rel="stylesheet" />
	
<style type="text/css">
.add_next_station,.update_next_station {width:100px; margin-right:5px;}
#show_next_station{ width:200px; font-size:13px; z-index:9999;position:absolute;}
#show_next_station table tr td{border:1px solid #fff; color:#fff; }
#show_next_station table{ background-color:#666;}

</style>
<script type="text/javascript">
	//var addr='';		//获取页面地址
	$(document).ready(function (){
						//车站列表分页
		loadList();			//车站类表
		
	});

</script>
  </head>
  <body>
    <div id="container">
    <div class="title"> <p>车站管理</p>
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
		        <th>车站代码</th>
		        <th>车站名</th>
		        <th>拼音码</th>
		        <th>所属铁路局</th>
		        <th>车站等级</th>
		        <th>相邻车站</th>
		        <th>所属行政区域</th>
		        <th>所在地址</th>
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
	<div class="title"> <p>添加车站信息</p>
    </div>
    <div id="prompt"><span>* 为必填项</span></div>
 	
    <div id="add_opera">		
        <input type="button" id="add_save_next" onclick="addStation(this.id)" value="保存并添加下一条记录" />
        <input type="button" id="add_save_exit"  onclick="addStation(this.id);" value="保存退出"/>
        <input type="button" id="add_cancel_exit" onclick="cancelExitPrompt();" value="取消退出"/>
    </div>
    <hr />
  	<form id="addOperator" name="addOperator" action="#" method="post">
    <table align="center">
    <tr>
        <td  align="right"><span>* </span>车站名：</td>
        <td> <input type="text" name="asVO.addStationName" id="add_station_name"  /> </td>
    </tr>
    
    <tr>
        <td align="right"><span>* </span>拼音码：  </td>
        <td><input type="text" name="asVO.addStationNamepy" id="add_station_namePY" />   </td>
    </tr>
    <tr>
    <!-- <input type="text" name="addStationDept" id="add_station_dept" /> -->
        <td align="right"> 所属铁路局：  </td>
        <td>
        	<select class="dept_select" name="asVO.addStationDept"></select>
        </td>
    </tr>
    <tr>
        <td align="right">车站等级：   </td>
        <td>
        <select name="asVO.addStationLevel" >
        	<option value="1">1</option>
        	<option value="2">2</option>
        	<option value="3">3</option>
        	<option value="4">4</option>
        	<option value="5">5</option>
        </select></td>
        <!-- <td> <input type="text" name="addStationLevel" id="add_station_level" />  </td> -->
    </tr>
    <tr>
        <td align="right"> 所属行政区域：  </td>
        <td> 
        	<select class="province_select" name="asVO.addStationPolicyDept"></select>
        </td>  
    </tr>
    <tr>
        <td align="right">所在地址：</td>
         <td>
         <input type="hidden" id="add_station_address" name="asVO.addStationAddress"/> 
        	<select class="addressSelect"></select>
         </td>  
    </tr>
   				  <!--
    <tr>
        <td align="right" valign="top"><span>* </span>相邻车站：   </td>
        <td> <input type="text" class="add_next_station"/><button class="add_station">继续添加</button> </td>    
    </tr> -->
    </table>
    </form>
</div>

<div id="update_board">
	<div class="title"> <p>修改车站信息</p>			  
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
        <td  align="right"><span>* </span>车站名：</td>
        <td> <input type="text" name="usVO.updateStationName" id="update_station_name"  /> </td>
    </tr>
    
    <tr>
        <td align="right"><span>* </span>拼音码：  </td>
        <td><input type="text" name="usVO.updateStationNamePY" id="update_station_namepy" />   </td>
    </tr>
    <tr>
    	<td align="right"> 所属铁路局：  </td>
    	<td>
	       	<select class="dept_select" name="usVO.updateStationDept" id="update_station_dept"></select>
        </td>
        <!-- <td align="right"> 所属铁路局：  </td>
        <td>   <input type="text" name="updateStationDept" id="update_station_dept" /></td> -->
    </tr>
    <tr>
        <td align="right">车站等级：   </td>
        <td> <select name="usVO.updateStationLevel" id="update_station_level">
        	<option value="1">1</option>
        	<option value="2">2</option>
        	<option value="3">3</option>
        	<option value="4">4</option>
        	<option value="5">5</option>
        </select></td>
    </tr>
    <tr>
        <td align="right"> 所属行政区域：  </td>
        <td> 
       		<select class="province_select" name="usVO.updateStationProvinceDept" id="update_station_policy_dept"></select>
        </td> 
    </tr>
    <tr>
   		 <td align="right">所在地址：</td>
         <td> 
        	 <input type="hidden" name="usVO.updateAddress" id="update_station_address"/>    
        	<select class = "updateAddress "></select>
         </td> 

    		  <!--
     <tr>
        <td align="right" valign="top" ><span>* </span>相邻车站：   </td>
        <td> <input type="text" class="update_next_station"/><button class="add_station">继续添加</button> </td>    
    </tr>
    		  -->
    </table>
    </form>
</div>

<div id="show_next_station">
	<table cellspacing="0">
    	<tr align="center">
        	<td>车站代码</td>
            <td>车站名</td>
            <td>距离/km</td>
        </tr>
        <tr align="center">
        	<td>rrrr</td>
            <td>rrr</td>
            <td>rrrr</td>
        </tr>
        <tr align="center">
        	<td>rrrr</td>
            <td>rrr</td>
            <td>rrrr</td>
        </tr>
    </table>
</div>

  </body>
</html>
