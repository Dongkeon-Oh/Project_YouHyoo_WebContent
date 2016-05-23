
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
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>

<%
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}//if

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

//글번호
String a = request.getParameter("qp_num");
if(a==null){
	a="0";
}
int num=Integer.parseInt(a);

try{
	Q_pension_Dto dto=dao.ViewsIncrease(num);
}catch(Exception ex){}
%>
<html>
	<head>
	<title>List.jsp</title>
	<link href="Index.css" type="text/css" rel="stylesheet">
	<link href="TopBottom.css" type="text/css" rel="stylesheet">
	<style type="text/css">
	.QuestionList{
	width : 1000px;
	margin : auto;
	text-align : center;
	border-collapse : collapse;
	border-color : #BDBDBD;
	color : #5D5D5D;
	}
	.ques{display:none;}
	a.link{cursor:pointer;}
	.bb{display:none;}
	</style>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
	$(function ReadAfter(){
		jQuery(".link").click(function(){
			console.log(jQuery(this).attr("id"));
			var qp=jQuery(this).attr("id");
			var ques=jQuery(this).closest("tr").next();
			
			jQuery("#QuestionList tr.ques").hide();
			
			if(jQuery(".ques").attr("abc")==qp){
				jQuery(".ques").attr("abc","");
				ques.hide();
			}else{
				jQuery(".ques").attr("abc",qp);
				ques.show();
				$.ajax({
					type:'POST',
					url:'Q_Proc.jsp',
					data:'qp_num='+qp,
					dataType:'json',
				success:function(data){
					$(data.view);
				},
				error:function(data){
					alert("실패");
				}
				});
			}
		});
	});
	
	$(document).ready(function(){
		$("#btn1").click(function(){
			$(".aa").hide();
			$("#btn1").hide();
			$(".bb").show();
		});
		$("#btn2").click(function(){
			$(".aa").show();
			$("#btn1").show();
			$(".bb").hide();
		});
	});
	</script>
	
	</head>	
	<body>
	<!-- 
	<form name="listForm" method="post" action="list.jsp">
	-->
	 <%@ include file="Top.jsp" %>
		<table width=700 align=center id="qList">
			
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
			
		<!-- 글 리스트 -->
		<div class="aa">	
		<table id="QuestionList" align="center">
			<tr height="20">
				<td align="center" width="50">답변상태</td>
				<td align="center" width="185">글제목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="103">작성일</td>
				<td align="center" width="63">조회수</td>
				<td align="center" width="63">글번호</td>
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
				%>
				<td align="center">
				
				<!-- link -->
				<a class="link" id="<%=dto.getQp_num() %>">
				<%=dto.getQp_title() %>
				</a>
				
				</td>
				
				<td align="center"><%=dto.getQp_id() %></td>
				
				<td align="center"><%=sdf.format(dto.getQp_date()) %></td>
				
				<td align="center"><%=dto.getQp_view() %></td>
				
				<td align="center"><%=dto.getQp_num() %></td>
				
			</tr>
			
			<tr class="ques">
				<td colspan="5">
				<%=dto.getQp_question() %>
				</td>
			</tr>
			
			<%
			}//for
			%>
		<!-- 글 리스트 end -->
		
			<%
			}//else
			%>
			
			<%--블럭처리, page처리 --%>
			
			<%
			if(count>0){
			%>
				<tr align="center">
					<td align="center">
					
					<%
					int pageCount=count/pageSize+(count%pageSize==0?0:1);
					int pageBlock=10;
					int startPage=(int)(currentPage/pageBlock)*10+1;
					int endPage=startPage+pageBlock-1;
					
					if(endPage>pageCount){
						endPage=pageCount;
					}//if
					
					//이전블럭
					if(startPage>10){
					%>
					<a href="List.jsp?pageNum=<%=startPage-10 %>">[이전블럭]</a>
					
					
					<%
					}
					%>
					
					<%
					for(int i=startPage; i<=endPage; i++){
					%>
					
					<a href="List.jsp?pageNum=<%=i %>">[<%=i %>]</a>
					
					<%	
					}
					%>
					
					<%
					if(endPage<pageCount){
					%>
					<a href="List.jsp?pageNum=<%=startPage+10 %>">[다음블럭]</a>
					
					<%
					}
					%>
					</td>
				</tr>
			<%
			}
			%>
			</table>
			</div>
		</table>
		
		<!-- 문의하기 -->
		<div class="bb">
		<form name="writeForm" method="post" action="writeProc.jsp">
	
			<table width="500" cellspacing="0" cellpadding="3"
			align="center">
			
			
			<!-- ID -->
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="qp_id" id="qp_id" size=40>
				</td>
			</tr>	
			<!-- 글제목 -->
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="qp_title" id="qp_title" size=40>
				</td>
			</tr>
			
			<!-- 글내용 -->
			<tr>
				<td>글내용</td>
				<td>
				<textarea name="qp_question" id="qp_question" rows="20" cols="45"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
			</table>
		</form>
		</div>
		<!-- 문의하기 end -->
		<table align=center>
			<tr>
				<td colspan=5 align="right">
				<input type="button" id="btn1" value="문의하기">
				</td>
				<td>
				<input type="reset" id="btn2" value="돌아오기">
				</td>
			</tr>
		</table>
	</body>
	<%@ include file="Bottom.html" %>
</html>