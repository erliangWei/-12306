function tableCss(){
	$("#list table tr th").css("color","white");
	$("#list table tr:even").css("background-color","#ccc");
	$("#list table tr:odd").css("color","#333");
	$(".log").mouseover(function(){
		$(this).css("background","#09F");
		$(this).css("color","white");
	});
	$(".log").mouseout(function(){
		$("#list table tr:even").css("background-color","#ccc");
		$("#list table tr:odd").css("background-color","#fff");
		$(this).css("color","#000");
	});
	
	//checkbox 
	var mun=$(".check_single").length;
	var count=0;
	m = 0;
	$("#check_all").click(function(){
		var flag;
		flag=$("#check_all").prop("checked");
		if(true==flag)
			count=mun;
		else
			count=0;
		$(".check_single").prop("checked",flag);
	});
	$(".check_single").click(function(){
		var flag2= $(this).prop("checked");
		if(false==flag2){
			count = count - 1;
			$("#check_all").prop("checked",flag2);
		}
		else{
			count+=1;
			if(count==mun)
				$("#check_all").prop("checked",flag2);
		}
	});
}