
$(document).ready(function(){
	$("#add_board").hide();		//隐藏添加界面
	$("#add").click(function(){   //打开添加界面
		//province01();
		$("#container").slideUp();
		$("#add_board").slideDown();
	});
	var i=1
	var st = '';
	$("#station_time_table").css("width","400px");
	$("#station_time_table").hide();
	$("#add_station_button").click(function(){
	//	alert($("#station").val());
		
		var station = $('#station').val();
		var time = $('#stay_time').val();
		var stime = $('#start_time').val();
		var etime = $('#end_time').val();
		if( station =='' || time =='' || stime =='' || etime==''){
			alert("请输入完整信息");
		}else{
				$("#station_time_table").show();
				$("#show_way_station").append("<tr align='center'><td>"+ i++ +"</td><td>"
					+ station +"</td><td>"+ etime +"</td><td>"
					+ stime +"</td><td>"+ time +"</td></tr>"
				);
				$('#station').val('');
				$('#stay_time').val('');
				$('#start_time').val('');
				$('#end_time').val('');
				st += station+'$'+etime+'$'+stime+'$'+time+';';
			}
		$("#way_station").val(st);
		//alert($("#way_station").val());
	});
});

/***********************  添加车站  **************************/
function addRoute(id){		//添加车站数
	var time;
	time=$("#add_hour").val()+"小时"+$("#add_second").val()+"分钟";
	$("#add_total_time").val(time);
	//alert($("#add_total_time").val());
	if(checkAddInfo(id)){	//校验
		$.ajax({			//调用action
             url:"/12306/addRoute.action",
             data:$("#addOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
             }
        }); 
        if(id=="add_save_next")addSavePrompt();	//操作提示
        else if(id=="add_save_exit")exitSavePrompt();//操作提示
	}
};
		
/*****************************添加车站信息验证***********************/
function checkAddInfo(id){
	//验证信息———添加车修改
	if($("#add_train_id").val()==""){		//验证车次不能为空
		alert("车次代码不能为空！");
		return false;
	}
	else if($("#add_leave_time").val()==""){		//验证发车不能为空
		alert("发车时间不能为空！");
		return false;
	}
	else if($("#add_arrive_time").val()==""){		//验证路线始发站不能为空
		alert("终点时间不能为空！");
		return false;
	}
	else if($("#way_station").val()==""){		//验证途经车站不能为空
		alert("途经车站不能为空！");
		return false;
	}else{
		return true;
	}
	return true;
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
			loadRouteList(1);
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