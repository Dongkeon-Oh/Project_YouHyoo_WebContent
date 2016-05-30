<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
session.invalidate();
%>
<html>
<body>
<script>
alert("로그아웃되었습니다! 이용해 주셔서 감사합니다");
location.href='Index.jsp';
</script>
</body>
</html>