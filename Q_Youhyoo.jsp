<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setCharacterEncoding("utf-8");
String u_id=request.getParameter("u_id");

if(u_id==null){
	u_id=(String)session.getAttribute("u_id");}
if(session.getAttribute("u_id")!=null){

%>
<html>
	<head>
	</head>
	
	<body>
	<center><h2>일대일 상담</h2></center>
	<form name="writeForm" method="post" action="Q_YouHyooProc.jsp">

	<table width="500" cellspacing="0" cellpadding="5" align="center">
	
	<!-- ID -->
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="qy_id" id="qy_id" size=50 value="<%=u_id%>" readonly>
		</td>
	</tr>	
	
	<!-- 글제목 -->
	<tr>
		<td>글제목</td>
		<td>
		<input type="text" name="qy_title" id="qy_title" size="50">
		</td>
	</tr>
	
	<!-- 글내용 -->
	<tr>
		<td>글내용</td>
		<td>
		<textarea name="qy_content" id="qy_content" rows="20" cols="50"></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시쓰기">
			<input type="hidden" name="state" value=<%=request.getParameter("state") %>>
		</td>
	</tr>
	</table>
	
	</form>
	<%

}else{
	%>
	<script>
	alert("로그인 후 이용해 주세요.");
	location.href="Login.jsp";
	</script>
	<%
}

	%>
	</body>
</html>