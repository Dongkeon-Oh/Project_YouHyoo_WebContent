<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id=dto class="youhyoo.User_Dto">
 <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<%
User_Dao dao=User_Dao.getInstance(); //dao객체 얻기 
dao.insertMember(dto); //메소드 호출
response.sendRedirect("Login.jsp");
%>