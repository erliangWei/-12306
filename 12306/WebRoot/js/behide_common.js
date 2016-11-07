/*! jQuery v1.11.1 | (c) 2005, 2014 jQuery Foundation, Inc. | jquery.org/license */
$(document).ready(function (){
	$("#list table tr:even").css("background-color","#ccc");
	$("#list table tr:odd").css("color","#333");
	$("#list table tr:eq(0)").css("background-color","#3385FF");
	$("#list table tr:eq(0)").css("color","white");
	$(".log").mouseover(function(){
		$(this).css("background","#09F");
		$(this).css("color","white");
		
	});
	$(".log").mouseout(function(){
		$("#list table tr:even").css("background-color","#ccc");
		$("#list table tr:odd").css("background-color","#fff");
		$(this).css("color","#000");
	});
	var mun=$(".check_single").length;
	var count=0;
	var m;
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
			--count;
			$("#check_all").prop("checked",flag2);
		}
		else{
			++count;
			if(count==mun)
				$("#check_all").prop("checked",flag2);
		}
	});
	/****************************ɾ������**********************/
	$("#delect").click(function(){
		m=0;
		for(var i=0;i<mun;i++){
			var flag=$(".check_single").eq(i).prop("checked");
			if(flag==true){
				m++;
			}
		}
		var r;
		if(m==0)
			alert("δѡ��Ҫɾ���ļ�¼��");
		else
			r=confirm("�Ƿ�ɾ��ѡ�е�"+m+"����¼��")
			if(r){
				for(var i=0;i<mun;i++){
					var ele=$(".check_single").eq(i)
					if(ele.prop("checked")==true){
						ele.parent().parent().remove();
						i--;
					}
					
			}clear_text();
		}
	});
	$("#add_board").hide();		//������ӽ���
	$("#add").click(function(){   //����ӽ���
		$("#container").slideUp();
		$("#add_board").slideDown();
		
	});
	$("#update_board").hide();		//�����޸Ľ���
	$("#update").click(function(){ 	//���޸Ľ���
		m=0;
		for(var i=0;i<mun;i++){
			var flag=$(".check_single").eq(i).prop("checked");
			if(flag==true){
				m++;
			}
		}		
		if(m==0)
			alert("δѡ���޸ļ�¼");
			else if(m>1)
				alert("������ֻ���޸�һ����¼");
				else{
					$("#container").slideUp();
					$("#update_board").slideDown();
				}
	});
});

function saveUpdatePrompt(){		//���沢�˳�
	var r = confirm("����ɹ�\n�Ƿ��˳�������");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
	else
		clear_text();
}
function exitUpdatePrompt(){    //�˳��޸�
	var r = confirm("�Ƿ�������β���");
	if(r){
		$("#container").slideDown();
		$("#update_board").slideUp();
		clear_text();
	}
}

function clear_text(){		//����ı���
	$("#add_board table tr td input").val("");
	$("#update_board table tr td input").val("");
	$("#list table input").prop("checked",false);
} 
function addSavePrompt(){		//���沢�����һ����¼
	var r = confirm("����ɹ�\nѡ��ȷ����������Ӽ�¼��ѡ��ȡ�����˳���Ӽ�¼����")
	if(r)
		clear_text();
	else{
		var rr=	confirm("ȷ���˳���")
		if(rr){
			$("#container").slideDown();
			$("#add_board").slideUp();
			clear_text();
		}
	}
}
function exitSavePrompt(){		//���沢�˳�
	var r = confirm("����ɹ�\n�Ƿ��˳�������");
	if(r){
		$("#container").slideDown();
		$("#add_board").slideUp();
		clear_text();
	}
	else
		clear_text();
}
function cancelExitPrompt(){    //ȡ���˳�   
	var r = confirm("�Ƿ�������β���");
	if(r){
		$("#container").slideDown();
		$("#add_board").slideUp();
		clear_text();
	}
}