<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<style type="text/css">
	 .review_table{
	 width: 550px;
	
	 border-collapse: collapse;
	 border-color: #BDBDBD;
	 border-width: 0;
	 color: #5D5D5D;
	 }
	 
	 th{
	 color: black;
	 width:150
	 }
	
	</style>
	</head>
	
	<body>
	<h1>질문작성</h1>
	<font size="2" color="red">
	근거없는 비방/욕설 혹은 질문답변 성격에 맞지 않는 내용인 경우 사전 통보없이 삭제됩니다.<br>
	질문 등록시 담당자 휴대폰으로 등록 내역이 전송됩니다. 최대한 빠른 답변을 위해 최선을 다하겠습니다.<br>
	근무시간 외 문의는 답변시간이 지연될수 있는점 양해 부탁드립니다.<br>
	</font>
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