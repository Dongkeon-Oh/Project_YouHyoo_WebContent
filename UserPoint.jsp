<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="youhyoo.*"
    import="java.util.*"
    %>  
<%
request.setCharacterEncoding("utf-8");
String u_id=request.getParameter("u_id");

IndexMgr mgr=IndexMgr.getInstance();
List<OrderRoom_Dto> poList=mgr.getPoint(u_id);
List<OrderUser_Dto> uList=mgr.getPuser(u_id);

int sum=0;
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
table.info{background-color:#d7d7d7; width:100%; border-collapse:separate;}

.l th { height:33px; background:#F1F1F2 repeat-x; text-align:center; font-weight:bold;}
.l td {background-color:#FFFFFF; padding:3px 2px 3px 2px; text-align:center;}
table .l{text-align:left;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>적립금내역~!</title>
</head>
<body>
<h3>적립금 내역</h3>
적립금은 사이트내에서 현금처럼 사용이 가능합니다.<br>
적립금은 3년간 유효합니다.<br>
적립금은 숙박이용일이 지나면 자동 적립됩니다.<br>
베스트 이용후기 등의 각종이벤트의 추첨에 의해 적립금을 드리고 있습니다.<br><br>

<hr>
<table width=100% class=info>
<tr>
<td>
	<table width="100%" class=l>
	<colgroup>
		<col width="20%" />
		<col width="40%" />
		<col width="40%" />
	</colgroup>
	<tr>
		<th>일자 </th>
		<th>예약번호</th>
		<th>적립액</th>
	</tr>
	
	<%
	if(uList.size()>0){
		
		for(int i=0;i<poList.size();i++ ){
			OrderRoom_Dto or=poList.get(i);
			OrderUser_Dto ou=uList.get(i);
		%>	
		<tr>
			<td><%=ou.getOu_date()%></td>
			<td><%=ou.getOu_num() %></td>
			<td><%=or.getO_price() %></td>
		</tr>
		<%
		}//for
	}//if
	else{
	%>
	<tr>적립 내역이 없습니다.</tr>
	<%	
	}///else%>
	</table>
<td>	
<tr>
</table>	
</body>
</html>