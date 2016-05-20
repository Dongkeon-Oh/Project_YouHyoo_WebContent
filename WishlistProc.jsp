<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
    

<%
String userId=(String)session.getAttribute("u_Id");
int roomNumber=Integer.parseInt(request.getParameter("pension"));
System.out.println(userId+"?"+roomNumber);

IndexMgr indexMgr=IndexMgr.getInstance();
indexMgr.setWishlist(userId, roomNumber);
response.sendRedirect("MyPage.jsp");
%>