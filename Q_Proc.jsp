<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>

<%
int num=Integer.parseInt(request.getParameter("qp_num"));

PensionDao dao=PensionDao.getInstance();
Q_pension_Dto dto=dao.ViewsIncrease(num);

%>

{"view":"<%=dto.getQp_view() %>"}