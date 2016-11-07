function getRateList(value){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/rateList.action",
		//data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#rate_info_list").empty();
			$.each(data,function(index,dom){
				$("#rate_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'></td>"
 		      		+"<td>"+ i++ +"</td>"     
	 		        +"<td id = 'rateId'>"+ dom.rateId +"</td>"
	 		        +"<td id = 'ticketType'>"+ dom.ticketType +"</td>"
	 			    +"<td id = 'ticketRate'>"+ dom.ticketRate +"</td>"
	 			    +"<td id = 'ratIO'>"+ dom.ratIO +"</td></tr>"
				);
			});
			tableCss();
		}
	});
}


function ratePage(value){
	$.ajax({
		type:"post",
		url:"/12306/getRatePage.action",
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
			$("#page").append("<input type='button' value='首页' onclick = 'loadRateList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadRateList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadRateList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadRateList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadRateList(this.value)'/>"
			);
		}
	});
}

function loadRateList(value){
	ratePage(value);
	getRateList(value)
	
}