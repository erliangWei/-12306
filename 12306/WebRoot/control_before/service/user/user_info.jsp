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

  <title>个人信息</title>
<style type="text/css">
*{padding:0; margin:0; font-size:14px;}
#container{ width:770px; padding:0 5px;}
#title{ background:url(../../img/title_bg.gif); height:30px; vertical-align:middle; color:#FFF; border-top-right-radius:5px; border-top-left-radius:5px; /* Old Firefox */}
#title p { vertical-align:middle;font-size:15px;padding:6px 20px;}
table{width:760px; padding: 0 5px;margin-bottom:20px;}
#info{padding-top:5px;  border: 1px solid #09F;}
.editor{width:60px; height:25px;}
hr{border: dashed 1px #999 ;}
.info_title{ text-align:right;  }
.info_title span{color:#f00; padding-right:10px;}
.info_content{ text-align:left;}
#base_info td ,#contact_info td{width:50%; height:20px;}
</style>



</head>

<body>
<div id="container">
    <div id="title"> <p>个人信息</p>
    </div>
    <div id="info">
    	<table>  
        	<tr>
            	<th align="left" width="70px">基本信息</th>
                <th><hr /></th>
                <th align="right" width="65px">
                	<input type="button" value="编辑" class="editor"/>
                </th>
            </tr>
            <tr>
            	<table id="base_info">
                	<tr><td class="info_title"><span>*</span>用户名：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title"><span>*</span>姓名：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title"><span>*</span>性别：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title">国家/地区：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                  
                	<tr><td class="info_title"><span>*</span>证件类别：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title"><span>*</span>证件号码：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                  
                    <tr><td class="info_title">出生日期：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title">核验状态：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                </table>
            </tr>
        </table>
        
        <table>  
        	<tr>
            	<th align="left" width="70px">联系方式</th>
                <th><hr /></th>
                <th align="right" width="65px">
                	<input type="button" value="编辑" class="editor"/>
                </th>
            </tr>
            <tr>
            	<table id="contact_info">
                	<tr><td class="info_title"><span>*</span>手机号码：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title">固定电话：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title">电子邮件：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                    
                    <tr><td class="info_title">地址：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                  
                	<tr><td class="info_title">邮编：</td>
                    	<td class="info_content">jiajia</td>
                    </tr>
                </table>
            </tr>
        </table>
      
    </div>
</div>
</body>
</html>