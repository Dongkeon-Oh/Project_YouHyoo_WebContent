<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");
int o_num=Integer.parseInt(request.getParameter("o_num"));

//예약상세정보 얻기
IndexMgr mgr=IndexMgr.getInstance();
OrderRoom_Dto o=(OrderRoom_Dto)mgr.getOrderDetail(o_num);
%>    
<html>
<head>
<title>예약내역상세</title>
<style type="text/css">
table.info{background-color:#d7d7d7; width:100%; border-collapse:separate;}

th { height:33px; background:#F1F1F2 repeat-x; text-align:center; font-weight:bold;}
td {background-color:#FFFFFF; padding:3px 2px 3px 2px; text-align:center;}
table.l{text-align:left;}
</style>
</head>
<body>
<div class="mTitle">고객님의 예약정보는 다음과 같습니다.</div>
<table width="100%">
<tr>
<td>
	<table class="info">
	<colgroup>
			<col width="22%" />
			<col width="78%" />
			
	</colgroup>
		<tr>
			<th>업소명</th>
			<td class="l"><%=o.getO_pname() %></td>		
		</tr>
		<tr>
			<th>예약번호</th>
			<td class="l"><%=o.getO_num() %></td>		
		</tr>
		<tr>
			<th>예약자</th>
			<td class="l"><%=o.getO_customer() %></td>		
		</tr>
		<tr>
			<th>요청사항</th>
			<td class="l"><%=o.getO_request() %></td>		
		</tr>
	</table>
</td>	
</tr>

<tr>
<td>
	<table class="info">
	<colgroup>
			<col width="12%" />
			<col width="27%" />
			<col width="18%" />
			<col width="15%" />
			<col width="13%" />
			<col width="15%" />
	</colgroup>
		<tr>
			<th>객실명</th>
			<th>이용일</th>
			<th>성인/아동/유아</th>
			<th>객실요금</th>
			<th>추가요금</th>
			<th>요금</th>
		</tr>
		<tr>
			<td><%=o.getO_rname() %></td>
			<td>DB에 없음</td>
			<td>DB에 없음</td>
			<td><%=o.getO_price() %></td>
			<td>DB에 없음</td>
			<td>DB에 없음</td>
		</tr>
	</table>
</td>	
</tr>

<tr>
<td>
	<table class="info">
	<colgroup>
			<col width="10%" />
			<col width="23%" />
			<col width="10%" />
			<col width="25%" />
			<col width="10%" />
			<col width="22%" />
	</colgroup>
		<tr>
			<th>결제액</th>
			<td>DB에 없음</td>
			<th>결재방법</th>
			<td>???</td>
			<th>예약상태</th>
			<%
			if(o.getO_state()==true){%>	
			<td>결재완료</td><%
			}else{%>
			<td>결재대기</td>	<%
			}%>
		</tr>
	</table>
</td>	
</tr>
</table>
</body>
</html>