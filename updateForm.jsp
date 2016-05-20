<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
	<head>
	<script type="text/javascript"></script>
	</head>
	<%
	String a = request.getParameter("qp_num");
	if(a==null){
		a="0";
	}
	int num=Integer.parseInt(a);
	String pageNum=request.getParameter("pageNum");
	
	try{
		PensionDao dao=PensionDao.getInstance();
		Q_pension_Dto dto=dao.updateGetPension(num);
	%>
	
	<body>
	
	
	<form name="writeForm" method="post" action="updateProc.jsp?pageNum=<%=pageNum %>">
		<table width="400" border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="70" align="center">ID</td>
			<td width="330">
				<input type="text" name="qp_id" id="qp_id" size="10" value="<%=dto.getQp_id() %>">
				<input type="hidden" name="qp_num" value="<%=num %>">
			</td>
		</tr>
		
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" name="qp_title" id="qp_title" size="30" value="<%=dto.getQp_title() %>">
			</td>
		</tr>
		
		<tr>
			<td align="center">글내용</td>
			<td>
				<textarea name="qp_question" id="qp_question" rows=10 cols=40><%=dto.getQp_question() %></textarea>
			</td>
		</tr>
		</table>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글수정">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기"
				onClick="document.location='List.jsp?pageNum=<%=pageNum %>'">
			</td>
		</tr>
	</form>
	</body>
	<%	
	}catch(Exception ex){}
	%>
</html>