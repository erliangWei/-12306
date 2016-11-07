$(document).ready(function(){
  $("#header").load("header_behind.jsp");
  $("#menu").load("manager_menu.jsp");
  $("#content").load("content.html");
  
   $("menu_list1 a").click(function(){
  		 var add=(this).attr("href");
  		 alert(add);
  		 $("#content").load(add,function(responseTxt,statusTxt,xhr){
   				   if(statusTxt=="success")
      				  alert("外部内容加载成功！");
     			   if(statusTxt=="error")
      				  alert("Error: "+xhr.status+": "+xhr.statusText);
   		 });
    });
});
