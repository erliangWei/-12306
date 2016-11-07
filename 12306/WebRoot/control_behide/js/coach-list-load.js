 function getCoachList(value){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/coachList.action",
		//data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#coach_info_list").empty();
			$.each(data,function(index,dom){
				$("#coach_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"
	 		        +"<td id = 'coachId'>"+ dom.coachId +"</td>"
	 		        +"<td id = 'coachTrainId'>"+ dom.coachTrainId +"</td>"
	 		        +"<td id = 'coachNo'>"+ dom.coachNo+"</td>"
	 			    +"<td id = 'coachType'>"+ dom.coachType +"</td>"
	 		        +"<td id = 'seatType'>"+ dom.seatType +"</td>"
	 		        +"<td id = 'seat'>"+ dom.seat +"</td></tr>"
				);
			});
			tableCss();
		}
	});
}
 function coachPage(value){
	$.ajax({
		type:"post",
		url:"/12306/getCoachPage.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#page").empty();
			$("#page").append("<input type='button' value='首页' onclick = 'loadCoachList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadCoachList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadCoachList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadCoachList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadCoachList(this.value)'/>"
			);
			
		}
	});
}

function loadCoachList(value){
	coachPage(value);
	getCoachList(value)
	
}
 
