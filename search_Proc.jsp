<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String u_name=request.getParameter("u_name");
String u_id=request.getParameter("u_id");
String u_pwd=request.getParameter("u_pwd");

String u_cell=request.getParameter("u_cell1");
u_cell=u_cell+request.getParameter("u_cell2");
u_cell=u_cell+request.getParameter("u_cell3");

User_Dao dao=User_Dao.getInstance(); //dao 객체 얻기 
%>
<html>
<body>
<%
if(u_id==null){
	String id=dao.searchId(u_name, u_cell);
	%>
	<form name=seachId method="post" action="Login.jsp">
 	 <div align=center>
  	  <a href="Index.jsp"><img src="imgs/top/youhyoo.PNG" width=300></a>
  	  <table align=center width=750 cellpadding="0" cellspacing="0">
       <tr>
    	<td colspan=2 height=30><h3>아이디 찾기</h3></td>
       </tr>
       <tr>
        <td align=center>
         <%=u_name%>님의 아이디는 <%=id%> 입니다<br><br>
        </td>
       </tr>
       <tr>
        <td align=center>
         <input type=submit name=login value=로그인>
         <input type=button name=searchpwd value=비밀번호찾기 onclick="location.href='search.jsp'">
        </td>
       </tr>
      </table>
    </div>
    </form>
	<%
}else{
	String pwd=dao.searchPwd(u_id, u_name);
	%>
	<form name=searchPwd method="post" action="Login.jsp">
 	 <div align=center>
  	  <a href="Index.jsp"><img src="imgs/top/youhyoo.PNG" width=300></a>
  	  <table align=center width=750 cellpadding="0" cellspacing="0">
       <tr>
    	<td colspan=2 height=30><h3>비밀번호 찾기</h3></td>
       </tr>
       <tr>
        <td align=center>
         <%=u_id%>님의 비밀번호는 <%=pwd%>입니다<br><br>
        </td>
       </tr>
       <tr>
        <td align=center>
         <input type=submit name=search value=로그인>
        </td>
       </tr>
      </table>
     </div>
    </form>
	<%
}
%>
<footer style="text-align:center;">
 <p>ⓒYou休</p>
</footer>
</body>
</html>
