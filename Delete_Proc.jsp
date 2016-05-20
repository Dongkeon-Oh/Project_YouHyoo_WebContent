<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<html>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("u_id");
String u_pwd=request.getParameter("u_pwd");

User_Dao dao=User_Dao.getInstance();
int check=dao.deleteUser(id,u_pwd);
response.sendRedirect("Index.jsp");
if(check==1){
	session.invalidate(); //세션무효화
}else if(check==0){
	%>
	<script>
	alert("비밀번호가 틀립니다");
	history.back();
	</script>
	<%
}else if(check==-1){
	%>
	<script>
	alert("존재하지 않는다");
	history.back();
	</script>
	<%
}
%>
</head>
</html>
