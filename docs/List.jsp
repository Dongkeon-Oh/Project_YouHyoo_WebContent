<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="board.*"
    %>
<jsp:useBean id="dao" class="board.BoardDao"/>
<%
Vector<BoardDto> vec=dao.getList();//빈즈에서 자료를 받는다

request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<style type="text/css">
	.aft{display: none}
	a.link { cursor:pointer; }
	
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(function GetUseAfter()
{
	jQuery(".link").click(function(){
		
		var aft = jQuery(this).attr("aft_count");
		var trdes = jQuery(this).closest("tr").next();
			
		jQuery("#tblUseAfter tr.aft").hide();		//모두 감추기

		if(jQuery(".aft").attr("abc") == aft)
		{
			jQuery(".aft").attr("abc","");
			trdes.hide();		
		}
		else
		{
			jQuery(".aft").attr("abc",aft);
			trdes.show();	
		}			
		
	});
});
</script>
</head>
	<body bgcolor="orange">
		<center><h2>+++ 게시판 리스트 +++</h2></center>
		
		<table  align="center" width="530" border=1 cellpadding=1 cellspacing=0>
		<tr>
			<td align=right>
			<a href="WriteForm.jsp">
			<img src="imgs/write.gif" alt="새글" border="0">
			</a>
			</td>
		</tr>
		</table>

		<table id="tblUseAfter" align="center" border=10 width=530>
			<tr bgcolor="cyan" height="20">
				<td align="center" width="50">번호</td>
				<td align="center" width="185">글제목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="103">작성일</td>
				<td align="center" width="63">조회수</td>
			</tr>
			<%
			for(int i=0; i<vec.size(); i++){
				BoardDto dto=(BoardDto)vec.get(i);
			%>
				<tr>
					<td><%=dto.getNum() %></td>
					<%-- <td><%=subject %></td> --%>
					<!-- 제목을 클릭하면 글내용 보기로 가기 -->
					<td>
						<a class="link" aft_count="<%=dto.getNum() %>">
						<%=dto.getSubject() %>
						</a>
					</td>
					
					<td><%=dto.getWriter() %></td>
					
					<td><%=dto.getWdate() %></td>
					
					<td><%=dto.getReadcount() %></td>
				</tr>
				<tr class="aft">
					<td colspan=5>
					<%=dto.getContent() %>
					</td>
				</tr>
				<%
			}//for end
			%>
		</table>
	</body>
</html>



