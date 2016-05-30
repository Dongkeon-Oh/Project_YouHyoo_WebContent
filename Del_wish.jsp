<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");

String u_id=request.getParameter("u_id");
int p_num=Integer.parseInt(request.getParameter("pnum"));

//위시리스트 삭제
IndexMgr mgr=IndexMgr.getInstance();
mgr.delWishlist(u_id,p_num);
%>
<script>
	alert("찜리스트에서 제거 되었습니다.");
	location.href='MyPage.jsp';
</script>
 
