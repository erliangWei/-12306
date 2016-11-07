/*************** 列表  ****************/
function getZoneList(value){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/zoneList.action",
		
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#zone_info_list").empty();
			$.each(data,function(index,dom){
				$("#zone_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"
	 		        +"<td id = 'zoneId'>"+ dom.zoneId +"</td>"
	 		        +"<td id = 'zoneFrom'>"+ dom.zoneFrom +"</td>"
	 			    +"<td id = 'zoneTo'>"+ dom.zoneTo +"</td>"
	 			    +"<td id = 'zoneDistance'>"+ dom.zoneDistance +"</td>"
	 			    +"<td id = 'zoneAmount'>"+ dom.zoneAmount +"</td>"
				);
				
			});
			tableCss();
		}
	});
}
/**********************分页*************************/
function zonePage(value){
	$.ajax({
		type:"post",
		url:"/12306/geZonePage.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#page").empty();
			$("#page").append("<input type='button' value='首页' onclick = 'loadZoneList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadZoneList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadZoneList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadZoneList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadZoneList(this.value)'/>"
			);
			
		}
	});
}
function loadZoneList(value){
	zonePage(value);
	getZoneList(value);
}
