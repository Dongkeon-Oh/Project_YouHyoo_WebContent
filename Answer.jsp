<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Answer.jsp</title>
	<script type="text/javascript">
	function answerSave(qp_answer){
		document.answerSave.qp_answer.value=qp_answer;
		document.answerSave.submit();
	}
	</script>
	</head>
	<%
	String qp_answer=request.getParameter("qp_answer");
	%>
	<body>
		<form name="AnswerForm" method="post" action="AnswerProc.jsp"
		onSubmit="return answerSave()">
		<table width=1000 align=left>
			<tr>
				<td><textarea name="qp_answer" rows="10" cols="30"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" align=center onClick="AnswerProc.jsp"></td>
			</tr>
		</table>
		<input type="hidden" name="qp_answer" value="<%=qp_answer %>">
		</form>
	</body>
</html>