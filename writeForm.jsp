<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	</head>
	
	<body>
	<center><h2>Q_pension</h2></center>
	
	<form name="writeForm" method="post" action="writeProc.jsp">

	<table width="500" cellspacing="0" cellpadding="3"
	align="center">
	
	
	<!-- ID -->
	<tr>
		<td>ID</td>
		<td>
			<input type="text" name="qp_id" id="qp_id" size=40>
		</td>
	</tr>	
	<!-- 글제목 -->
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="qp_title" id="qp_title" size=40>
		</td>
	</tr>
	
	<!-- 글내용 -->
	<tr>
		<td>글내용</td>
		<td>
		<textarea name="qp_question" id="qp_question" rows="20" cols="45"></textarea>
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