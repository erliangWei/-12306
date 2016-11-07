function getUserList(value){
	var i=1;
	var date = '';
	$.ajax({
		type:"post",
		url:"/12306/userList.action",
		//data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#user_info_list").empty();
			var date = '';
			$.each(data,function(index,dom){
				date = (dom.BORNDAY.split(" ")[0]);
				$("#user_info_list").append(
					"<tr align='center' class='log'>"
					+"<td><input type='checkbox' name='select' class='check_single'>" +
							"<input type='hidden' id = 'USERID' value='"+ dom.USERID +"'/></td>"
 		      		+"<td>"+ i++ +"</td>"     
 		      		+"<td id = 'USERNAME'>"+ dom.USERNAME +"</td>"
 		      		+"<td id = 'NAME'>"+ dom.NAME +"</td>"
 		      		+"<td id = 'SEX '>"+ dom.SEX+"</td>"
 		      		+"<td id = 'IDCARDTYPE'>"+ dom.IDCARDTYPE +"</td>"
 		      		+"<td id = 'IDCARD'>"+ dom.IDCARD+"</td>"
 		      		+"<td id = 'BORNDAY'>"+ date+"</td>"
 		      		+"<td id = 'PASSENGERTYPE'>"+ dom.PASSENGERTYPE+"</td>"
 		      		+"<td id = 'RECENTLOGTIME'>"+ dom.RECENTLOGTIME+"</td>"
 		      		+"<td id = 'more_info'><a href='#' onclick='userMoreInfo(this)'>详细信息</a>"
	 			    +"</td></tr>"
				);
			});
		
			tableCss();
		}
	});
}
  
function userMoreInfo(e){
	var ele= $(e).parent().parent().children().eq(0).children("#USERID").val();
	$.ajax({
		type:"post",
		url:"/12306/getUserInfoById.action",
		data:{"userId":ele},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
               alert(000);
		},
		success:function(data){
			var date = (data.BORNDAY.split(" ")[0]);
			$("#name").text(data.NAME);
			$("#user_name").text(data.USERNAME);
			$("#sex").text(data.SEX);
			$("#ID_type").text(data.IDCARDTYPE);
			$("#ID_code").text(data.IDCARD);
			$("#birth_day").text(date);
			$("#passenger_type").text(data.PASSENGERTYPE);
			$("#phone_num").text(data.PHONE);
			$("#tell_num").text(data.TELEPHONE);
			$("#email").text(data.EMAIL);
			$("#address").text(data.ADDRESS);
			$("#post_code").text(data.POSTCODE);
			$("#last_login_time").text(data.RECENTLOGTIME);
			
		}
		
	});
	getPassengerList(ele);	
	$("#user_info_board").slideDown();
	$("#container").slideUp();
}


function userPage(value){
	$.ajax({
		type:"post",
		url:"/12306/getUserPage.action",
		data:{"nowPageMark":value},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#page").empty();
			$("#page").append("<input type='button' value='首页' onclick = 'loadUserList(this.value)'/>"
					+"<input type='button' value='上一页' onclick = 'loadUserList(this.value)'/>"
			);
			$.each(data,function(index,dom){
				$("#page").append("<input type='button' value='"+ dom +"' onclick = 'loadUserList(this.value)'/>");
			});
			$("#page").append("<input type='button' value='下一页' onclick = 'loadUserList(this.value)'/>"
					+"<input type='button' value='尾页' onclick = 'loadUserList(this.value)'/>"
			);
			
		}
	});
}

function loadUserList(value){
	userPage(value);
	getUserList(value)
	
}