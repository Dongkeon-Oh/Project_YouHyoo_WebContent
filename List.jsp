<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    %>
<%
request.setCharacterEncoding("utf-8");
%>
<%!
int pageSize=10;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<%
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;
int count=0;
int number=0;
List list=null;

PensionDao dao=PensionDao.getInstance();
count=dao.getArticleCount();

if(count>0){
	list=dao.getList(startRow, pageSize);
}
number=count-(currentPage-1)*pageSize;

String a = request.getParameter("qp_num");
if(a==null){
	a="0";
}
int num=Integer.parseInt(a);

try{
	Q_pension_Dto dto=dao.getArticle(num);
}catch(Exception ex){}
%>
<html>
	<head>
	<title>List.jsp</title>
	<!-- 
	<script>
	function list(){
		alert("asd");
		document.listForm.action="list.jsp";
		document.listForm.submit;
	}
	</script>
	-->
	</head>	
	<body>
	<!-- 
	<form name="listForm" method="post" action="list.jsp">
	-->
	<form name="listForm" method="get">
		<center><b><h1>리스트</h1></b></center>
		<table width=700 align=center>
			
			<%
			if(count==0){
			%>
			
			<table width="700" border="1" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다</td>
			</tr>
			</table>
			
			<%
			}else{
			%>
			
			<table border="1" align="center">
			<tr>
				<td align="center" width="70">답변상태</td>
				<td align="center" width="200">제목</td>
				<td align="center" width="100">ID</td>
				<td align="center" width="50">조회수</td>
				<td align="center" width="100">글번호</td>
			</tr>
			
			<%
			for(int i=0; i<list.size(); i++){
				Q_pension_Dto dto=(Q_pension_Dto)list.get(i);
			%>
			
			<tr>
			
			<%
			if(dto.getQp_state()==true){
			%>
			
				<td><img src="imgs/Q_pension/commit.JPG"></td>
				
				<%
			}else{
				%>
				
				<td><img src="imgs/Q_pension/wait.JPG"></td>
				
			<%
			}//if
				if(dto.getQp_num()==num){
					%>
					<td>
						<%=dto.getQp_title() %>
						<br><br>
						<%=dto.getQp_answer() %>
					</td>
					<%
				}else{
					%>
					<td><a href="List.jsp?qp_num=<%=dto.getQp_num() %>">
					<%=dto.getQp_title() %></a></td>
					<%
				}	
				
			%>
				
				<td><%=dto.getQp_id() %></td>
				<td><%=dto.getQp_view() %></td>
				<td><%=dto.getQp_num() %></td>
				<!-- 
				<td><input type="hidden" name="qp_num" value="<%=dto.getQp_num() %>"></td>
				-->
				
			</tr>
			
			<%
			}//for
			%>
			
			<tr>
				<td colspan=5 align="right">
				<input type="button" value="문의하기" onClick="document.location.href='writeForm.jsp'">
				</td>
			</tr>
			
			</table>
			
			<%
			}//else
			%>
			
		</table>
	</form>
	</body>
</html>