<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="youhyoo.Q_Youhyoo_Dto">
	<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>


<%
PensionDao dao=PensionDao.getInstance();
dao.Q_ToYouHyoo(dto);
System.out.println(request.getParameter("state")+"asdf");
if(request.getParameter("state").equals("top")){
	response.sendRedirect("MyPage.jsp");
}else{
%>
<script>
window.close();
</script>
<%} %>
