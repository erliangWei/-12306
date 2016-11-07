// $(document).ready(function(){
//	$("#add_board").hide();		//隐藏添加界面
//	$("#add").click(function(){   //打开添加界面
//		$("#container").slideUp();
//		$("#add_board").slideDown();
//	});
//});
/***********************  添加列车编组  **************************/
function addCoach(id){		//添加列车编组数
	if(checkAddInfo(id)){	//校验
		$.ajax({			//调用action
             url:"/12306/addCoach.action",
             data:$("#addOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
				loadCoachList(1);
             }
        }); 
        if(id=="add_save_next")addSavePrompt();	//操作提示
        else if(id=="add_save_exit")exitSavePrompt();//操作提示
	}
};
	
/*****************************添加列车编组信息验证***********************/
function checkAddInfo(id){
	if($("#add_train_code").val()==""){		//车次代码不能为空
		alert("车次代码不能为空！");
		return false;
	}
	else if($("#add_coach_id").val()==""){		//车厢号不能为空
		alert("车厢号不能为空！");
		return false;
	}
	else if($("#add_site_type").val()==""){		//车厢坐席类型不能为空
		alert("车厢坐席类型不能为空！");
		return false;
	}
	else if($("#add_site_num").val()==""){		//车型坐席数量不能为空
		alert("车型坐席数量不能为空！");
		return false;
	}
	else if($("#add_coach_type").val()==""){		//车厢类型不能为空
		alert("车厢类型不能为空！");
		return false;
	}else{
		return true;
	}
	return true;
};


/*****************************添加列车编组信息提示***********************/
function addSavePrompt(){		//保存并添加下一条记录
	var r = confirm("保存成功\n选择“确定”继续添加记录，选择“取消”退出添加记录操作")
	if(r)
		clear_text();
	else{
		var rr=	confirm("确定退出！")
		if(rr){
			$("#container").slideDown();
			$("#add_board").slideUp();
			clear_text();
			
		}
		else if(rr!=true)
			clear_text();
	}
}
function exitSavePrompt(){		//保存并退出
	var r = confirm("保存成功\n是否退出本操作");
	if(r){
		$("#container").slideDown();
		$("#add_board").slideUp();
		clear_text();
	}
	else
		clear_text();
	loadRouteList(1);
}
function cancelExitPrompt(){    //取消退出   
	var r = confirm("是否放弃本次操作");
	if(r){
		$("#container").slideDown();
		$("#add_board").slideUp();
		clear_text();
	}
}