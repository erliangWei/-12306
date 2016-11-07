/**************************************修改操作****************************/
$(document).ready(function(){
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
					selectTrain(ele);			//查询车站函数
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});
/**************************  获取修改列车信息  **********************************/
function selectTrain(ele){			//获取修改车站信息
	var time = ele.parent().siblings("#totalTime").text();
	/*时间分割*/
	time = time.replace("分钟","小时");
	time = time.split("小时");
	$("#update_hour").val(time[0]);
	$("#update_second").val(time[1]);
	
	
	$("#update_trainType").val(ele.parent().siblings("#trainType").text());
	$("#update_trainBoey").val(ele.parent().siblings("#trainBody").text());
	$("#update_first_station").val(ele.parent().siblings("#startStation").text());
	$("#update_final_station").val(ele.parent().siblings("#endStation").text());
	$("#update_total_distance").val(ele.parent().siblings("#totalDistance").text());
	$("#update_start_time").val(ele.parent().siblings("#startTime").text());
	$("#update_end_time").val(ele.parent().siblings("#endTime").text());
	$("#update_trainId").val(ele.parent().siblings("#trainId").text());
//	$("#update_total_time").val(ele.parent().siblings("#totalTime").text());
	$("#update_site_count").val(ele.parent().siblings("#standTicketNum").text());
	
	//	alert(ele.parent().siblings("#stationDept").text());
//	alert($("#update_trainType").val());
//	alert($("#update_trainBoey").val());
//	alert($("#update_first_station").val());
//	alert($("#update_final_station").val());
//	alert($("#update_total_distance").val());
//	alert($("#update_start_time").val());
//	alert($("#update_end_time").val());
//	alert($("#update_total_time").val());
//	alert($("#update_site_count").val());

};

/*************************   修改数据   ********************************/
function updateTrain(){
	
	var time = $("#update_hour").val() + "小时" + $("#update_second").val() + "分钟";
	$("#update_total_time").val(time);
//	alert($("#update_total_time").val());
	if(checkUpdateInfo()){
		$.ajax({			//调用action
             url:"/12306/updateTrain.action",
             data:$("#updateOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
             }
        });
	}
	saveUpdatePrompt();
};


/*************************   验证   ********************************/
function checkUpdateInfo(id){
	//验证信息———列车修改
		if($("#update_train_type").val()==""){		//验证列车类型不能为空
			alert("列车类型不能为空！");
			return false;
		}
		else if($("#update_train_body_type").val()==""){		//验证列车车体不能为空
			alert("车辆车体分类不能为空！");
			return false;
		}
		else if($("#update_first_station").val()==""){		//验证列车始发站不能为空
			alert("始发站不能为空！");
			return false;
		}
		else if($("#update_leave_time").val()==""){		//验证列车始发时间不能为空
			alert("始发时间不能为空！");
			return false;
		}	
		else if($("#update_final_station").val()==""){		//验证列车终点站不能为空
			alert("终点站不能为空！");
			return false;
		}
		else if($("#update_site_count").val()==""){		//验证列车无座票数量不能为空
			alert("无座票数量不能为空！");
			return false;
		}else 
			return true;
	}

/*************************   提示   ********************************/
function saveUpdatePrompt(){		//保存并退出
	var r = confirm("保存成功\n是否退出本操作");
	if(r){
		/*********  刷新列表 ************/
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
		loadTrainList(1);
	}
//	else
	
}

function exitUpdatePrompt(){    //退出修改
	var r = confirm("是否放弃本次操作");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
}