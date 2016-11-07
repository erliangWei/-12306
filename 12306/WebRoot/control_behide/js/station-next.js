$(document).ready(function(e) {
    $(".next_station").click(function(){	//添加相邻车站	
		$(this).before('<input type="text" class="next_station"/>')
	});
    
	function delectNextStation(){		//删除相邻车站
		var val;
		val=$(this).text();
		alert(val);
		if(val!=""){
			var r = confirm("是否删除！");
			if(r){
				$(this).remove();
			}
		}
	}
	$("#show_next_station").hide();
	$(".show_info").mousemove(function(e){	
		$("#show_next_station").hide();		//相邻车站form隐藏
		//相邻车站form定位
		var left=e.pageX;					
		var top=e.pageY+20;
	//	alert(left);alert(top);
		$("#show_next_station").css("left",left+"px");
		$("#show_next_station").css("top",top+"px");
		$("#show_next_station").show();		//相邻车站form显示
	});
	$(".show_info").mouseleave(function(){
		$("#show_next_station").hide();
	});
});







