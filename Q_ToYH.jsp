<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="Index.css" type="text/css" rel="stylesheet">
	<title>Q_ToYH.jsp</title>
	</head>
	<body>
	<%@ include file="Top.jsp" %>
	<form name="Q_ToYH" method="post" action="Q_ToYHproc.jsp">
	<table width="500" cellspacing="0" cellpadding="3"
	align="center">
		
		<!-- ID -->
		<tr>
			<td>ID</td>
			<td>
				<input type="text" name="qy_id" id="qy_id" size="70">
			</td>
		</tr>
		
		<!-- 글내용 -->
		<tr>
			<td>글내용</td>
			<td>
			<textarea name="qy_question" id="qy_question" rows=20 cols=75></textarea>
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
	<br>
	<br>
	<br>
	<%@ include file="Bottom.html" %>
	</body>
</html>