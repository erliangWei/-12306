
$(document).ready(function(){
	$("#add_board").hide();		//隐藏添加界面
	$("#add").click(function(){   //打开添加界面
		//province01();
		$("#container").slideUp();
		$("#add_board").slideDown();
	});
});

/***********************  添加  **************************/
function addRate(id){		
	if(checkAddInfo()){	//校验
		$.ajax({			//调用action
             url:"/12306/addRate.action",
             data:$("#addOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
			alert(0);
			loadRateList(1);
             }
        }); 
		
        if(id=="add_save_next")addSavePrompt();	//操作提示
        else if(id=="add_save_exit")exitSavePrompt();//操作提示
	}
};
		
/*****************************添加车站信息验证***********************/
function checkAddInfo(){
	if($("#add_ticket_type").val()==""){		//票种不能为空
		alert("票种不能为空！");
		return false;
	}
	else if($("#add_ticket_rate").val()==""){		//票价率不能为空
		alert("票价率不能为空！");
		return false;
	}
	else if($("#add_ticket_ratio").val()==""){		//比例不能为空
		alert("比例不能为空！");
		return false;
	}else{
			return true;
	}
};


/*****************************添加车站信息提示***********************/
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
}
function cancelExitPrompt(){    //取消退出   
	var r = confirm("是否放弃本次操作");
	if(r){
		$("#container").slideDown();
		$("#add_board").slideUp();
		clear_text();
	}
}