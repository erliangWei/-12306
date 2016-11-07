<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'province_menu.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript"  src="js/comm.js"></script>
	<script type="text/javascript" src="js/linkagesel-min.js"></script>
	<script type="text/javascript" src="js/district-all.js"></script>
	<script type="text/javascript" src="js/district-level1.js"></script>	
	<script type="text/javascript" src="js/district-level2.js"></script>	
	<script type="text/javascript" src="js/linkagesel.js"></script>	
	<script type="text/javascript">
		 $(document).ready(function(){
            var opts = {
                    data: districtData,
                    selStyle: 'margin-left: 3px;',
                    select: '#demo7' ,
					//head:'请选择'
                    //defVal: [5, 256],
            };
			var addr;
			var addrNum;
			var linkageSel1 = new LinkageSel(opts);
			linkageSel1.onChange(function() {
				var d = this.getSelectedDataArr('name');    // 所有有选定菜单的name. this === linkageSel2
				addrNum=this.getSelectedArr();
				addrNum.join(' ')
					
				var arr = [];
				for (var i = 0, len = d.length; i < len; i++) {
					arr.push(d[i]);
				}
				var text=$("#tex").text(arr.join(" "));
				addr=text.text();
			});
			$("#ii").click(function(){
				$("#address").val(addr);
				document.testForm.add.value = addr;
				document.testForm.add2.value = addrNum;
				
				alert(document.testForm.add2.value);
				var str="";
				var address = [];
				var j = 0;
				for(var i=0 ; i<=addr.length ; i++){
					if(addr[i]!=" " && i!=(addr.length)){
						str=str+addr[i];
					}
					else{
						address[j]=str;
						j++;
						str="";
					}
				}
				
				//var kk="北京市 东城区";
				
				var opts2 = {
					data: districtData,
					selStyle: 'margin-left: 3px;',
					select: '#demo8' ,
					//head:'请选择'
					//defVal: kk,
					defVal: addrNum,
				};
				var linkageSel2 = new LinkageSel(opts2);
			});
			linkageSel2.onChange(function() {
				var d = this.getSelectedDataArr('name');    // 所有有选定菜单的name. this === linkageSel2
					arr = [];
				for (var i = 0, len = d.length; i < len; i++) {
					arr.push(d[i]);
				}
				addrNum='';
			});
		});
		
		
	</script>
<title>省会下拉菜单</title>
</head>

<body>
<div class="lsdemo">
    <div>
        <select id="demo7" ></select><br/>
        <input type="hidden" name="address" id="address" />
        <p id="tex" /></p>
        <input type="button" id="ii"/>
        <select id="demo8" ></select><br/>
        <input type="button" id="pp" value="ppppp"/>
    </div>
    <form action="aaa" name="testForm">
    	<input type="hidden" name="add" id="add"/>
    	<input type="hidden" name="add2" id="add2"/>
    </form>
    
</div>		
</body>
</html>
