<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dto" class="youhyoo.User_Dto">
 <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<html>
 <body>
 <%
 String id=(String)session.getAttribute("u_id");
 dto.setU_id(id); //모델빈에 setter
 String c=request.getParameter("u_cell1");
 c=c+request.getParameter("u_cell2");
 c=c+request.getParameter("u_cell3");
 dto.setU_cell(c);
 User_Dao dao=User_Dao.getInstance(); //dao 객체 얻기 
 dao.updateUser(dto); //dao 메소드 호출 
 %>
 <script>
	alert("회원수정이 완료 되었습니다.");
	location.href='MyPage.jsp';
 </script>
 </body>
</html>