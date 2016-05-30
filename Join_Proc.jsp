<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
request.getParameter("u_type");
//System.out.println(request.getParameter("u_type"));
%>
<jsp:useBean id="dto" class="youhyoo.User_Dto">
 <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
<html>
<body>
<%
String c=request.getParameter("u_cell1");
c=c+request.getParameter("u_cell2");
c=c+request.getParameter("u_cell3");
dto.setU_cell(c);
User_Dao dao=User_Dao.getInstance(); //dao객체 얻기 
dao.insertMember(dto); //메소드 호출
%>
<script>
alert("환영합니다! 가입이 되었습니다!");
location.href='Login.jsp';
</script>
</body>
</html>