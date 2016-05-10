<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%--writePro.jsp --%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mgr" class="youhyoo.Mgr">
	<jsp:setProperty name="mgr" property="*"/>
</jsp:useBean>

<%
mgr.qp_pension(request.getRemoteAddr());

Dao dao=Dao.getInstance();
dao.insertArticle(mgr);
response.sendRedirect("list.jsp");
%>
