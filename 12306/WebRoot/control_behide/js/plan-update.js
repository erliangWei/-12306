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
					selectPlan(ele);			//查询车站函数
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});
/**************************  获取修改列车信息  **********************************/
function selectPlan(ele){			//获取修改车站信息
	alert(ele.parent().siblings("#publishTime").text());
	$("#update_plan_id").val(ele.parent().siblings("#planId").text());
	$("#update_train_id").val(ele.parent().siblings("#trainId").text());
	$("#update_coach_no").val(ele.parent().siblings("#coachNO").text());
	$("#update_start_station").val(ele.parent().siblings("#startStation").text());
	$("#update_end_station").val(ele.parent().siblings("#endStation").text());
	$("#update_publishTime").val(ele.parent().siblings("#publishTime").text());
	$("#update_implementTime").val(ele.parent().siblings("#implementTime").text());
};

/*************************   修改数据   ********************************/
function updateRate(){
	if(checkUpadteInfo()){
		$.ajax({			//调用action
             url:"/12306/updatePlan.action",
             data:$("#updateOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
				loadPlanList(1);
             }
        });
	}
	saveUpdatePrompt();
};

/*************************   验证   ********************************/
function checkUpadteInfo(id){
	if($("#update_train_id").val()==""){		//票种不能为空
		alert("车次代码不能为空！");
		return false;
	}
	else if($("#update_coach_no").val()==""){		//票价率不能为空
		alert("车厢号不能为空！");
		return false;s
	}
	else if($("#update_start_station").val()==""){		//比例不能为空
		alert("始发站不能为空！");
		return false;
	}else if($("#update_end_station").val()==""){		//比例不能为空
		alert("终点站不能为空！");
		return false;
	}else{
		return true;
	}
};
/*************************   提示   ********************************/
function saveUpdatePrompt(){		//保存并退出
	var r = confirm("保存成功\n是否退出本操作");
	if(r){
		/*********  刷新列表 ************/
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
}

function exitUpdatePrompt(){    //退出修改
	var r = confirm("是否放弃本次操作");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
}