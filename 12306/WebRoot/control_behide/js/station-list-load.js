/*************** 车站列表  ****************/
var m;
function getStationList(value){
	var i=1;
//	alert(0);
	$.ajax({
		type:"post",
		url:"/12306/stationList.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#station_info_list").empty();
			$.each(data,function(index,dom){
				$("#station_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"
	 		        +"<td id = 'stationId'>"+ dom.stationId +"</td>"
	 		        +"<td id = 'stationName'>"+ dom.stationName +"</td>"
	 			    +"<td id = 'stationPY'>"+ dom.pinYin +"</td>"
	 			    +"<td id = 'stationDept'>"+ dom.stationDept +"</td>"
	 			    +"<td id = 'stationLev'>"+ dom.stationLev +"</td>"
	 		        +"<td><a href='#' class='show_info'>查看</a></td>"
	 		        +"<td id = 'policyDept'>"+ dom.policyDept +"</td>"
	 		        +"<td id = 'address' align='left'>"+ dom.address +"</td></tr>"	
				);
				
			});
			tableCss();
		}
	});
}
/**********************分页*************************/
function stationPage(value){
	$.ajax({
		type:"post",
		url:"/12306/getStationPage.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#page").empty();
			$("#page").append("<input type='button' value='首页' onclick = 'loadList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadList(this.value)'/>"
			);
			
		}
	});
	
	//alert(3);
	
}

function loadList(value){
	//alert(1);

	stationPage(value);
	getStationList(value);
	//alert(2);
}
