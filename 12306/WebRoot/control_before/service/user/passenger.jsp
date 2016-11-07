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
<title>无标题文档</title>
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
#add_container,#container{ width:770px;  font-size:13px; border-top-left-radius:7px; border-top-right-radius:7px; border: 1px solid #09F; padding-bottom:20px;}
.title{ background:url(../../img/title_bg.gif); height:30px; vertical-align:middle; color:#FFF;border-top-right-radius:5px; border-top-left-radius:5px; /* Old Firefox */}
.title p { vertical-align:middle;font-size:15px;padding:6px 20px;}
#content{ margin:20px 10px 0 10px;border:1px solid #999;}
#operator span{margin-left:500px;}
#operator{border-bottom:1px solid #CCC;height:22px;}
#passenger{margin:0 9px;width:98%;}
#passenger tr{height:25px; text-align:center;}
#passenger tr th{border-bottom:1px solid #999;}
#passenger tr td{border-top:1px dashed #CCC;}
#passenger tr td span{color:#06F;}
input{border-radius:5px; -moz-border-radius:5px;font-size:12px;}
#page input,.opera input{ background-color:#F63; color:#FFF;width:50px; height:25px;margin-top:5px;}
#page{ text-align:center; margin-top:5px;}
#add_container p{font-weight:bold;font-size:15px; padding:5px 10px;}
#add_container span{color:#F00; font-size:14px; font-weight:normal;}
table{width:750px;}
#add_container table tr td{width:50%; height:25px;}
#add_operator {text-align:center;}
#add_operator input{ margin-top:20px; margin-left:20px;width:40px;height:25px; background-color:#F63; color:#FFF;}


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
	$(".remove").click(function(){		//删除选中的联系人
		var r = confirm("是否删除该联系人")
		if(true==r)
			$(this).parent().parent().remove();
	});
	
	$("#delect").click(function(){		//批量删除
		var m = 0;
		for(var i=0;i<mun;i++){
			var flag=$(".check_single").eq(i).prop("checked");
			if(flag==true){
				m++;
			}
		}
		var r;
		if(m==0)
			alert("未选中要删除的联系人！");
		else
			r=confirm("是否删除选中的"+m+"个联系人！")
			if(r){
				for(var i=0;i<mun;i++){
					var ele=$(".check_single").eq(i)
					if(ele.prop("checked")==true){
						ele.parent().parent().remove();
						i--;
					}
			}
		}
	});
	$("#add_container").hide();			//隐藏添加界面
	$("#add_passenger").click(function(){
		$("#container").slideUp();
		$("#add_container").slideDown();		
	});
	$("#submit").click(function(){		//打开添加界面
		alert("添加成功！");
		$("#container").slideDown();
		$("#add_container").slideUp();	
	});
	$("#cancel").click(function(){	//关闭添加界面
		var r = confirm("是否退出本次操作！")	
		if(r){
			$("#container").slideDown();
			$("#add_container").slideUp();	
		}
	});
});
		
</script>

</head>


<body>
<div id="container">
    <div class="title"> <p>常用联系人</p>
    </div>
    	<table id="content">
        	<tr><td>
            	<div id="operator">
                    &nbsp;&nbsp;<a href="#" id="add_passenger">增加</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" id="delect">删除</a>
                    <span>
                    <input type="text" id="seach" style="width:100px;" value="请输乘客姓名" onclick="this.value=''"/>
                    </span>
      			</div>
            </td></tr>
            <tr><td>
            
            	<table id="passenger" cellspacing="0">
                    <tr>
                    	<th><input type="checkbox" name="passenger" id="check_all"  /></th>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>证件类型</th>
                        <th>证件号码</th>
                        <th>手机/电话</th>
                        <th>旅客类型</th>
                        <th>核验状态</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑"/>
                        </td>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>1</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>3</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
                    <tr>
                   		<td><input type="checkbox" name="passenger" class="check_single" /></td>
                        <td>2</td>
                        <td>JIAJIA</td>
                        <td>身份证</td>
                        <td>2011241341111</td>
                        <td>15986934867</td>
                        <td>成人</td>
                        <td><span>已通过</span></td>
                        <td class="opera" >
                        	<input type="button" value="删除" class="remove"/>
                            <input type="button" value="编辑" />
                        </td>
                    </tr>
              
                </table>
            </td>
            </tr>
        </table>
        <div id="page">
        	<input type="button" value="首页" />
            <input type="button" value="上一页" />
            <input type="button" value="1" />
            <input type="button" value="2" />
            <input type="button" value="下一页" />
            <input type="button" value="末页" />
        </div>
</div>

<div id="add_container">
	 <div class="title"> <p>添加常用联系人</p>
     </div>
     <p>基本信息<span>  *为必填项</span></p>
     	<table id="passenger_info">
        	<tr>
            	<td align="right"><span>*&nbsp;</span>姓名：</td>
                <td align="left">
                	<input type="text"  />
                </td>
            </tr>
            <tr>
            	<td align="right"><span>*&nbsp;</span>性别：</td>
                <td align="left">
                	<input type="radio" name="sex" />男
                    <input type="radio" name="sex" />女
                    
                </td>
            </tr>
            <tr>
            	<td align="right">地区/国家：</td>
                <td align="left">
                	<select name="naction">
                    	<option>中国CHINA</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td align="right"><span>*&nbsp;</span>证件类型：</td>
                <td align="left">
                	<select name="ID_type" >
                    	<option>二代身份证</option>
                        <option>港澳通行证</option>
                        <option>台湾通行证</option>
                        <option>护照</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td align="right"><span>*&nbsp;</span>证件号码：</td>
                <td align="left">
                	<input type="text"  />
                </td>
            </tr>
        </table>
     <p>联系方式</p>
     	<table id="passenger_contact">
        	<tr>
            	<td align="right">手机号码：</td>
                <td align="left">
                	<input type="text"  />
                </td>
            </tr>
            <tr>
            	<td align="right">固定电话：</td>
                <td align="left">
                	<input type="text"  />
                    
                </td>
            </tr>
            <tr>
            	<td align="right">电子邮件：</td>
                <td align="left">
                	<input type="text"  />
                </td>
            </tr>
            <tr>
            	<td align="right">地址：</td>
                <td align="left">
                	<input type="text"  />
                </td>
            </tr>
            <tr>
            	<td align="right">邮编：</td>
                <td align="left">
                	<input type="text"  />
                </td>
            </tr>
        </table>
     <p>附加信息</p>
     	<table>
        	<tr>
            	<td align="right"><span>* </span>旅客类型：</td>
                <td>
                	<select name="pessenger_type">
                    	<option>成人</option>
                        <option>儿童</option>
                        <option>学生</option>
                        <option>残疾军人、伤残人民警察</option>
                    </select>
                </td>
            </tr>
        </table>
        <div id="add_operator">
        	
            	<input type="button" id="submit" value="添加"/>
                <input type="button" id="cancel" value="取消"/>
        </div>
     	
     
</div>



</body>
</html>
