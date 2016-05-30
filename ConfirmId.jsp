<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.User_Dao"%>
<% 
request.setCharacterEncoding("utf-8");
%>
<%
String u_id=request.getParameter("u_id");
System.out.println(u_id);
youhyoo.User_Dao dao=User_Dao.getInstance(); 
int check=dao.confirmId(u_id);
%>
<html>
 <head>
  <script type="text/javascript">
  function setId(){
	  opener.document.joinForm.u_id.value="<%=u_id%>";
	  opener.document.joinForm.checkid.value="1";
	  self.close(); 
  }
  
  </script>
 </head>
 <body align=center>
 <img src="imgs/top/youhyoo.PNG" width=300>
 <%
 if(check==1){ //사용중
	 %>
	 <table width=270 border=1 cellspacing=0 cellpadding=5 align=center>
	  <tr>
	   <td align=center><%=u_id%>는 사용중인 ID입니다</td>
	  </tr>
	 </table>
	 <form name=checkForm method=post action=ConfirmId.jsp>
	  <table width=270 border=1 cellspacing=0 cellpadding=5 align=center>
	   <tr>
	    <td align=center>
	        <p>다른아이디를 입력하세요</p>
	     <input type=text name=u_id style="font-size:12pt; padding:5px 5px 5px 5px; margin-bottom: 5">
	     <input type=submit style="font-size:12pt; padding:5px 5px 5px 5px; margin-top: 5" value="ID중복확인">
	    </td>
	   </tr>
	  </table>
	 </form>
	 <%
 }else{
	 %>
	 <table border=1 cellspacing=0 cellpadding=5 align=center>
	  <tr>
	   <td align=center>
	    <p>
	    <%=u_id%>는 사용가능한 ID입니다</p>
	    <input type=button value=닫기 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5" onclick="setId()">
	   </td>
	  </tr>
	 </table>
	 <%
 }//else end
 %>
 </body>
</html>
	  