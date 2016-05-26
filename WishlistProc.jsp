<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
    
<%
String userId=(String)session.getAttribute("u_id");
int roomNumber=Integer.parseInt(request.getParameter("pension"));

IndexMgr indexMgr=IndexMgr.getInstance();
if(indexMgr.checkWishlist(userId, roomNumber)){
	indexMgr.setWishlist(userId, roomNumber);
	response.sendRedirect("MyPage.jsp");
}else{
%>
	<script>
		alert("이미 찜리스트에 있는 펜션입니다.");
		history.back();
	</script>
<%	
}
%>