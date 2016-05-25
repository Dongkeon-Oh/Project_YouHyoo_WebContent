<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
    %>
<%
request.setCharacterEncoding("utf-8");
// 추가사항 -- 세션을 통해 아이디를 전달 받음. 아이디는 변경이 불가능함.
String u_id=request.getParameter("u_id");
int p_num=Integer.parseInt(request.getParameter("p_num"));

int pageSize=10;
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}//if

int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;
int count=0;	
int number=0;
List<Q_pension_Dto> q_List=null;

PensionDao qp_dao=PensionDao.getInstance();
count=qp_dao.getArticleCount(p_num);

if(count>0){
	q_List=qp_dao.getList(startRow, pageSize, p_num);
}
number=count-(currentPage-1)*pageSize;

//글번호
String qp_num = request.getParameter("qp_num");
if(qp_num==null){
	qp_num="0";
}
int qp_number=Integer.parseInt(qp_num);

try{
	Q_pension_Dto dto=qp_dao.ViewsIncrease(qp_number);
}catch(Exception ex){}
%>
<html>
<head>
	<title>Q_Pension.jsp</title>
	<style>
	#qList{
		margin : 0 auto;
	}
	
	#QuestionList{
		text-align : center;
		border : 1px solid #BDBDBD;
		color : #4D4D4D;
	}
	
	.ques{
		display:none;
		text-align: left;
	}
	.ques > td{
		padding-left: 100px;
		border : 1px solid #FF0000;
	}
	
	a.link{
		cursor:pointer;
	}
	
	.bb{
		display:none;
	}
	
	.tableList{
		background-color : #CDCDCD;
	} 
	</style>
	
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
	function checkForm(){
		if($("#qp_title").val()==''){
			alert("제목을 입력하시기 바랍니다.");
			$("#qp_title").focus();
			return false;
		}else if($("#qp_question").val()==''){
			alert("질문 사항을 입력하시기 바랍니다.");
			$("#qp_question").focus();
			return false;
		}else{
			$("#writeForm").submit();
		}
	}
	
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
		$("#btn1").css({"float":"right"});
		$("#btn1").click(function(){
			if("<%=u_id%>"=='null'){
				alert("로그인이 필요한 메뉴입니다.\n로그인 페이지로 이동합니다.");
				location.href="Login.jsp";
			}else{
				$(".aa").hide();
				$("#btn1").hide();
				$(".bb").show();
			}
		});
		$("#btn2").click(function(){
			$(".aa").show();
			$("#btn1").show();
			$(".bb").hide();
		});
		$("#qp_id").attr({"readonly":"readonly","value":"<%=u_id%>"});
	});
	</script>
</head>	
<body>
	<!-- 
	<form name="listForm" method="post" action="Q_Pension.jsp">
	-->
		<table id="qList">
			
			<%
			if(count==0){
			%>
			<tr>
				<td><div class="aa">
					<table id="QuestionList">
						<tr>
							<td class="tableList" align="center" width="80">답변상태</td>
							<td class="tableList" align="center" width="500">글제목</td>
							<td class="tableList" align="center" width="100">작성자</td>
							<td class="tableList" align="center" width="160">작성일</td>
							<td class="tableList" align="center" width="80">조회수</td>
							<td class="tableList" align="center" width="80">글번호</td>
						</tr>
						<tr>
							<td align="center" colspan="6" style="padding: 15px 0 15px 0;"><b>문의 내역이 없습니다</b></td>
						</tr>
					</table>
				</div></td>
			</tr>
			<%
			}else{
			%>
			
		<!-- 글 리스트 -->
		
		<tr>
		<td width="1000px">
		<div class="aa">	
		<table id="QuestionList">
			<tr>
				<td class="tableList" align="center" width="80">답변상태</td>
				<td class="tableList" align="center" width="500">글제목</td>
				<td class="tableList" align="center" width="100">작성자</td>
				<td class="tableList" align="center" width="160">작성일</td>
				<td class="tableList" align="center" width="80">조회수</td>
				<td class="tableList" align="center" width="80">글번호</td>
			</tr>
			<%
			for(int i=0; i<q_List.size(); i++){
				Q_pension_Dto dto=(Q_pension_Dto)q_List.get(i);
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
				<td colspan="6">
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
					<td align="center" colspan="6">
					
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
					<a href="Q_Pension.jsp?pageNum=<%=startPage-10 %>">[이전블럭]</a>
					
					
					<%
					}
					%>
					
					<%
					for(int i=startPage; i<=endPage; i++){
					%>
					
					<a href="DetailView.jsp?p_num=<%=p_num %>&pageNum=<%=i %>">[<%=i %>]</a>
					
					<%	
					}
					%>
					
					<%
					if(endPage<pageCount){
					%>
					<a href="Q_Pension.jsp?pageNum=<%=startPage+10 %>">[다음블럭]</a>
					
					<%
					}
					%>
							</td>
						</tr>
			<%
			}
			%>
						</table>
						<input type="button" id="btn1" value="문의하기">
					</div>
					<div class="bb">
						<form id="writeForm" method="post" action="Q_PensionProc.jsp">
							<input type="hidden" name="p_num" value="<%=p_num %>">
							<table>
							
							<!-- ID -->
							<tr>
								<td class="tableList">ID</td>
								<td>
									<input type="text" name="qp_id" id="qp_id" size=40>
								</td>
							</tr>	
							<!-- 글제목 -->
							<tr>
								<td class="tableList">제목</td>
								<td>
									<input type="text" name="qp_title" id="qp_title" size=40>
								</td>
							</tr>
							
							<!-- 글내용 -->
							<tr>
								<td class="tableList">글내용</td>
								<td>
								<textarea name="qp_question" id="qp_question" rows="10" cols="140"></textarea>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
									<input type="button" value="글쓰기" onclick="checkForm()">
									<input type="reset" value="다시쓰기">
									<input type="reset" id="btn2" value="돌아가기">
								</td>
							</tr>
							</table>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>