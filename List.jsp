
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    %>
<%
request.setCharacterEncoding("utf-8");
String u_id=(String)session.getAttribute("u_id");
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
			
			var qp=jQuery(this).attr("q_count");
			var ques=jQuery(this).closest("tr").next();
			
			jQuery("#QuestionList tr.ques").hide();
			
			if(jQuery(".ques").attr("abc")==qp){
				jQuery(".ques").attr("abc","");
				ques.hide();
			}else{
				jQuery(".ques").attr("abc",qp);
				ques.show();
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
			
			<table align="center" width="300">
			<tr>
				<div style="height:55px;">
						<div style="float:left;height:55px; font-size:11px; color:Silver; margin-left:5px;">
							근거없는 비방/욕설 혹은 질문답변 성격에 맞지 않는 내용인 경우 사전 통보없이 삭제됩니다.<br />
							질문 등록시 담당자 휴대폰으로 등록 내역이 전송됩니다. 최대한 빠른 답변을 위해 최선을 다하겠습니다.<br />
							근무시간 외 문의는 답변시간이 지연될수 있는점 양해 부탁드립니다.
						</div>
						<div style="float:right; margin-top:15px;color:#ff83a6; padding-right:5px;">
							최근 10일 평균 답변소요시간 : <b id="ctt_ctt_qaTimeAvg">42분</b>
						</div>
				</div>
			</tr>
			</table>
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
				<a class="link" q_count="<%=dto.getQp_num() %>">
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
					<input type="text" name="qp_id" id="qp_id" size=40 value="u_id" readonly>
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
</html>