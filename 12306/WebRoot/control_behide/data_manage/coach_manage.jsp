<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>列车编组管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="../css/behide_common.css" rel="stylesheet" />
	<script src="../../control_behide/js/table-CSS.js" type="text/javascript"></script>
	<script src="../../control_behide/js/coach-list-load.js" type="text/javascript"></script>
	<script src="../../control_behide/js/coach-add.js" type="text/javascript"></script>
	<script src="../../control_behide/js/coach-delete.js" type="text/javascript"></script>
	<script src="../../control_behide/js/coach-update.js" type="text/javascript"></script>
	<script src="../../control_behide/js/clear-text.js" type="text/javascript"></script>
	<script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>

	
	<script type="text/javascript">

	$(document).ready(function() {
	//loadCoachList(1);
		$("#add_board").hide();
		$("#add").click(function(){   //打开添加界面
			$("#container").slideUp();
			$("#add_board").slideDown();
		});
		loadCoachList(1);
		
		$("#delete").click(function(){
			var mun=$(".check_single").length;			//获取车站列表总行数
			var m=0;									//要删除的记录为0
			for(var i=0;i<mun;i+=1){					//遍历列表行数，查询删除总行数
				var flag=$(".check_single").eq(i).prop("checked");
				if(flag==true){
					m+=1;
				}
			}
			var r;
			if(m==0)							//判断删除行数是否为0
				alert("未选中要删除的记录！");
			else
				r=confirm("是否删除选中的"+m+"条记录！")
				if(r){
					deleteCoach();
				} 
		});
		
		$("#update_board").hide();		//隐藏修改界面
		$("#update").click(function(){ 	//打开修改界面
			var mun=$(".check_single").length;	
			var ele;				//获取选中行
			var m = 0;
			for(var i=0;i<mun;i+=1){
				var flag = $(".check_single").eq(i).prop("checked");		//获取列表check属性
				if(flag==true){
					ele = $(".check_single").eq(i);					//获取列表check属性为“true”的元素
					m+=1;
				}
			}		
			if(m==0)
				alert("未选中修改记录");
			else if(m>1)
				alert("本操作只能修改一条记录");
				else{
					selectCoach(ele);			
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
		});

	});
		
	
	
	
</script>

  </head>
  
<body>
    <div id="container">
	    <div class="title"> <p>列车编组管理</p>
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
		    <table align="center" cellspacing="0" id = "coach_list">
		       <tr align="center" height="25px" style="background:url(../img/title_bg.gif)">
		            <th>
		                <input type="checkbox" name="select" id="check_all">
		            </th>
		            <th>序号</th>
		            <th>列车编组编号</th>
		            <th>车次代码</th>
		            <th>车厢号</th>
		            <th>车厢类型</th>
		            <th>车厢坐席类型</th>
		            <th>车厢坐席数量</th>
		 	    </tr>
				<tbody id="coach_info_list">
		   		</tbody>
		    </table>
		</div>
		<div id="page">
		</div>
	</div>
	<div id="add_board">
		<div class="title"> <p>添加列车编组信息</p>
	    </div>
	    <div id="prompt"><span>* 为必填项</span></div>
	    
	    <div id="add_opera">
	        <input type="button" onclick="addCoach(this.id)" id="add_save_next" value="保存并添加下一条记录" />
	        <input type="button" onclick="addCoach(this.id)" id="add_save_exit" value="保存退出"/>
	        <input type="button" onclick="cancelExitPrompt()" id="add_cancel_exit" value="取消退出"/>
	    </div>
	    <hr />
	    <form id="addOperator" name="addOperator" action="#" method="post">
		    <table align="center">
			    <tr>
			        <td  align="right"><span>* </span>车次代码：</td>
			        <td> <input type="text" name="coachTrainId" id="add_train_code"  /> </td>
			    </tr>
			    
			    <tr>
			        <td align="right"><span>* </span>车厢号：  </td>
			        <td><input type="text" name="coachNo" id="add_coach_id" />   </td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>车厢类型：</td>
			        <td><select name="coachType" id="add_coach_type">
			        	<option value="硬座车">硬座车</option>
			        	<option value="软座车">软座车</option>
			        	<option value="硬卧车">硬卧车</option>
			        	<option value="软卧车">软卧车</option>
			        	<option value="餐车">餐车</option>
			        </select></td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>车厢坐席类型：</td>
			        <td><select name="seatType" id="add_site_type">
			        	<option value="硬座">硬座</option>
			        	<option value="软座">软座</option>
			        	<option value="硬卧">硬卧</option>
			        	<option value="软卧">软卧</option>
			        </select></td>
			    </tr>
			     <tr>
			        <td align="right"> <span>* </span>车型坐席数量：</td>
			        <td><input type="text" name="seat" id="add_site_num" /></td>
			    </tr> 
		    </table>
	    </form>
	</div>

	<div id="update_board">
		<div class="title"> <p>修改列车编组信息</p>
	    </div>
	    <div id="prompt"><span>* 为必填项</span></div>
	    <div id="add_opera">
	        <input type="button" onclick="updateRoute()" id="update_save_exit" value="保存退出"/>
	        <input type="button" onclick="exitUpdatePrompt()" id="update_cancel_exit" value="取消退出"/>
	    </div>
	    <hr />
	    <form id="updateOperator" name="updateOperator" action="#" method="post">
	    	<input type="hidden" name="coachId" id="update_coach_code"  />
		    <table align="center">
			    <tr>
			        <td  align="right"><span>* </span>车次代码：</td>
			        <td> <input type="text" name="coachTrainId" id="update_train_code"  /> </td>
			    </tr>
			    
			    <tr>
			        <td align="right"><span>* </span>车厢号：  </td>
			        <td><input type="text" name="coachNo" id="update_coach_id" />   </td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>车厢类型：</td>
			        <td><select name="coachType" id="update_coach_type">
			        	<option value="硬座车">硬座车</option>
			        	<option value="软座车">软座车</option>
			        	<option value="硬卧车">硬卧车</option>
			        	<option value="软卧车">软卧车</option>
			        	<option value="餐车">餐车</option>
			        </select></td>
			    </tr>
			    <tr>
			        <td align="right"> <span>* </span>车厢坐席类型：</td>
			        <td><select name="seatType" id="update_site_type">
			        	<option value="硬座">硬座</option>
			        	<option value="软座">软座</option>
			        	<option value="硬卧">硬卧</option>
			        	<option value="软卧">软卧</option>
			        </select></td>
			    </tr>
			     <tr>
			        <td align="right"> <span>* </span>车型坐席数量：</td>
			        <td><input type="text" name="seat" id="update_site_num" /></td>
			    </tr> 
		    </table>
	    </form>
	</div>
  </body>
</html>
