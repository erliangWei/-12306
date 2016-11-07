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
<title>未完成订单</title>
<style type="text/css">
*{padding:0; margin:0; font-size:14px; }
#container{ width:770px; padding:0 5px;}
#title{ background:url(../../img/title_bg.gif); height:30px; vertical-align:middle; color:#FFF;border-top-right-radius:5px; border-top-left-radius:5px; font-size:14px;}
#title p { vertical-align:middle;font-size:15px;padding:6px 20px;}
#info{  border: 1px solid #09F;}
#ticket_info{width:750px;  margin:10px auto 0 auto;  font-size:13px; }
#info_title{ height:30px; width:750px; background:#069; border:0; font-weight:bold; padding-right:10px; padding-left:10px; border-top-left-radius:6px; border-top-right-radius:6px;  color:#FFF;}
#more_info{ width:750px; text-align:center; border:1px solid #069;}
#more_info td {border:1px solid #999; padding:5px 0 5px 0; color:#666;}
#more_info span{color:#F63; font-weight:bold;}
#book_result{text-align:right; height:30px; color:#666; font-weight:bold; padding-top:15px; border-bottom:1px dotted #666666;}
#total{margin-right:15px;}
#price{ color:#F63;}
#book_operator {text-align:right; padding:10px 0 100px 0;}
#book_operator input{ background-color:#F63; width:80px; height:30px; color:#fff; border-radius:10px; -moz-border-radius:10px;}
#prompt{ width:750px;  padding:10px 10px; margin-top:10px; background-color:#FFD; border:1px solid #FF0; border-radius:10px; -moz-border-radius:10px; font-size:13px; color:#333;}
</style>
</head>

<body>
<div id="container">

    <div id="title"> <p>未完成订单</p>
    </div>
    <div id="info">
    <div id="ticket_info" >
    	<table id="info_title">
        	<tr >
            	<td width="80px" align="center">订单时间:</td>  
                <td id="book_time"width="100px" align="left">2222-22-22</td>              
                <td id="user" width="150px" align="center"> jiajia</td>
                <td id="route">北京——广州</td>
                <td id="riding_time" align="right">乘车日期:<span>2222-22-22</span></td>
            </tr>
        </table>
        
        <table id="more_info" cellpadding="0" cellspacing="0">
        	<tr>
            	<td width="45px">序号</td>
                <td width="135px">车次信息</td>
                <td width="135px">席位信息</td>
                <td width="135px">旅客信息</td>
                <td width="135px">票款金额</td>
                <td width="135px">车票状态</td>
            </tr>
            <tr>
           		<td>1</td>
                <td><p>2014-10-04 05:08开</p><p>K813 广州-肇庆</p></td>
                <td><p>10厢</p><p>21号下铺</p><p>硬卧</p></td>
                <td><p>jiajia</p><p>二代身份证</p></td>
                <td>成人票<span>70.5元</span></td>
                <td>待支付</td>
            </tr>
        </table>
        <div id="book_result">
        	总张数:<span id="total">1</span>待支付金额:<span id="price">70.5元</span>
        </div>
        <div id="book_operator">
        	<input type="button" id="cancel" value="取消订单" />
            <input type="button" id="certain" value="继续支付" />
        </div>
    </div>
    	
    </div>
    <div id="prompt">
        	<p><b>温馨提示</b></p>
            <P>1.席位已锁定，请在45分钟内完成网上支付。</P>
            <P>2.逾期未支付，系统将取消本次交易。</P>
            <P>3.在完成支付或取消本订单之前，您将无法购买其他车票。</P>            
        </div>
 </div>  
</body>
</html>