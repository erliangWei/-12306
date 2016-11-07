var addr = '';      //存储地址下拉菜单
$(document).ready(function(){
	$("#add_board").hide();		//隐藏添加界面
	$("#add").click(function(){   //打开添加界面
		//province01();
		$("#container").slideUp();
		$("#add_board").slideDown();
	});
/*********************  省会级联下拉菜单 ************************************/	
	var opts = {data: districtData,
            selStyle: 'margin-left: 3px;',
            select: '.addressSelect' ,
			//head:'请选择'
            //defVal: [5, 256],
    };
	var linkageSel1 = new LinkageSel(opts);
	linkageSel1.onChange(function() {				//所在地下拉菜单
		var d = this.getSelectedDataArr('name');    // 所有有选定菜单的name. this === linkageSel2
		var arr = [];
		for (var i = 0, len = d.length; i < len; i++) {
			arr.push(d[i]);
		}
		addr = arr.join(" ");
	});
	
/****************  铁路局下拉菜单    ***************************/
	$.ajax({			//调用action
	    url:"/12306/stationDeptList.action",
	    type:"post",
	    dataType:"json",
	    success:function(data){//ajax返回的数据
			$.each(data,function(index,dom){
	   		$("#dept_select").append(
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
		   		$("#province_select").append(
		   			"<option value='"+dom.PROCAPITAL+"'>"+dom.PROCAPITAL+"</option>"
		   		);
		   	});
	   	}
	 });

});

/***********************  添加车站  **************************/
function addStation(id){		//添加车站数据
	$("#add_station_address").attr("value",addr);
	if(checkAddInfo(id)){	//校验<station_manager.js>
		$.ajax({			//调用action
             url:"/12306/stationAddInfo.action",
             data:$("#addOperator").serialize(),
             type:"post",
             success:function(data){//ajax返回的数据
             }
        }); 
        if(id=="add_save_next")addSavePrompt();	//操作提示<behide_commom.js>  
        else if(id=="add_save_exit")exitSavePrompt();//操作提示<behide_commom.js>
	}
};
		
/*****************************添加车站信息验证***********************/
function checkAddInfo(id){
	if($("#add_station_name").val()==""){		
		alert("车站名不能为空！");
		return false;
	}

	else if($("#add_station_namepy").val()==""){		
		alert("拼音码不能为空");
		return false;
	}

	else if($(".add_next_station").val()==""){		
		alert("相邻车站不能为空！");
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
			loadList();	
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
		loadList();	
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
		loadList();	
	}
}