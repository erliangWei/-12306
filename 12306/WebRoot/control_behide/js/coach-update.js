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
					selectRoute(ele);			
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});
/**************************  获取修改列车信息  **********************************/
function selectCoach(ele){			//获取列车编组信息
	$("#update_coach_code").val(ele.parent().siblings("#coachId").text());
	$("#update_train_code").val(ele.parent().siblings("#coachTrainId").text());
	$("#update_coach_id").val(ele.parent().siblings("#coachNo").text());
	$("#update_site_num").val(ele.parent().siblings("#seat").text());
	$("#update_coach_type").val(ele.parent().siblings("#coachType").text());
	$("#update_site_type").val(ele.parent().siblings("#seatType").text());
//	alert($("#update_coach_code").val());
};

/*************************   修改数据   ********************************/
function updateRoute(){
	if(checkUpadteInfo()){
		$.ajax({			//调用action
             url:"/12306/updateCoach.action",
             data:$("#updateOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
				loadCoachList(1);
             }
        });
	}
	saveUpdatePrompt();
};


/*************************   验证   ********************************/
function checkUpadteInfo(id){
	if($("#update_train_code").val()==""){		//车次代码不能为空
		alert("车次代码不能为空！");
		return false;
	}
	else if($("#update_coach_id").val()==""){		//车厢号不能为空
		alert("车厢号不能为空！");
		return false;
	}
	else if($("#update_site_type").val()==""){		//车厢坐席类型不能为空
		alert("车厢坐席类型不能为空！");
		return false;
	}
	else if($("#update_site_num").val()==""){		//车型坐席数量不能为空
		alert("车型坐席数量不能为空！");
		return false;
	}
	else if($("#update_coach_type").val()==""){		//车厢类型不能为空
		alert("车厢类型不能为空！");
		return false;
	}else{
		return true;
	}
};
/*************************   提示   ********************************/
function saveUpdatePrompt(){		//保存并退出
	var r = confirm("保存成功\n是否退出本操作");
	if(r){
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