<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
    
<jsp:useBean id="indexMgr" class="youhyoo.IndexMgr" scope="session"/>

<jsp:useBean id="pensionDto" class="youhyoo.Pension_Dto">
	<jsp:setProperty name="pensionDto" property="*"/>
</jsp:useBean>

<html>
	<body>
	<%
	session.setAttribute("userId", "hollo");
	String userId=(String)session.getAttribute("userId");
	int roomNumber=Integer.parseInt(request.getParameter("pension"));
	System.out.println(userId+"?"+roomNumber);
	indexMgr.setWishlist(userId, roomNumber);
	response.sendRedirect("Index.jsp");
	%>
	</body>
</html>