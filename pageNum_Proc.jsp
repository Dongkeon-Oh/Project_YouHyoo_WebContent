<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
int pageNum=Integer.parseInt(request.getParameter("p_num,i"));
%>
{"pageNum":"<%=pageNum %>"}