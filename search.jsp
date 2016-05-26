<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript">
 
 </script>
</head>
<body>
<form method=post name=searchForm action="search_Proc.jsp">
 <div align=center>
  <a href="Index.jsp"><img src="imgs/top/youhyoo.PNG" width=300></a>
  <table align=center width=750 cellspacing=0 cellpadding=3>
   <tr>
    <td colspan=2 height=30><h3>아이디 찾기</h3>
      가입시 작성한 이름과, 핸드폰번호를 입력하신후 찾기 버튼을 클릭하세요.</td>
   </tr>
   
   <tr>
    <td>이름</td>
    <td>
     <input type=text name=u_name id=u_name style="font-size:12pt; padding:5px 40px 5px 5px; margin-top: 5">
    </td>
   </tr>
   
   <tr>
    <td>핸드폰</td>
    <td>
     <input type=text name=u_cell1 id=u_cel1l maxlength="3" size="4" style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5"> -
     <input type=text name=u_cell2 id=u_cell2 maxlength="4" size="4" style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5"> -
     <input type=text name=u_cell3 id=u_cell3 maxlength="4" size="4" style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5">
     <input type=submit value=찾기 style="border-radius:4px; font-size:12pt; padding:5px 5px 5px 5px; margin-left:5">
    </td>
   </tr>
  </table>
 </div>
 </form>
 
 
 <form method=post name=searchForm action="search_Proc.jsp">
 <div>
  <table align=center width=750 cellspacing=0 cellpadding=3>
   <tr>
   <br><br><br><br>
    <td colspan=2 height=30><h3>비밀번호 찾기</h3>
       아이디와 이름을 입력 후 찾기버튼을 클릭하세요.<br>
        임시 비밀번호를 생성하여 가입시 등록된 휴대폰으로 전송해드립니다.
    </td>
   </tr>
   
   <tr>
    <td>아이디</td>
    <td>
     <input type=text name=u_id id=u_id style="font-size:12pt; padding:5px 40px 5px 5px; margin-top:5">
    </td>
   </tr>
   
   <tr>
    <td>이름</td>
    <td>
     <input type=text name=u_name id=u_name style="font-size:12pt; padding:5px 40px 5px 5px; margin-top: 5">
     <input type=submit value=찾기 style="border-radius:4px; font-size:12pt; padding:5px 5px 5px 5px; margin-left:5">
    </td>
   </tr>
  </table>
 </div>
</form>
<footer style="text-align:center;">
 <p>ⓒYou休</p>
</footer>
</body>
</html>
