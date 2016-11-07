<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>My JSP 'query_ticket.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<title>余票查询</title>
</head>
<style type="text/css">
*{margin:0;padding:0;}
body{ font-size:12px;}
#query_info{ border:2px solid #0FF; height:60px;}
table{margin:auto; width:1000px;  vertical-align:middle; }
#single_both div input{margin:5px 3px 0px 15px;}
#role div input{margin:5px 3px 0px 15px;}
#where_date input{ width:120px; margin:auto 5px;}
#choice_info{margin-top:10px;}
#choise_other{ border:2px solid #0FF; padding:5px 10px;}
#choise_other th{font-size:13px; text-align:left; padding:5px 0 3px 0;}
#choice_date td{ border: 1px solid #999; text-align:center; height:20px; }

#query_result{border:2px solid #0FF;margin-top:10px;}
#query_result td,#query_result th{ border:1px inset #999;}
#query_resule_title{ background-color:#09C; color:#fff; }



</style>

<body id="container">
	<table id="query_info">
    	<tr>
            <td id="where_date" style="width:600px;" align="center">
            	出发地<input type="text" id="leave_addr"  />
                目的地<input type="text" id="arrive_addr"  />
                出发日<input type="text" id="leave_date"  />
               
             
            </td>
           
            <td>
            	<input type="button" value="查询" style="width:90px; height:30px;" />
                <input type="button" value="查询学生票" style="width:90px; height:30px;" />
            </td>
        </tr>
    </table>
    
    <table id="choice_info" cellspacing="0">
    	<tr><td>
        <table  cellspacing="0"><tr id="choice_date" >
                <td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td><td>10-11</td> 
        </tr></table></td></tr>
        
        <tr><td>
        <table id="choise_other">
            <tr class="choice_info_title"><th>车次类型</th></tr>
            <tr><td>
                <input type="button" value="全部"/>
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>GC-高铁/城
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>D-动车
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>Z-直达
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>T-特快
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>K-快速
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>其他
            </td></tr>
            
            <tr class="choice_info_title"><th>出发车站</th></tr>
            <tr><td>
                <input type="button" value="全部"/>
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>广州
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>广州东
            </td></tr>
            
            <tr class="choice_info_title"><th>到达车站</th></tr>
            <tr><td>
                <input type="button" value="全部"/>
                <input type="checkbox" name="train_type" value="" style="margin:0 10px 0 20px;"/>肇庆
            </td></tr>
            
        </table></td></tr>
        
        <tr><td>
       	<table id="query_result" cellspacing="0" >
        	<tr id="query_resule_title" align="center">
            	<th>车次</th>
                <th>出发站<br/>到达站</th>
                <th>出发时间<br/>到达时间</th>
                <th>历时</th>
                <th>商务座</th>
                <th>特等座</th>
                <th>一等座</th>
                <th>二等座</th>
                <th>高级<br/>软卧</th>
                <th>软卧</th>
                <th>硬卧</th>
                <th>软座</th>
                <th>硬座</th>
                <th>无座</th>
                <th>其他</th>
                <th>备注</th>
            </tr>
        </table>
        
        
        </td></tr>
        
        
    </table>

</body>
</html>
