<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");
String u_id=request.getParameter("u_id");
String sDate=request.getParameter("sDate");
String eDate=request.getParameter("eDate");
//예약정보 얻기
IndexMgr mgr=IndexMgr.getInstance();
List<OrderRoom_Dto> oList=mgr.getOrder(u_id,sDate,eDate);
%>
<link href="MyPage.css" type="text/css" rel="stylesheet">
	<%
	if(!oList.isEmpty()){%>	
	<table class="listb">
	<colgroup>
			<col width="8%" />
			<col width="12%" />
			<col width="30%" />
			<col width="25%" />
			<col width="10%" />
			<col width="15%" />
	</colgroup>
	<tr>
		<th>에약번호</th>
		<th>예약일</th>
		<th>업소명</th>
		<th>예약자명</th>
		<th>예약상태</th>
		<th>이용후기</th>
	</tr>
	<%
		for(int i=0;i<oList.size();i++ ){
			OrderRoom_Dto o=oList.get(i);%>
			<tr id="Ordertr">
				<td><%=o.getO_num() %></td>
				<td><%=o.getO_date() %></td>
				<td><%=o.getO_pname() %></td>
				<td><%=o.getO_customer() %>(<%=o.getO_emercall() %>)</td>
				<%
				if(o.getO_state()==true){%>	
				<td>결재완료</td><%
				}else{%>
				<td>결재대기</td>	<%
				}%>
				<td><a href="Review.jsp"><span class="bt">이용후기</span></a></td>
			</tr>
	<%
		}//for
		%>
	</table>
	<%
	}//if	
	else{%>		
		<div class="emptyMsg">최근 예메내역이 존재하지 않습니다.</div>
	<%  
	}//else
	%>