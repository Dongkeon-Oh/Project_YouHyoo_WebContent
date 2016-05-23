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
 
 function checkIt(){
	 var join=eval("document.joinForm");
 
	 if(joinForm.u_name.value==''){
		 alert("이름은 필수 입력입니다");
		 joinForm.u_name.focus();
		 return false;
	 }
	 if(joinForm.u_pwd.value==''){
		 alert("pwd는 필수 입력입니다");
		 joinForm.u_pwd.focus();
		 return false;
	 }
	 if(joinForm.u_cell1.value==''){
		 alert("핸드폰번호를 입력하시오");
		 joinForm.u_cell1.focus();
		 return false;
	 }
	 if(joinForm.u_cell2.value==''){
		 alert("핸드폰번호를 다시 입력하시오");
		 joinForm.u_cell2.focus();
		 return false;
	 }
	 if(joinForm.u_cell3.value==''){
		 alert("핸드폰번호를 전부 입력하시오");
		 joinForm.u_cell3.focus();
		 return false;
	 }
	 if(joinForm.u_zipcode.value==''){
		 alert("우편번호를 입력하시오");
		 joinForm.u_zipcode.focus();
		 return false;
	 }
	 if(joinForm.u_addr.value==''){
		 alert("주소를 입력하시오");
		 joinForm.u_addr.focus();
		 return false;
	 }
	 if(join.u_birth.value==''){
		 alert("생년월일을 입력하세요");
		 joinForm.u_birth.focus();
		 return false;
	 }
	 if(join.u_email.value==''){
		 alert("이메일을 입력하세요");
		 joinForm.u_email.focus();
		 return false;
	 }
	 return true;
 }//checkIt()
 </script>
</head>
<body>
<%@ include file="Top.jsp" %>
<div align=center>
 <form name="joinForm" style="margin-top: 10" method=post name=modiForm action="Modify_Proc.jsp" onsubmit="return checkIt()">
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
    <td><%=dto.getU_id()%></td>
   </tr>
   
   <tr>
    <td>사용자 이름</td>
    <td>
     <input type=text name=u_name size=10 value="<%=dto.getU_name()%>">
    </td>
   </tr>
   
   <tr>
    <td>비밀번호</td>
    <td><input type="password" name="u_pwd" size=20></td>
   </tr>
    
   <tr>
    <td>핸드폰</td>
    <%
    String fullCell=dto.getU_cell();
    String c1=fullCell.substring(0, 3);
    String c2=fullCell.substring(3, 7);
    String c3=fullCell.substring(7);
    %>
    <td>
     <input type=text name=u_cell1 maxlength="3" size="4" value="<%=c1 %>"> -
     <input type=text name=u_cell2 maxlength="4" size="4" value="<%=c2 %>"> -
     <input type=text name=u_cell3 maxlength="4" size="4" value="<%=c3 %>">
    </td>
   </tr>
   
   <!-- 우편번호 -->
   <tr>
   <td>우편번호</td>
    <td>
     <input type=text name=u_zipcode size=7 value="<%=dto.getU_zipcode()%>">
     <input type=button value="우편번호" onclick="zipCheck()">
    </td>
   </tr>
   
   <!-- 주소 -->
   <tr>
    <td>주소</td>
    <td>
     <input type=text name=u_addr size=40 value="<%=dto.getU_addr()%>">
    </td>
   </tr>
   
   <tr>
    <td>생년월일</td>
    <td>
     <input type=text name=u_birth size=6 value="<%=dto.getU_birth()%>">
    </td> 
   </tr>
   <tr>
   
   <!-- 이메일 -->
   <tr>
    <td>이메일</td>
    <td>
     <input type=text name=u_email size=40 value="<%=dto.getU_email()%>">
    </td>
   </tr>  
   
   <tr>
    <td colspan=2 align=right>
     <input type=submit value=회원정보수정>
     <input type=button value=회원탈퇴신청 onclick="location='Withdrawal.jsp'">
    </td>
   </tr>
   </table> 
 </form>
</div>
 <%@ include file="Bottom.html" %>
</body>
</html>