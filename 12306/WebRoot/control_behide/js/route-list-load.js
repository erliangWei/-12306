function getRouteList(value){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/routeList.action",
		//data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#route_info_list").empty();
			$.each(data,function(index,dom){
				$("#route_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"
	 		        +"<td id = 'routeId'>"+ dom.routeId +"</td>"
	 		        +"<td id = 'trainId'>"+ dom.trainId +"</td>"
	 			    +"<td id = 'leaveTime'>"+ dom.leaveTime +"</td>"
	 			    +"<td id = 'arriveTime'>"+ dom.arriveTime +"</td>"
	 			    +"<td id = 'stationAll'><a class='route_info' href='#'>"
	 			    + "查看</a><input type='hidden' value='"+dom.stationAll+"'id='add_way_stay'/></td>"
	 			    +"<td id = 'totalDistance'>"+ dom.totalDistance +"</td>"
	 		        +"<td id = 'totalTime'>"+ dom.totalTime +"</td></tr>"
				);
			});
		
			tableCss();
			showRouteStation();
		}
	});
}


function routePage(value){
	$.ajax({
		type:"post",
		url:"/12306/getRoutePage.action",
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
			$("#page").append("<input type='button' value='首页' onclick = 'loadRouteList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadRouteList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadRouteList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadRouteList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadRouteList(this.value)'/>"
			);
			
		}
	});
}

function loadRouteList(value){
	routePage(value);
	getRouteList(value)
	
}