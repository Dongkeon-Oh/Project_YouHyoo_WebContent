<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setCharacterEncoding("utf-8");
String u_id=request.getParameter("u_id");
%>
<html>
	<head>
	</head>
	
	<body>
	
	<form name="writeForm" method="post" action="Q_YouHyooProc.jsp">

	<table width="500" cellspacing="0" cellpadding="5" align="center">
	
	<!-- ID -->
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="qy_id" id="qy_id" size=50 value="<%=u_id%>" readonly>
		</td>
	</tr>	
	
	<!-- 글내용 -->
	<tr>
		<td>글내용</td>
		<td>
		<textarea name="qy_question" id="qy_question" rows="20" cols="50"></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시쓰기">
		</td>
	</tr>
	</table>
	
	</form>
	
	</body>
</html>