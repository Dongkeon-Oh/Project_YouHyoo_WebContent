<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<%
request.setCharacterEncoding("utf-8");

String id=(String)session.getAttribute("u_id");
User_Dao dao=User_Dao.getInstance(); //dao 객체 얻기 
User_Dto dto=dao.getUser(id);
%>
<html>
<head>
 <link href="TopBottom.css" type="text/css" rel="stylesheet">
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript">
 function begin(){
	 document.delForm.u_pwd.focus();
 }
 function checkIt(){
	 if(!document.delForm.u_pwd.value){
		 alert("비밀번호를 입력하시오");
		 document.delForm.u_pwd.focus();
		 return false;
	 }
 }
 </script>
</head>
<body>
<%@ include file="Top.jsp" %>
 <div align=center>
  <form style="margin-top: 10" method=post name=delForm action="Delete_Proc.jsp">
   <table align=center width=750 cellspacing=0 cellpadding=3>
    <tr>
     <td colspan=2 height=30>
      <h3>회원탈퇴</h3>
      <p>회원탈퇴 동시에 고객님과 관련된 회원정보는 모두 영구 삭제되며 복구 할 수 없습니다.<br>
         탈퇴사유를 입력해주시면 보다 좋은 서비스를 위해 노력하겠습니다.</p>
     </td>
    </tr>
   </table>
   <table border=1 align=center width=750 cellspacing=0 cellpadding=3>
     <tr>
     <td>아이디</td>
     <td>
      <%=dto.getU_id()%>
     </td>
    </tr>
    <tr>
     <td width=150>비밀번호</td>
     <td>
      <input type=password name=u_pwd size=15>
     </td>
    </tr>
    <tr>
     <td colspan=2 align=right>
      <input type=submit value=탈퇴하기>
     </td>
    </tr>
   </table>
  </form>
 </div>
 <%@ include file="Bottom.html" %>
</body>
</html>