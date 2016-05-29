<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유휴~! 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="moment.js"></script>
<script>
  	$(function($){
		$("#sDate").val(moment().add(-13,'days').format('YYYY-MM-DD'));
		$("#eDate").val(moment().format('YYYY-MM-DD'));
		
		var u_id=$("#u_id").val();
		var sDate=$("#sDate").val();
		var eDate=$("#eDate").val();
		
		$.ajax({
			type : 'POST',
			url : 'OrderList.jsp',
			data : "u_id="+u_id+"&sDate="+sDate+"&eDate="+eDate,
			dataType : 'html',
			success : function(data){//콜백 성공 응답시 실행
				$("#oList").html(data);	
			}
		});
		
		$("#oCheck").click(function(){
			var u_id=$("#u_id").val();
			var sDate=$("#sDate").val();
			var eDate=$("#eDate").val();
			
			$.ajax({
				type : 'POST',
				url : 'OrderList.jsp',
				data : "u_id="+u_id+"&sDate="+sDate+"&eDate="+eDate,
				dataType : 'html',
				success : function(data){//콜백 성공 응답시 실행
					$("#oList").html(data);	
				}
			});
	  	});
		
		$("#point").click(function(){
			var u_id=$("#u_id").val();
			//alert(num);
			
			window.open("UserPoint.jsp?u_id="+u_id,+"적립금내역","left=600,top=250,width=800,height=500");
		});
		
		$("#qYH").click(function(){
			var u_id=$("#u_id").val();
			//alert(num);
			window.open("Q_Youhyoo.jsp?u_id="+u_id,+"일대일상담","left=600,top=250,width=600,height=500");
		});
		
	//	$(document).on("click",".mpa_contents", function(){
	//		$(".mpa_contents").html("<div id='mpa_content' style='width:400px;background-color: #CCCCCC'></div>");
	//	})
	});
  	
  	var indexCheck=-1;
  	function viewDetail(index, state){
 		index=index*1;
 	//	state=state*1;
 		console.log("indexCheck : "+indexCheck+" / index : "+index);
		if(indexCheck==index){
			$("#mpa_content").remove();
			indexCheck=-1;
  		}else{
  			$("#mpa_content").remove();
  			$.ajax({
  				type:'POST',
  				url:'MypageAdminProc.jsp',
  				data:'qy_num='+index,
  					//"name=홍길동&location=서울"
  				dataType:'json',
  				success:function(data){
  					if(state==0){
  						$("#mpa_contents"+index).append("<div id='mpa_content' style='width:495px;background-color: #CCCCCC'>"+data.content
  							+"<br><input type='button' value='답변하기' onClick='responseQuestion("+index+")'></div>");
  		  			}else{
	  		  			$("#mpa_contents"+index).append("<div id='mpa_content' style='width:495px;background-color: #CCCCCC'>"+data.content+"</div>");
	  				}
  			  	}//success
  		  	});// end ajax
  			indexCheck=index;
  		}
  	}
  	
  	function responseQuestion(index){
  		window.open("S_Location.jsp","left=600,top=250,width=800,height=500");
  	}
</script>

<link href="TopBottom.css" type="text/css" rel="stylesheet">
<link href="MyPage.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@ include file="Top.jsp" %>
<%
//String u_id=(String)session.getAttribute("u_id");
//String u_id="dj";

//오늘 날짜 얻기
Calendar cal=Calendar.getInstance();

//회원정보 얻기
User_Dao uDao=User_Dao.getInstance();
User_Dto uDto=uDao.getUser(u_id);

//찜리스트 얻기
IndexMgr mgr=IndexMgr.getInstance();
List<Pension_Dto> wList=mgr.getWishlist(u_id);

//예약정보 얻기
//List<OrderRoom_Dto> oList=mgr.getOrder(u_id,sDate,eDate);

//일대일상담내역(펜션질문)
List<Q_Youhyoo_Dto> qList=mgr.getQList(u_id);
%> 
<div id="member">
	<div class="mTitle">회원정보</div>
	<table width="100%">
		<colgroup>
			<col width="50%" />
			<col width="2%" />
			<col width="50%" />
		</colgroup>
		<tr>
			<td>
				<table class="mInfo">
					<colgroup>
						<col width="120" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>아이디</th>
						<td>
							<span ><%=u_id %></span>
							<input id="u_id" type="hidden" value="<%=u_id %>">
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<span><%=uDto.getU_name() %></span>
						</td>
					</tr>
					<tr>
						<th>Email</th>
						<td>
							<span><%=uDto.getU_email() %></span>
						</td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td>
							<span><%=uDto.getU_cell() %></span>
						</td>
					</tr>
				</table>
			<div class="btnArea"><a href="Modify.jsp"><span class="bt">회원정보수정</span></a></div>
			</td>
		</tr>
	</table>
	
<div>	
	<div class="mTitle">일대일상담내역</div>
	<div><!-- 여기에 일대일상담내역이 들어온다!! -->
	<%
	if(!qList.isEmpty()){%>	
		<table class="listb">
		<colgroup>
			<col width="8%" />
			<col width="50%" />
			<col width="15%" />
			<col width="27%" />
		</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>상태</th>
			<th>등록일</th>
		</tr>
		<%
		for(int i=0;i<qList.size();i++ ){
			Q_Youhyoo_Dto q=qList.get(i);
			int state=0;
			if(q.getQy_state()){
				state=1;
			}
		%>
			<tr id="Qtr">
				<td><%=q.getQy_num() %></td>
				<td class="mpa_con" id="mpa_contents<%=q.getQy_num() %>" onClick="viewDetail(<%=q.getQy_num() %>, <%=state %>)"><%=q.getQy_title() %></td>
				<%
				if(q.getQy_state()==true){%>	
				<td>답변완료</td><%
				}else{%>
				<td>답변대기</td>	<%
				}%>
				<td><%=q.getQy_date() %></td>
			</tr>
		<%
		}//for
		%>
		</table>
	<%
	}//if	
	else{%>		
	<div class='emptyMsg'>문의내역이 존재하지 않습니다.</div>
	<%
	}//else
	%>
	</div>

		<div class="btnArea">
			<a href="#" class="btn"><span id="qYH" class="bt">일대일문의하기</span></a>
		</div>
	</div>			
</div>


<%@ include file="Bottom.html" %>
</body>
</html>