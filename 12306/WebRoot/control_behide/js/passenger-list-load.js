function getPassengerList(userId){
	var i=1;
	$.ajax({
		type:"post",
		url:"/12306/passengerList.action",
		data:{"userId":userId},
		dataType:"json",
		error:function (XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);
		},
		success:function(data){
			$("#passenger_info_list").empty();
			
			$.each(data,function(index,dom){
				$("#passenger_info_list").append(
					"<tr align='center' class='log'>"
						+"<td>"+ i++ +"</td>"
						+"<td id = 'NAME'>"+ dom.NAME+"</td>"
			      		+"<td id = 'SEX'>"+ dom.SEX+"</td>"
			      		+"<td id = 'ID_TYPE'>"+ dom.ID_TYPE+"</td>"
			      		+"<td id = 'ID_CODE'>"+ dom.ID_CODE+"</td>"
			      		+"<td id = 'PASSENGER_TYPE;'>"+ dom.PASSENGER_TYPE+"</td>"
			      		+"<td id = 'PHONE'>"+ dom.PHONE +"</td>"
			      		+"<td id = 'TELL_PHONE'>"+ dom.TELL_PHONE +"</td>"
			      		+"<td id = 'EMAIL'>"+ dom.EMAIL +"</td>"
			      		+"<td id = 'ADDRESS'>"+ dom.ADDRESS+"</td>"
			      		+"<td id = 'POSTAL'>"+ dom.POSTAL+"</td>"
	 			    +"</td></tr>"
				);
			});
			$("#passenger_board table tr th").css("color","white");
			$("#passenger_board table tr:even").css("background-color","#ccc");
			$("#passenger_board table tr:odd").css("color","#333");
			$(".log").mouseover(function(){
				$(this).css("background","#09F");
				$(this).css("color","white");
			});
			$(".log").mouseout(function(){
				$("#passenger_board table tr:even").css("background-color","#ccc");
				$("#passenger_board table tr:odd").css("background-color","#fff");
				$(this).css("color","#000");
			});
		}
	});
}
  
//function userMoreInfo(e){
//	var ele= $(e).parent().parent().children().eq(0).children("#USERID").val();
//	$.ajax({
//		type:"post",
//		url:"/12306/getUserInfoById.action",
//		data:{"userId":ele},
//		dataType:"json",
//		error:function (XMLHttpRequest, textStatus, errorThrown){
//			alert(XMLHttpRequest.status);
//               alert(XMLHttpRequest.readyState);
//               alert(textStatus);
//               alert(000);
//		},
//		success:function(data){
//			var date = (data.BORNDAY.split(" ")[0]);
//			$("#name").text(data.NAME);
//			$("#user_name").text(data.USERNAME);
//			$("#sex").text(data.SEX);
//			$("#ID_type").text(data.IDCARDTYPE);
//			$("#ID_code").text(data.IDCARD);
//			$("#birth_day").text(date);
//			$("#passenger_type").text(data.PASSENGERTYPE);
//			$("#phone_num").text(data.PHONE);
//			$("#tell_num").text(data.TELEPHONE);
//			$("#email").text(data.EMAIL);
//			$("#address").text(data.ADDRESS);
//			$("#post_code").text(data.POSTCODE);
//			$("#last_login_time").text(data.RECENTLOGTIME);
//		}
//	});
//		
//	$("#user_info_board").slideDown();
//	$("#container").slideUp();
//}
