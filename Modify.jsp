<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="youhyoo.*" %>
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
 
 function zipCheck(){
	 url="Zipcheck.jsp?check=y";
	 window.open(url,"zip","width=500,height=300,status=yes,scrollbars=yes");
 }
 </script>
</head>
<body>
<%@ include file="Top.jsp" %>
<div align=center>
 <form style="margin-top: 10" method=post name=modiForm action=Modify_Proc.jsp>
  <table align=center width=750 cellspacing=0 cellpadding=3>
   <tr>
    <td colspan=2 height=30>
     <h3>회원정보수정</h3>
     <p> 고객님의 비밀번호, 이메일, 핸드폰 정보를 변경 하실 수 있습니다.<br></p>
	</td>
   </tr>
   </table>
   
   <table border=1 align=center width=750 cellspacing=0 cellpadding=3>
   <tr> 
    <td width=150>아이디</td>
    <td><%=dto.getU_id()%>
    </td>
   </tr>
   
   <tr>
    <td>사용자 이름</td>
    <td>
     <input type=text name=u_name size=10 value=<%=dto.getU_name()%>>
    </td>
   </tr>
   
   <tr>
    <td>새 비밀번호</td>
    <td><input type="password" name="u_pwd" size=20></td>
   </tr>
    
   <tr>
    <td>핸드폰</td>
    <td>
     <input type=text name=u_cell1 maxlength="3" size="4"> -
     <input type=text name=u_cell2 maxlength="4" size="4"> -
     <input type=text name=u_cell3 maxlength="4" size="4">
    </td>
   </tr>
   
   <!-- 우편번호 -->
   <tr>
   <td>우편번호</td>
    <td>
    <%
    String im="";
    im=dto.getU_zipcode();
    if(im==null){
    	im="";
    }
    %>
     <input type=text name=u_zipcode size=7 value=<%=im%>>
     <input type=button value="우편번호" onclick="zipCheck()">
    </td>
   </tr>
   
   <!-- 주소 -->
   <tr>
    <td>주소</td>
    <td>
    <%
    im=dto.getU_addr();
    if(im==null){
    	im="";
    }
    %>
     <input type=text name=u_addr size=40 value=<%=im%>>
    </td>
   </tr>
   
   <!-- 생년월일 -->
   <tr>
    <td>생년월일</td>
    <td>
     <input type=text name=u_birth size=6 value=<%=dto.getU_birth()%>>
    </td> 
   </tr>
   <tr>
    <td>이메일</td>
    <td>
    <%
    im=dto.getU_email();
    if(im==null){
    	im="";
    }
    %>
     <input type=text name=u_email size=40 value=<%=im%>>
    </td>
   </tr>  
   
   <tr>
    <td colspan=2 align=right>
     <input type=submit value=회원정보수정>
     <input type=button value=회원탈퇴신청 onclick="location='Delete.jsp'">
    </td>
   </tr>
   </table> 
 </form>
</div>
 <%@ include file="Bottom.html" %>
</body>
</html>