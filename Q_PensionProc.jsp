<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
int p_num=Integer.parseInt(request.getParameter("p_num"));
%>
<jsp:useBean id="dto" class="youhyoo.Q_pension_Dto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
PensionDao dao=PensionDao.getInstance();
dao.insertQuestion(dto, p_num);
//response.sendRedirect("Detailview.jsp?p_num=");
%>
<script>
history.back(-1);
</script>