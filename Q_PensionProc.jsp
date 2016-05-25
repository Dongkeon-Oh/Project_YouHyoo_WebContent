<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
String p_num=request.getParameter("p_num");
%>
<jsp:useBean id="dto" class="youhyoo.Q_pension_Dto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
PensionDao dao=PensionDao.getInstance();
dao.insertQuestion(dto);
//response.sendRedirect("Detailview.jsp?p_num=");
%>
<script>
history.back(-1);
</script>