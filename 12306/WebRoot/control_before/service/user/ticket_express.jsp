<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>车票快递地址</title>
<script type="text/javascript" src="../../../js/jquery-1.11.1.min.js">
</script>
<style type="text/css">
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
*{padding:0; margin:0; font-size:14px;}
#add_containner,#container{ width:770px;  font-size:13px; border-top-left-radius:7px; border-top-right-radius:7px; border: 1px solid #09F; height:400px;}
.title{ background:url(../../img/title_bg.gif); height:30px; vertical-align:middle; color:#FFF;border-top-right-radius:5px; border-top-left-radius:5px; /* Old Firefox */}
.title p { vertical-align:middle;font-size:15px;padding:6px 20px;}
#content{ margin:20px 10px 0 10px;border:1px solid #999; width:97%;}
#operator span{margin-left:550px;}
#operator{border-bottom:1px solid #CCC;height:22px;padding-top:5px;}
#passenger ,#add_info{margin:0 9px;width:98%;}
#passenger tr{height:25px; text-align:center;}
#passenger tr th{border-bottom:1px solid #999;}
#passenger tr td{border-top:1px dashed #CCC;}
#passenger tr td span{color:#06F;}
input{border-radius:5px; -moz-border-radius:5px; background-color:#eee; font-size:11px;}
#page input , .opera input ,#add_operator input{ background-color:#F63; color:#FFF;width:50px; height:25px; font-size:14px;}
#add_operator input{width:50px;height:25px;}
#page input {width:60px;height:25px;}
#page{text-align:center; margin-buttom:5px;}
#add_info{margin-top:10px;}
#add_info tr{height:30px;}
#add_info th{font-size:14px; height:40xp; }
#add_info th span{font-size:12px;}
#add_info span{color:#F00;}
#add_operator input{ margin-top:30px; margin-left:20px;}
hr{ margin-top:5px; border:1px dashed #999999;}
</style>
<script type="text/javascript">
$(document).ready(function(e) {
    var mun=$(".check_single").length;
	var count=0;
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
	$(".remove").click(function(){	//单个删除
		var r = confirm("是否删除该联系人")
		if(true==r)
			$(this).parent().parent().remove();
	});
	$("#delect").click(function(){	//批量删除
		var m = 0;
		for(var i=0;i<mun;i++)
		{
			if($(".check_single").eq(i).prop("checked")){
				m++;
			}
		}
		var r;
		if(m==0)
			alert("未选中要删除的联系人！");
		else
			r=confirm("是否删除选中的"+m+"个联系人！")
		if(true==r){
			for(var i=0;i<mun;i++)
			{
				var ele=$(".check_single").eq(i);
				if(ele.prop("checked")){
					ele.parent().parent().remove();
					i--;
				}
			}
		}
	});
	$("#add_express").click(function(){		//车票快递地址界面上拉隐藏
		$("#container").slideUp();
		$("#add_containner").slideDown();
		
	});
	$("#add_containner").hide();	//添加车票快递地址界面隐藏
	$("#submit").click(function(){   //添加车票快递地址界面信息提交
		var r = confirm("添加成功");
		if(r){
			$("#container").slideDown();
			$("#add_containner").slideUp();
		}	
	});
	$("#cancel").click(function(){   //添加车票快递地址界面退出操作
		var r = confirm("是否退出本操作");
		if(r){
			$("#container").slideDown();
			$("#add_containner").slideUp();
		}	
	});
});
		
</script>

</head>


<body>
<div id="container">
    <div class="title"> <p>车票快递地址</p>
    </div>
    	<table id="content">
        	<tr><td>
            	<div id="operator">
                    &nbsp;&nbsp;<a href="#" id="add_express">增加</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" id="delect">删除</a>
      			</div>
            </td></tr>
            <tr><td>
            
            	<table id="passenger" cellspacing="0">
                    <tr>
                    	<th><input type="checkbox" name="passenger" id="check_all"  /></th>
                        <th>序号</th>
                        <th>收件人</th>
                        <th width="300px;">地址</th>
                        <th>手机</th>
                        <th>是否默认</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr> <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                     <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>ddddddddddddddddddddddddddd</td>
                        <td>15986934867</td>
                        <td><span>取消默认</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
              
                </table>
            </td></tr>
        </table>
        <div id="page">
        	<input type="button" id="" value="第一页" />
            <input type="button" id="" value="第二页" />
        </div>
</div>
<div id="add_containner">
	<div class="title"> <p>添加新的车票快递地址</p>
    </div>
	<table id="add_info">
    	<tr>
        	<th colspan="2" align="left">选择车票快递地址<span>（*为必填项）</span>
            	<hr />
            </th>
        </tr>
    	<tr>
        	<td><span>* </span>所在地址：</td>
            <td>
            	<select name="province">
                	<option value="0">请选择省</option>
                </select>
                <select name="province">
                	<option value="0">请选择市</option>
                </select>
                <select name="province">
                	<option value="0">请选择区</option>
                </select>
                <select name="province">
                	<option value="0">请选择乡镇（周边地区）</option>
                </select>
                <select name="province">
                	<option value="0">请选择附近区域</option>
                </select>
                
            
            </td>
        </tr>
        <tr>
        	<td><span>* </span>详细地址：</td>
            <td><input type="text" id="address" style="width:300px;"/></td>
        </tr>
        <tr>
        	<td><span>* </span>收件人：</td>
            <td><input type="text" id="address" style="width:150px;"/></td>
        </tr>
        <tr>
        	<td><span>* </span>手机号码：</td>
            <td><input type="text" id="address" style="width:150px;"/></td>
        </tr>
        <tr id="add_operator">
        	<td colspan="2"  align="center">
            	<input type="button" id="submit" value="添加"/>
                <input type="button" id="cancel" value="取消"/>
            </td>          
        </tr>
      
    </table>
</div>
</body>
</html>
