/****************************删除操作**********************/
$(document).ready(function(){
	$("#delete").click(function(){
		var mun=$(".check_single").length;			//获取车站列表总行数
		var m=0;									//要删除的记录为0
		for(var i=0;i<mun;i+=1){					//遍历列表行数，查询删除总行数
			var flag=$(".check_single").eq(i).prop("checked");
			if(flag==true){
				m+=1;
			}
		}
		var r;
		if(m==0)							//判断删除行数是否为0
			alert("未选中要删除的记录！");
		else
			r=confirm("是否删除选中的"+m+"条记录！")
			if(r){
				deletePlan();
			} 
	});
});
function deletePlan(){				//删除数据
	var tab=document.getElementById("plan_list");		//获取要删除数据表格元素
	var rows=tab.rows;										//获取删除行
	var trainId;						//定义变量，用来获取删除记录的列车代码
	var kkk='';
	for(var i=0;i<rows.length;i++){
		var elePar=$(".check_single").eq(i);	//获取表格行checkbox元素
		var flag=elePar.prop("checked");		//校验checkbox的checked属性
		if(flag==true){
			stationId=rows[i+1].cells[2].innerHTML;		//获取列车代码
			kkk+=stationId+',';
		}
	}
	if(kkk!=''){
		$.ajax({			//调用action
            url:"/12306/deletePlan.action",
            data:{"delPlanId":kkk},
            type:"post",
            success:function(data){//ajax返回的数据
            	loadPlanList(1);
          	}
     	});
     }
	
};	