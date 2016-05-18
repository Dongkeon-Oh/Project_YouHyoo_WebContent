<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");
//String u_id=(String)session.getAttribute("u_id");
String u_id=request.getParameter("u_id");
int p_num=Integer.parseInt(request.getParameter("pnum"));

IndexMgr mgr=IndexMgr.getInstance();
mgr.delWishlist(u_id,p_num);

response.sendRedirect("MyPage.jsp");
%>    
