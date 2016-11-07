 function getTrainList(value){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/trainList.action",
		//data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#train_info_list").empty();
			$.each(data,function(index,dom){
				$("#train_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"
	 		        +"<td id = 'trainCode'>"+ dom.trainCode 
	 		        +"</td>"
	 		        +"<td id = 'trainType'>"+ dom.trainType +"</td>"
	 			    +"<td id = 'trainBody'>"+ dom.trainBody+"</td>"
	 			    +"<td id = 'startStation'>"+ dom.statrStation +"</td>"
	 			    +"<td id = 'endStation'>"+ dom.endStation +"</td>"
	 		        +"<td id = 'totalDistance'>"+ dom.totalDistance +"</td>"
	 		        +"<td id = 'startTime'>"+ dom.startTime +"</td>"
	 		        +"<td id = 'endTime'>"+ dom.endTime +"</td>"
	 		        +"<td id = 'totalTime'>"+ dom.totalTime +"</td>"
	 		        +"<td id = 'standTicketNum'>"+ dom.standTicketNum +"</td></tr>"
				);
			});
			tableCss();
		}
	});
}
 function trainPage(value){
	$.ajax({
		type:"post",
		url:"/12306/getTrainPage.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#page").empty();
			$("#page").append("<input type='button' value='首页' onclick = 'loadTrainList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadTrainList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadTrainList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadTrainList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadTrainList(this.value)'/>"
			);
			
		}
	});
}

function loadTrainList(value){
	trainPage(value);
	getTrainList(value)
	
}
 
