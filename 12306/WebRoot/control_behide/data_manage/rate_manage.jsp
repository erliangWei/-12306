<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>票价率管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css"></style>
	<link href="../css/behide_common.css" rel="stylesheet" />
	
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script src="../../control_behide/js/rate-manage.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/table-CSS.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/rate-add.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/rate-delete.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/rate-update.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/rate-list-load.js" type="text/javascript" ></script>
	<script src="../../control_behide/js/clear-text.js" type="text/javascript" ></script>
	<script type="text/javascript">
	$(document).ready(function(){
		loadRateList(1);	
			
	});	
</script>

</head>
  
<body>
	<div id="container">
	    <div class="title"> <p>票价率管理</p>
	    </div>
	    <table id="search" align="center">
	        <tr>
	        	<td class="opera"><input type="button" value="添加" id="add" ></td>
	        	<td class="opera"><input type="button" value="删除" id="delete" ></td>
	            <td class="opera"><input type="button" value="修改" id="update" ></td>
	            <td align="right">
	            	<input type="text" placeholder="请输相关信息">
	            	<input type="button" value="查询" id="search_but" ></td>
	        </tr>
	    </table>
		
		<div id="list">
			<table align="center" cellspacing="0" id="rate_list">
			    <tr align="center" height="25px" style="background:url(../img/title_bg.gif)">
			    	<th>
			        	<input type="checkbox" name="select" id="check_all" >
			        </th>
			        <th>序号</th>
			        <th>票价率编号</th>
			        <th>票种</th>
			        <th>票价率</th>
			        <th>比例</th>
			    </tr>
			   	<tbody id="rate_info_list">
			   	</tbody>
			</table>
		</div>
		<div id="page">
		</div>
	</div>
	<div id="add_board">
		<div class="title"> <p>添加票价率信息</p>
	    </div>
	    <div id="prompt"><span>* 为必填项</span></div>
	    <div id="add_opera">
	        <input type="button" onclick="addRate(this.id)" id="add_save_next" value="保存并添加下一条记录" />
	        <input type="button" onclick="addRate(this.id)" id="add_save_exit" value="保存退出"/>
	        <input type="button" onclick="cancelExitPrompt()" id="add_cancel_exit" value="取消退出"/>
	    </div>
	    <hr />
	    <form id="addOperator" name="addOperator" action="#" method="post">
		    <table align="center">
			    <tr>     
			        <td  align="right"><span>* </span>票种：</td>
			        <td> <select id="add_ticket_type" name = "ticketType">
			        	<option value="学生票">学生票</option>
			        	<option value="普通票">普通票</option>
			        </select> </td>
			    </tr>
			    <tr>
			        <td align="right"><span>* </span>票价率：  </td>
			        <td><input type="text" id="add_ticket_rate" name="ticketRate"/>   </td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>比例：</td>
			        <td><input type="text" id="add_ticket_ratio" name="ratIO"/></td>
			    </tr>
		    </table>
	    </form>
	</div>

	<div id="update_board">
		<div class="title"> <p>修改票价率信息</p>
	    </div>
	    <div id="prompt"><span>* 为必填项</span></div>
	    <div id="add_opera">
	        <input type="button" onclick="updateRate()" id="update_save_exit" value="保存退出"/>
	        <input type="button" onclick="exitUpdatePrompt()" id="update_cancel_exit" value="取消退出"/>
	    </div>
	    <hr />
	    <form id="updateOperator" name="updateOperator" action="#" method="post">
			<input type="hidden" id="update_rate_id" name="rateId"/>
		    <table align="center">
				    <tr>     
				        <td  align="right"><span>* </span>票种：</td>
				        <td> <select id="update_ticket_type" name = "ticketType">
				        	<option value="学生票">学生票</option>
				        	<option value="普通票">普通票</option>
				        </select> </td>
				    </tr>
				    <tr>
				        <td align="right"><span>* </span>票价率：  </td>
				        <td><input type="text" id="update_ticket_rate" name="ticketRate"/>   </td>
				    </tr>
				    <tr>
				        <td align="right"> <span>* </span>比例：</td>
				        <td><input type="text" id="update_ticket_ratio" name="ratIO"/></td>
				    </tr>
		    </table>
		 </form>
	</div>
    
  </body>
</html>
