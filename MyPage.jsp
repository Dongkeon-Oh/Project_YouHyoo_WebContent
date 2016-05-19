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
<script src="calendar.js"></script>
<script>
  jQuery(function($){

	  $('#datepicker1').datepicker({
	      showOn: "button",
	      buttonImage: "imgs/top/cal.png",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	    });
	 });
</script>

<link href="TopBottom.css" type="text/css" rel="stylesheet">
<link href="MyPage.css" type="text/css" rel="stylesheet">

</head>
<body>
<%@ include file="Top.jsp" %>
<%
//String u_id=(String)session.getAttribute("u_id");
//String u_id="dj";

//회원정보 얻기
User_Dao uDao=User_Dao.getInstance();
User_Dto uDto=uDao.getUser(u_id);

//찜리스트 얻기
IndexMgr mgr=IndexMgr.getInstance();
List<Pension_Dto> wList=mgr.getWishlist(u_id);

//예약정보 얻기
List<OrderRoom_Dto> oList=mgr.getOrder(u_id);

//일대일상담내역(펜션질문)
List<Q_pension_Dto> qList=mgr.getQList(u_id);
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
							<span><%=u_id %></span>
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
			<td></td>
			<td valign="top">
				<div style="border:solid 10px #eeeeee; height:125px; padding-left:10px;">
					<div style="font-size:14px; color:orange; margin:10px 0px 0px 0px; font-weight:bold;">
						나의 현재 적립금
					</div>
					<div style="margin:0px 20px 0px 0px; font-size:18px; font-weight:bold; text-align:right;">
						<span><%=uDto.getU_point() %></span> 원
					</div>
					<div class="help" style="margin-top:10px;">적립금은 사이트내에서 현금처럼 사용이 가능합니다.</div>
					<div class="help">적립금은 3년간 유효합니다.</div>
					<div class="help">적립금은 숙박이용일이 지나면 자동 적립됩니다.</div>
				</div>
				<div class="btnArea">
					<a href="UserPoint.jsp"><span class="bt">적립금 내역보기</span></a>
				</div>
			</td>
		</tr>
	</table>
	
	<div class="mTitle">최근 나의예약내역</div>
	<div>예약번호를 클릭하시면 보다 상세한 예약정보를 확인 할 수 있습니다.</div>
	
<div>	
	<div style="margin:10px 0px 10px 0px; text-align:right;">
		예약일 
		<span>
			<input name="" type="text" value="2016-05-01" maxlength="10" size="10" id="datepicker1" onkeyup="javascript:(this);" />
		 	<img class="cal" src="imgs/top/cal.png" align='absmiddle' style='cursor:pointer;' onClick="calendar(event, 'ctt_ctt_dt_rsv_s')">
		</span>
		부터 
		<span>
			<input name="" type="text" value="2016-05-16" maxlength="10" size="10" id="" onkeyup="" />
			<img class="cal" src="imgs/top/cal.png" align='absmiddle' style='cursor:pointer;' onClick="calendar(event, 'ctt_ctt_dt_rsv_e')">
		</span>
		까지
		<a onclick="" id="" class="" href="">
		<span class="bt">예약내역 확인</span></a>
	</div>	
	<div><!-- 여기에 예매내역이 들어온다!! -->
	<%
	if(!oList.isEmpty()){%>	
	<table class="listb">
	<colgroup>
			<col width="8%" />
			<col width="12%" />
			<col width="30%" />
			<col width="25%" />
			<col width="10%" />
			<col width="15%" />
	</colgroup>
	<tr>
		<th>에약번호</th>
		<th>예약일</th>
		<th>업소명</th>
		<th>예약자명</th>
		<th>예약상태</th>
		<th>이용후기</th>
	</tr>
	<%
		for(int i=0;i<oList.size();i++ ){
			OrderRoom_Dto o=oList.get(i);%>
			<tr id="Ordertr">
				<td><%=o.getO_num() %></td>
				<td><%=o.getO_date() %></td>
				<td><%=o.getO_pname() %></td>
				<td><%=o.getO_customer() %>(<%=o.getO_emercall() %>)</td>
				<%
				if(o.getO_state()==true){%>	
				<td>결재완료</td><%
				}else{%>
				<td>결재대기</td>	<%
				}%>
				<td><a href="Review.jsp"><span class="bt">이용후기</span></a></td>
			</tr>
	<%
		}//for
		%>
	</table>
	<%
	}//if	
	else{%>		
		<div class="emptyMsg">최근 예메내역이 존재하지 않습니다.</div>
	<%  
	}//else
	%>
	</div>
	
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
			Q_pension_Dto q=qList.get(i);
		%>
			<tr id="Qtr">
				<td><%=q.getQp_num() %></td>
				<td><%=q.getQp_title() %></td>
				<%
				if(q.getQp_state()==true){%>	
				<td>답변완료</td><%
				}else{%>
				<td>답변대기</td>	<%
				}%>
				<td><%=q.getQp_date() %></td>
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
		<a href="Q_youhyoo.jsp" class="btn"><span class="bt">일대일문의하기</span></a>
	</div>
	<div class="mTitle">찜리스트</div>
	<div><!-- 여기에 찜내역이 들어온다!! -->
	<%
	if(!wList.isEmpty()){%>	
	<table class="listb">
	<tr>
		<th>업소</th>
		<th>삭제</th>
	</tr>
	<%
		for(int i=0;i<wList.size();i++ ){
			Pension_Dto p=wList.get(i);
			StringTokenizer pensionPhoto = new StringTokenizer(p.getP_photo(),"|");
			if(pensionPhoto.hasMoreTokens()){
				%>
				<tr id="JJimtr">
					<td align="left">
					<table>
					<tr>
						<td>
						<a id="JJim_pnum" href="DetailView.jsp?p_num=<%=p.getP_num()%>">
						<img src="imgs/pension/<%=p.getP_num()%>/<%=pensionPhoto.nextToken()%>" width=112 height=80></a>
						</td>
						<td width=50></td>
						<td><%=p.getP_name() %></td>
					</tr>
					</table>
					</td>
					
					<td>
					<a href="Del_wish.jsp?u_id=<%=u_id %>&pnum=<%=p.getP_num()%>"><span class="bt">삭제</span></a>
					</td>
				</tr>
			<%
			}//if
		}//for
	%>
	</table>
	<%
	}//if	
	else{%>		
	<div class='emptyMsg'>찜 내역이 존재하지 않습니다.</div>
	<%
	}//else
	%>
	</div>			
</div>
<%@ include file="Bottom.html" %>
</body>
</html>