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
					selectRoute(ele);			//查询车站函数
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});
/**************************  获取修改列车信息  **********************************/
function selectRoute(ele){			//获取修改车站信息
	var time = ele.parent().siblings("#totalTime").text();
	/*时间分割*/
	time = time.replace("分钟","小时");
	time = time.split("小时");
	$("#update_hour").val(time[0]);
	$("#update_second").val(time[1]);
	
	$("#update_train_id").val(ele.parent().siblings("#trainId").text());
	$("#update_leave_time").val(ele.parent().siblings("#leaveTime").text());
	$("#update_arrive_time").val(ele.parent().siblings("#arriveTime").text());
	$("#update_way_station").val(ele.parent().siblings("#stationAll").find("#add_way_stay").val());
	$("#update_total_distance").val(ele.parent().siblings("#totalDistance").text());
	$("#update_total_time").val(ele.parent().siblings("#totalTime").text());
	$("#update_route_id").val(ele.parent().siblings("#routeId").text());
	/*********  拆分途经车站  ***********/
	var station = $("#update_way_station").val();
	//alert(station);
	var a=station.split(";");
	var b='';
	$("#update_show_way_station").empty();
	var num=0;
	for(var j = 0;j<a.length;j++)
	{
		b = a[j].split("$");
		if(a[j]!==''){
			$("#update_show_way_station").append(
					"<tr align='center'><td>"+ ++num +"</td><td>"+ b[0] +"</td><td>" + b[1]
                     +"</td><td>" + b[2] + "</td><td>" + b[3]+
                     "</td><td><input type='button' value='删除' onclick='remove_station(this)'/></td></tr>"
			);
					                                                                                                                                                                                                                     +"'/></td><td><input type='button' value='删除' onclick='remove_station(this)'/>"
					                                                                                                                                                                                                                     +"<input type='button' onclick='add_station(this)' value='添加'/></td></tr>"
					/*"<tr align='center'><td>"+ ++num +"</td><td><input type='text' value='"+ b[0] 
                  +"'/></td><td><input type='text' value='" + b[1]
                  +"'/></td><td><input type='text' value='" + b[2]
                  +"'/></td><td><input type='text' value='" + b[3] 
                  +"'/></td><td><input type='button' value='删除' onclick='remove_station(this)'/>"
                  +"<input type='button' onclick='add_station(this)' value='添加'/></td></tr>"
                  */
		}
		$("#update_show_way_station tr td input").css("width","50px");
	}		
};

/*************************   修改数据   ********************************/
function updateRoute(){
	/********  合并时间  **********/
	var time = $("#update_hour").val() + "小时" + $("#update_second").val() + "分钟";
	$("#update_total_time").val(time);
	/********  合并途经车站  **********/
	var st = '';
	var len=$("#update_show_way_station tr").length;
	for(var i = 0;i<len; i++){
		var ele = $("#update_show_way_station tr").eq(i).find("input");
		st += ele.eq(0).val() +'$'+ ele.eq(1).val() +'$'+ ele.eq(2).val() +'$'+ ele.eq(3).val() +';'
	}
	$("#update_way_station").val(st);
	
	
//	alert($("#update_way_station").val());
	if(checkUpadteInfo()){
		$.ajax({			//调用action
             url:"/12306/updateRoute.action",
             data:$("#updateOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
				loadRouteList(1);
             }
        });
	}
	saveUpdatePrompt();
};

/***********  删除途经车站  *****************/
function remove_station(e){
	$(e).parent().parent().remove();
}

/**************  添加途经车站  **************************/



/*************************   验证   ********************************/
function checkUpadteInfo(){
	if($("#update_train_id").val()==""){		//验证车次不能为空
		alert("车次代码不能为空！");
		return false;
	}
	else if($("#update_leave_time").val()==""){		//验证发车不能为空
		alert("起点时间不能为空！");
		return false;
	}
	else if($("#update_arrive_time").val()==""){		//验证路线始发站不能为空
		alert("终点时间不能为空！");
		return false;
	}
	else if($("#update_total_distance").val()==""){		//验证路线车终点站不能为空
		alert("历程不能为空！");
		return false;
	}	
	else if($("#update_total_time").val()==""){		//验证路线车终点站不能为空
		alert("历时不能为空！");
		return false;
	}	
	else if($("update_way_station").val()==""){		//验证途经车站不能为空
		alert("途经车站不能为空！");
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