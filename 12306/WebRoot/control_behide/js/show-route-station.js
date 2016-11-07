function showRouteStation(){
	$("#show_route").hide();
	$(".route_info").mousemove(function(e){
		var left=e.pageX-300;
		var top=e.pageY+20;
		//alert(left);alert(top);
		$("#show_route").css("left",left+"px");
		$("#show_route").css("top",top+"px");
		$("#show_route").show();
	});
	$(".route_info").mouseleave(function(){
		
		$("#show_route").hide();
	});
	$(".route_info").mousemove(function(e){
		
		var station = $(this).next().val();
		var a=station.split(";");
		var b='';
		$("#show_way_station2").empty();
		var num=0;
		for(var j = 0;j<a.length;j++)
		{
			b = a[j].split("$");
			if(a[j]!==''){
				$("#show_way_station2").append(
						"<tr align='center'><td>"+ ++num +"</td><td>"+ b[0] +"</td><td>" + b[1]
	                    +"</td><td>"+b[2]+"</td><td>"+b[3]+"</td></tr>"
				);
			}
		}		
	});
}