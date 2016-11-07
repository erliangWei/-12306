$(document).ready(function(){
	$("#add_board").hide();		//隐藏添加界面
	$("#add").click(function(){   //打开添加界面
		//province01();
		addStartTrain();
		$("#container").slideUp();
		$("#add_board").slideDown();
	});
	
//	$("#add_first_station").focus(function(){
//		
//	});
//	$("#add_final_station").focus(function(){
////		alert(0);
//		var selectOption = document.getElementById("add_first_station");
//		var selected = selectOption.options[selectOption.selectedIndex].text;
//		if(selected == $("#add_final_station").val()){
//			alert("起始车站与终点车站不能重名");
//		}
//		if($("#add_final_station").val()==''){
//		}
//	});
//	$("#add_final_station").blur(function(){
//		alert(pp);
// 		var selectOption = document.getElementById("add_first_station");
//		var selected = selectOption.options[selectOption.selectedIndex].text;
//		if(selected == $("#add_final_station").val()){
//			alert("起始车站与终点车站不能重名");
//		}
//		if($("#add_final_station").val()==''){
//		}
//	});
	
	$("#add_final_station").keyup(function(){
		$(this).click(function(){
			$("#add_final_station").val('');
		});
		$("#search_py").show();
		var x = getLeft(this);
		var y = getTop(this)+20;
		$("#search_py").css("left",x+"px");
		$("#search_py").css("top",y+"px");
		if($("#add_final_station").val()=='')
			$("#search_py").hide();
		var val = $("#add_final_station").val().toUpperCase();
		if(val!='')
			seach_pinyin(this,val);
		
	});
});

function seach_pinyin(id,val){
	$.ajax({
		url:"/12306/queryStationList.action",
		type:"post",
		data:{"station":val},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
	           alert(XMLHttpRequest.readyState);
	           alert(textStatus);
		},
		success:function(data){
			if(data==''){
				$("#search_py").empty();
				$("#search_py").append(
						"<p>----------------</p>"
				);
			}else{
				$("#search_py").empty();
				$.each(data,function(index,dom){
					$("#search_py").append(
							"<p>"+dom.stationName+"</p>"
					);
				});
			}
			$("#search_py p").mouseover(function(){
				$(this).css("background-color","#ccc");
				$(this).css("color","#fff");
			});
			$("#search_py p").mouseout(function(){
				$(this).css("background-color","yellow");
				$(this).css("color","000");
			});
			$("#search_py p").click(function(){
				$("#add_final_station").val($(this).text());
				$("#search_py").hide()
			});
		}
	});
}


function addStartTrain(){
	$.ajax({
		url:"/12306/stationList.action",
		type:"post",
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
	           alert(XMLHttpRequest.readyState);
	           alert(textStatus);
		},
		success:function(data){
			$("#add_first_station").empty();
			$.each(data,function(index,dom){
				$("#add_first_station").append(
						"<option value='"+dom.stationId+"'>"+dom.stationName+"</option>"
				);
			});
		}
	});
}

function getLeft(e){ 
	var offset=e.offsetLeft; 
	if(e.offsetParent!=null) offset+=getLeft(e.offsetParent); 
	return offset; 
	};
function getTop(e){ 
	var offset=e.offsetTop; 
	if(e.offsetParent!=null) offset+=getTop(e.offsetParent); 
	return offset; 
	};
/***********************  添加车站  **************************/
function addTrain(id){		//添加车站数据
	
	var time;
	time=$("#add_hour").val()+"小时"+$("#add_second").val()+"分钟";
	$("#add_total_time").val(time);
	if(checkAddInfo(id)){	//校验
		$.ajax({			//调用action
             url:"/12306/addTrain.action",
             data:$("#addOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
			loadTrainList(1);
             }
        }); 

        if(id=="add_save_next")addSavePrompt();	//操作提示
        else if(id=="add_save_exit")exitSavePrompt();//操作提示
	}
};
		
/*****************************添加车站信息验证***********************/
function checkAddInfo(id){
	//验证信息———添加车修改

	if($("#add_train_type").val()==""){		//验证列车类型不能为空
		alert("列车类型不能为空！");
		return false;
	}
	else if($("#add_train_body_type").val()==""){		//验证列车车体不能为空
		alert("车辆车体分类不能为空！");
		return false;
	}
	else if($("#add_first_station").val()==""){		//验证列车始发站不能为空
		alert("始发站不能为空！");
		return false;
	}
	else if($("#add_leave_time").val()==""){		//验证列车始发时间不能为空
		alert("始发时间不能为空！");
		return false;
	}	
	else if($("#add_final_station").val()==""){		//验证列车终点站不能为空
		alert("终点站不能为空！");
		return false;
	}
	else if($("#add_site_count").val()==""){		//验证列车无座票数量不能为空
		alert("无座票数量不能为空！");
		return false;
	}else{
		return true;
	}
}

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
			loadTrainList(1);
		}
		else if(rr!=true)
			clear_text();
	}
//	loadTrainList(1);
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