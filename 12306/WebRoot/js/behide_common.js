/*! jQuery v1.11.1 | (c) 2005, 2014 jQuery Foundation, Inc. | jquery.org/license */
$(document).ready(function (){
	$("#list table tr:even").css("background-color","#ccc");
	$("#list table tr:odd").css("color","#333");
	$("#list table tr:eq(0)").css("background-color","#3385FF");
	$("#list table tr:eq(0)").css("color","white");
	$(".log").mouseover(function(){
		$(this).css("background","#09F");
		$(this).css("color","white");
		
	});
	$(".log").mouseout(function(){
		$("#list table tr:even").css("background-color","#ccc");
		$("#list table tr:odd").css("background-color","#fff");
		$(this).css("color","#000");
	});
	var mun=$(".check_single").length;
	var count=0;
	var m;
	$("#check_all").click(function(){
		var flag;
		flag=$("#check_all").prop("checked");
		if(true==flag)
			count=mun;
		else
			count=0;
		$(".check_single").prop("checked",flag);
	});
	$(".check_single").click(function(){
		var flag2= $(this).prop("checked");
		if(false==flag2){
			--count;
			$("#check_all").prop("checked",flag2);
		}
		else{
			++count;
			if(count==mun)
				$("#check_all").prop("checked",flag2);
		}
	});
	/****************************删除操作**********************/
	$("#delect").click(function(){
		m=0;
		for(var i=0;i<mun;i++){
			var flag=$(".check_single").eq(i).prop("checked");
			if(flag==true){
				m++;
			}
		}
		var r;
		if(m==0)
			alert("未选中要删除的记录！");
		else
			r=confirm("是否删除选中的"+m+"条记录！")
			if(r){
				for(var i=0;i<mun;i++){
					var ele=$(".check_single").eq(i)
					if(ele.prop("checked")==true){
						ele.parent().parent().remove();
						i--;
					}
					
			}clear_text();
		}
	});
	$("#add_board").hide();		//隐藏添加界面
	$("#add").click(function(){   //打开添加界面
		$("#container").slideUp();
		$("#add_board").slideDown();
		
	});
	$("#update_board").hide();		//隐藏修改界面
	$("#update").click(function(){ 	//打开修改界面
		m=0;
		for(var i=0;i<mun;i++){
			var flag=$(".check_single").eq(i).prop("checked");
			if(flag==true){
				m++;
			}
		}		
		if(m==0)
			alert("未选中修改记录");
			else if(m>1)
				alert("本操作只能修改一条记录");
				else{
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});

function saveUpdatePrompt(){		//保存并退出
	var r = confirm("保存成功\n是否退出本操作");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
	else
		clear_text();
}
function exitUpdatePrompt(){    //退出修改
	var r = confirm("是否放弃本次操作");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
}

function clear_text(){		//清空文本框
	$("#add_board table tr td input").val("");
	$("#update_board table tr td input").val("");
	$("#list table input").prop("checked",false);
} 
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