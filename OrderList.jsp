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
List<OrderUser_Dto> ouList=mgr.getUser(u_id,sDate,eDate);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".ou_numBt").click(function(){
		var ou_num=eval($(this).text());
		//alert(num);
		
		window.open("OrderDetail.jsp?ou_num="+ou_num,+"예약내역상세","left=600,top=250,width=800,height=500");
	});
	/*
	$(".reviewBt").click(function(){
		var ou_num=eval($(~ this).text());
		alert(ou_num);
		var url="Review.jsp?ou_num="+ou_num+"&rv_pension="+rv_pension+"&u_id="+u_id+"";
		window.open(url,"이용후기","left=600,top=250,width=800,height=500");
	});
	*/
});	
</script>
<link href="MyPage.css" type="text/css" rel="stylesheet">
	<%
	if(!ouList.isEmpty()){%>	
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
		<th>예약번호</th>
		<th>주문날짜</th>
		<th>업소명</th>
		<th>예약자명</th>
		<th>예약상태</th>
		<th>이용후기</th>
	</tr>
	<%
		for(int i=0;i<ouList.size();i++ ){
			OrderUser_Dto ou=ouList.get(i);
			OrderRoom_Dto o=oList.get(i);
			%>
			<tr id="Ordertr">
				<td><span class="ou_numBt"><%=ou.getOu_num() %></span></td>
				<td><%=ou.getOu_date() %></td>
				<td class="pname"><%=o.getO_pname() %></td>
				<td><%=ou.getOu_customer() %>(<%=ou.getOu_cell() %>)</td>
				<td>결제완료</td>		
				<td><a href="#"><span class="bt" onclick="javascript:window.open('Review.jsp?ou_num=<%=ou.getOu_num() %>&rvPnum=<%=o.getO_pnum() %>&rvPname=<%=o.getO_pname()%>&u_id=<%=u_id%>','이용후기','left=600,top=250,width=600,height=650')">이용후기</span></a></td>
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