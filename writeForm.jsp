<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
	<head>
	<script type="text/javascript">
	function writeSave(){
		if($("#writer").val()==''){
			alert("이름을 입력하세요");
			$("#writer").focus();
			return false;
		}
		if($("#subject").val()==''){
			alert("제목을 입력하세요");
			$("#subject").focus();
			return false;
		}
		if($("#content").val()==''){
			alert("글내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		if($("#passwd").val()==''){
			alert("비번을 입력하세요");
			$("#passwd").focus();
			return false;
		}
	}//writeSave end
	</script>
	</head>
	<%
	int num=0;
	int ref=-1;
	int re_step=0;
	int re_level=0;
	String regdate="";
	
	try{
		if(request.getParameter("num")!=null){
			num=Integer.parseInt(request.getParameter("num"));
			ref=Integer.parseInt(request.getParameter("ref"));
			re_step=Integer.parseInt(request.getParameter("re_step"));
			re_level=Integer.parseInt(request.getParameter("re_level"));
			System.out.println(num+ref+re_step+re_level);
		}//if
	}catch(Exception ex){}
	
	%>
	<body>
	<center><h2>Q_pension</h2></center>
	
	<form name="writeForm" method="post" action="writeProc.jsp"
	onSubmit="return writeSave()">
	
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="re_step" value="<%=re_step %>">
	<input type="hidden" name="re_level" value="<%=re_level %>">
	
	<table width="500" cellspacing="0" cellpadding="3"
	align="center">
	
	<tr>
		<td align="right" colspan="2">
			<a href="list.jsp">글목록</a>
		</td>
	</tr>
	
	<!-- 글제목 -->
	<tr>
		<td>제목</td>
		<td>
		<%if(request.getParameter("num")==null){%>
			<input type="text" name="subject" id="subject" size=40>
			
		<%}else{%>
			<input type="text" name="subject" id="subject" size=40 value="[답변]">
		
		<%}%>
		</td>
	</tr>
	
	<!-- 글내용 -->
	<tr>
		<td>글내용</td>
		<td>
	<textarea name="content" id="content" rows="20" cols="45"></textarea>
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