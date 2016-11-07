/**************************************修改操作****************************/
$(document).ready(function(){
	
	/****************  铁路局下拉菜单    ***************************/
	$.ajax({			//调用action
	    url:"/12306/stationDeptList.action",
	    type:"post",
	    dataType:"json",
	    success:function(data){//ajax返回的数据
			$.each(data,function(index,dom){
	   		$(".dept_select").append(
		   		"<option value='"+dom.stationDept+"'>"+dom.stationDept+"</option>"
		   		);
	   		});
	    }
	 });
	
	/****************  行政区域下拉菜单    ***************************/
	$.ajax({			//调用action
	    url:"/12306/proCapitalList.action",
	    type:"post",
	    dataType:"json",
	    success:function(data){//ajax返回的数据
		   	$.each(data,function(index,dom){
		   		$(".province_select").append(
		   			"<option value='"+dom.PROCAPITAL+"'>"+dom.PROCAPITAL+"</option>"
		   		);
		   	});
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
					selectStation(ele);			//查询车站函数
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});
/**************************  获取修改车站信息  **********************************/
function selectStation(ele){			//获取修改车站信息
	$("#update_station_name").val(ele.parent().siblings("#stationName").text());		
	$("#update_station_namepy").val(ele.parent().siblings("#stationPY").text());
	$("#update_station_id").val(ele.parent().siblings("#stationId").text());
	$("#update_station_policy_dept").val(ele.parent().siblings("#policyDept").text());
	$("#update_station_dept").val(ele.parent().siblings("#stationDept").text());
	$("#update_station_level").val(ele.parent().siblings("#stationLev").text());
	$("#update_station_address").val(ele.parent().siblings("#address").text());
//	alert(ele.parent().siblings("#stationDept").text());
//	alert($("#update_station_name").val());
//	alert($("#update_station_namepy").val());
//	alert($("#update_station_id").val());
//	alert($("#update_station_policy_dept").val());
//	alert($("#update_station_dept").val());
//	alert($("#update_station_level").val());
//	alert($("#update_station_address").val());
	var address = $("#update_station_address").val();
	var addr = address.split(" ");
	var addrCode = [];
	var data = districtData;
	for(var x in data){				//获取地址code
		for(var y in data[x]){
			if(data[x][y]==addr[0]){
				addrCode[0] = x;
			}
			if(y=="cell"){
				var data2 = data[x][y];
				for(var x in data2){
					for(var y in data2[x])
					{
						if(data2[x][y]==addr[1]){
							addrCode[1] = x;
						}
						if(y=="cell"){
							var data3 = data2[x][y];
							for(var x in data3){
								for(var y in data3[x])
								{
									if(data3[x][y]==addr[2]){
										addrCode[2] = x;
									}
								}	}	}	}	}	}	}	}
/*********************  省会级联下拉菜单    ***************************/	
	alert(addrCode);
	var opts2 = {
		data: districtData,
		selStyle: 'margin-left: 3px;',
		select: '.updateAddress' ,
		//head:'请选择'
		//defVal: kk,
		defVal: addrCode,
	};
	var linkageSel2 =new LinkageSel(opts2);
	linkageSel2.onChange(function() {				//所在地下拉菜单
		var d = this.getSelectedDataArr('name');    // 所有有选定菜单的name. this === linkageSel2
		addrNum=this.getSelectedArr();
		var arr = [];
		for (var i = 0, len = d.length; i < len; i++) {
			arr.push(d[i]);
		}
		addr = arr.join(" ");
	});
	$("#update_station_address").attr("value",addr);
};

/*************************   修改数据   ********************************/
function updateStation(){
	if(checkUpdateInfo()){
		$.ajax({			//调用action
             url:"/12306/updateStation.action",
             data:$("#updateOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
             }
        });
	}
	saveUpdatePrompt();
};


/*************************   验证   ********************************/
function checkUpdateInfo(){
	if($("#update_station_name").val()==""){		
		alert("车站名不能为空！");
		return false;
	}

	else if($("#update_station_namepy").val()==""){		
		alert("拼音码不能为空");
		return false;
	}

	else if($("#update_next_station").val()==""){		
		alert("相邻车站不能为空！");
		return false;
	}else{
		return true;
	}
}

/*************************   提示   ********************************/
function saveUpdatePrompt(){		//保存并退出
	var r = confirm("保存成功\n是否退出本操作");
	if(r){
		/*********  刷新列表 ************/
		loadList(value);			//车站类表
	}
//	else
	//	clear_text();
	$("#container").slideDown();
	$("#update_board").slideUp();
}

function exitUpdatePrompt(){    //退出修改
	var r = confirm("是否放弃本次操作");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
}