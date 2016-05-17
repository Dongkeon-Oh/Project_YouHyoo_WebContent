<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<%
request.setCharacterEncoding("utf-8");
String u_id=request.getParameter("u_id");
String u_pwd=request.getParameter("u_pwd");

User_Dao dao=User_Dao.getInstance(); //dao 객체 얻기 
int check=dao.userCheck(u_id, u_pwd); //dao 메소드 호출 

if(check==1){
	session.setAttribute("u_id", u_id);
	response.sendRedirect("Index.jsp");
}else{
	%>
	<script>
	 alert("다시 로그인하세요");
	 history.back();
	</script>
	<%
}
%>