<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="youhyoo.Q_pension_Dto">
</jsp:useBean>

<%
PensionDao dao=PensionDao.getInstance();
dao.updateAnswer(dto);
response.sendRedirect("List.jsp");
%>