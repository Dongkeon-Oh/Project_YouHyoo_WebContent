<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="youhyoo.User_Dto">
 <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<html>
 <body>
 <%@ include file="Top.jsp" %>
 <%
 String id=(String)session.getAttribute("u_id");
 dto.setU_id(u_id); //모델빈에 setter
 
 User_Dao dao=User_Dao.getInstance(); //dao 객체 얻기 
 dao.updateUser(dto); //dao 메소드 호출 
 response.sendRedirect("MyPage.jsp");
 %>
 <%@ include file="Bottom.html" %>
 </body>
</html>