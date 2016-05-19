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

<link href="Index.css" type="text/css" rel="stylesheet">
<style type="text/css">
#member{
	width: 1000px;
	margin: 0 auto;
}
div.emptyMsg { border:solid 1px #dddddd; padding:10px; text-align:center; clear:both;}
span.bt {display:inline-block; border:solid 2px silver; text-decoration:none; cursor:pointer; white-space:nowrap; vertical-align:middle; color:Black; font-size:14px; padding:5px 10px 5px 10px; background-color:White;}
</style>
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
				<table>
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
			<div><a href="Modify.jsp"><span class="bt">회원정보수정</span></a></div>
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
					<div class="help">그밖에 각종이벤트에 의해 적립금이 산정됩니다.</div>
				</div>
				<div>
					<a href="UserPoint.jsp"><span class="bt">적립금 내역보기</span></a>
				</div>
			</td>
		</tr>
	</table>
	
	<div>최근 나의예약내역</div>
	<div class="help">예약번호를 클릭하시면 보다 상세한 예약정보를 확인 할 수 있습니다.</div>
	<div class="help">비회원 예약건은 조회가 안될수 있습니다. 고객센터로 연락주시면 조회 가능하도록 처리 해드립니다.</div>
	
<div>	
	<div style="margin:10px 0px 10px 0px; text-align:right;">
		예약일 
		<span>
			<input name="" type="text" value="2016-05-01" maxlength="10" size="10" id="" onkeyup="javascript:(this);" />
		 	<img src='' align='absmiddle' style='cursor:pointer;' onClick="calendar(event, 'ctt_ctt_dt_rsv_s')">
		</span>
		부터 
		<span style="display:inline-block;">
			<input name="" type="text" value="2016-05-16" maxlength="10" size="10" id="" onkeyup="" />
			<img src="" align='absmiddle' style='cursor:pointer;' onClick="calendar(event, 'ctt_ctt_dt_rsv_e')">
		</span>
		까지
		<a onclick="" id="" class="" href="">
		<span class="bt">예약내역 확인</span></a>
	</div>	
	<div><!-- 여기에 예매내역이 들어온다!! -->
	<%
	if(!oList.isEmpty()){%>	
	<table>
	<tr>
		<td>에약번호</td>
		<td>예약일</td>
		<td>업소명</td>
		<td>예약자명</td>
		<td>예약상태</td>
		<td>이용후기</td>
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
	
	<div>일대일상담내역</div>
	<div><!-- 여기에 일대일상담내역이 들어온다!! -->
	<%
	if(!qList.isEmpty()){%>	
		<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>상태</td>
			<td>등록일</td>
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

	<div>
		<a href="Q_youhyoo.jsp" class="btn"><span class="bt">일대일문의하기</span></a>
	</div>
	<div>찜리스트</div>
	<div><!-- 여기에 찜내역이 들어온다!! -->
	<%
	if(!wList.isEmpty()){%>	
	<table>
	<tr>
		<td>업소</td>
		<td></td>
		<td>삭제</td>
	</tr>
	<%
		for(int i=0;i<wList.size();i++ ){
			Pension_Dto p=wList.get(i);
			StringTokenizer pensionPhoto = new StringTokenizer(p.getP_photo(),"|");
			if(pensionPhoto.hasMoreTokens()){
				%>
				<tr id="JJimtr">
					<td>
					<a id="JJim_pnum" href="DetailView.jsp?p_num=<%=p.getP_num()%>">
					<img src="imgs/pension/<%=p.getP_num()%>/<%=pensionPhoto.nextToken()%>" class="thumbnail"></a>
					</td>
					<td><%=p.getP_name() %></td>
					<td>
					<div class="btnArea">
					<a href="Del_wish.jsp?u_id=<%=u_id %>&pnum=<%=p.getP_num()%>"><span class="bt">삭제</span></a>
					</div>
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