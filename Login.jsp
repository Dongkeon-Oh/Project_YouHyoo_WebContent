<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>  	
  <script type="text/javascript">
   function check(){
	   if(document.loginForm.u_id.value==''){
		   alert("아이디를 입력하세요");
		   document.loginForm.u_id.focus();
		   return false;
	   }
	   if(document.loginForm.u_pwd.value==''){
		   alert("비밀번호를 입력하세요");
		   document.loginForm.u_pwd.focus();
		   return false;
	   }
   }
  </script>
  </head>
  <body align=center>
  <img src="imgs/top/youhyoo.PNG" width=200> 
  <form name=loginForm method=post action=Login_Proc.jsp onsubmit="return check()">
   <table align=center>   
    <tr>
     <td align=center>
      <input type=text name=u_id placeholder="아이디">
     </td>
     
     <td rowspan=2 align=center>
      <input type="submit" value=로그인 style="width: 60px; height: 60px">
     </td>
    </tr>
    
    <tr>
     <td align=center>
      <input type=password name=u_pwd placeholder="비밀번호">
     </td>
    </tr>
    
    <tr>
     <td align=left>
      <input type="checkbox" value=memid>
      	아이디저장
     </td>
    </tr>
    <tr>
     <td colspan=2 align=center>
      <a href="Join.jsp">회원가입</a> |
      <a href="aaa.jsp">아이디/비밀번호찾기</a>
     </td>
    </tr>
   </table>
  </form>
  </body>
</html>