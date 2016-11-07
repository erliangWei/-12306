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
					selectZone(ele);			
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});
/**************************  获取修改列车信息  **********************************/
function selectZone(ele){			//获取列车编组信息
	$("#update_zone_id").val(ele.parent().siblings("#zoneId").text());
	$("#update_road_start").val(ele.parent().siblings("#zoneFrom").text());
	$("#update_road_end").val(ele.parent().siblings("#zoneTo").text());
	$("#update_road_long").val(ele.parent().siblings("#zoneDistance").text());
	$("#update_roat_num").val(ele.parent().siblings("#zoneAmount").text());
//	alert($("#update_coach_code").val());
};

/*************************   修改数据   ********************************/
function updateZone(){
	if(checkUpadteInfo()){
		$.ajax({			//调用action
             url:"/12306/updateZone.action",
             data:$("#updateOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
				loadZoneList(1);
             }
        });
	}
	saveUpdatePrompt();
};


/*************************   验证   ********************************/
function checkUpadteInfo(id){
	if($("#update_road_id").val()==""){		//旅程区段编号不能为空
		alert("旅程区段编号不能为空！");
		return false;
	}
	else if($("#update_road_start").val()==""){		//里程区段（起点）不能为空
		alert("里程区段（起点）不能为空！");
		return false;
	}
	else if($("#update_road_end").val()==""){		//里程区段（终点）不能为空
		alert("里程区段（终点）不能为空！");
		return false;
	}
	else if($("#update_road_long").val()==""){		//每区段里程不能为空
		alert("每区段里程不能为空！");
		return false;
	}else if($("#update_roat_num").val()==""){		//区段数不能为空
		alert("区段数不能为空！");
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