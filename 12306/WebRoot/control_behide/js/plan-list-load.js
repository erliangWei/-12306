function getPlanList(value){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/planList.action",
		//data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#plan_info_list").empty();
			$.each(data,function(index,dom){
				$("#plan_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"     
	 		        +"<td id = 'planId'>"+ dom.planId +"</td>"
	 		        +"<td id = 'trainId'>"+ dom.trainId +"</td>"
	 			    +"<td id = 'coachNO'>"+ dom.coachNO +"</td>"
	 			    +"<td id = 'startStation'>"+ dom.startStation +"</td>"
	 			    +"<td id = 'endStation'>"+ dom.endStation +"</td>"
	 			    +"<td id = 'publishTime'>"+ dom.publishTime +"</td>"
	 			    +"<td id = 'implementTime'>"+ dom.implementTime +"</td>"
				);
			});
		
			tableCss();
		}
	});
}


function planPage(value){
	$.ajax({
		type:"post",
		url:"/12306/getPlanPage.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
//			alert(data);
			$("#page").empty();
			$("#page").append("<input type='button' value='首页' onclick = 'loadPlanList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadPlanList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadPlanList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadPlanList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadPlanList(this.value)'/>"
			);
			
		}
	});
}

function loadPlanList(value){
	planPage(value);
	getPlanList(value)
}