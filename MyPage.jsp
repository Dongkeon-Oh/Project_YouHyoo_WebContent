<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유휴~! 마이페이지</title>

<!-- css링크 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="TopBottom.css" type="text/css" rel="stylesheet">
<link href="MyPage.css" type="text/css" rel="stylesheet">

<!-- script 플러그인 제이쿼리,날짜-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="moment.js"></script>

<!-- 사용자정의 -->
<script>
  	$(function($){
  		
  		//달력 한글처리
  		$.datepicker.regional['ko'] = {
	  		 closeText: '닫기',
	  		 prevText: '이전',
	  		 nextText: '다음',
	  		 currentText: '오늘',
	  		 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  		 monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	  		 dayNames: ['일','월','화','수','목','금','토'],
	  		 dayNamesShort: ['일','월','화','수','목','금','토'],
	  		 dayNamesMin: ['일','월','화','수','목','금','토'],
	  		 weekHeader: 'Wk',
	  		 dateFormat: 'yy-mm-dd',
	  		 firstDay: 0,
	  		 isRTL: false,
	  		 showMonthAfterYear: true,
	  		 yearSuffix: ''};
 	 	$.datepicker.setDefaults($.datepicker.regional['ko']);
  		
  		//input 태그에서 날짜 받아와 변수로 저장 
		$("#sDate").val(moment().add(-13,'days').format('YYYY-MM-DD'));
		$("#eDate").val(moment().format('YYYY-MM-DD'));
		
		var u_id=$("#u_id").val();
		var sDate=$("#sDate").val();
		var eDate=$("#eDate").val();
		//나의 주문내역 요청
		$.ajax({
			type : 'POST',
			url : 'M_OrderList.jsp',
			data : "u_id="+u_id+"&sDate="+sDate+"&eDate="+eDate,
			dataType : 'html',
			success : function(data){//콜백 성공 응답시 실행
				$("#oList").html(data);	
			}
		});
		
		//예약내역 리스트 얻기 (날짜지정해서)
		$("#oCheck").click(function(){
			var u_id=$("#u_id").val();
			var sDate=$("#sDate").val();
			var eDate=$("#eDate").val();
			
			$.ajax({
				type : 'POST',
				url : 'M_OrderList.jsp',
				data : "u_id="+u_id+"&sDate="+sDate+"&eDate="+eDate,
				dataType : 'html',
				success : function(data){//콜백 성공 응답시 실행
					$("#oList").html(data);	
				}
			});
	  	});
		
		//적립금 내역 얻기
		$("#point").click(function(){
			var u_id=$("#u_id").val();
			//alert(num);
			
			window.open("UserPoint.jsp?u_id="+u_id,+"적립금내역","left=600,top=250,width=800,height=500");
		});
		
		//일대일 상담하기 입력폼으로 이동
		$("#qYH").click(function(){
			var u_id=$("#u_id").val();
			//alert(num);
			
			window.open("Q_Youhyoo.jsp?u_id="+u_id,+"일대일상담","left=600,top=250,width=600,height=500");
		});
		
		//팝업 달력 (시작날짜)
		$('#sDate').datepicker({
			showOn : "button",
			buttonImage : "imgs/top/cal.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});
		
		//팝업 달력 (끝날짜)
		$('#eDate').datepicker({
			showOn : "button",
			buttonImage : "imgs/top/cal.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});
		
		//일대일 상담 내역에서 글제목을 클릭하면 글내용 보이게
		$(".lin").click(function(){	
			
			var con = jQuery(this).attr("qyNum");
			var trdes = jQuery(this).closest("tr").next();
				
			jQuery("#tb_Qy tr.qyContent").hide();		//모두 감추기

			if(jQuery(".qyContent").attr("abc") == con)
			{
				jQuery(".qyContent").attr("abc","");
				trdes.hide();		
			}
			else
			{
				jQuery(".qyContent").attr("abc",con);
				trdes.show();	
			}				
		});
	});
</script>
</head>

<body>
<%@ include file="Top.jsp" %>
<%
//오늘 날짜 얻기
Calendar cal=Calendar.getInstance();

//회원정보 얻기
User_Dao uDao=User_Dao.getInstance();
User_Dto uDto=uDao.getUser(u_id);

//찜리스트 얻기
IndexMgr mgr=IndexMgr.getInstance();
List<Pension_Dto> wList=mgr.getWishlist(u_id);

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
					<a href="#"><span id="point" class="bt">적립금 내역보기</span></a>
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
			<input id="sDate" name="" type="text" value="" maxlength="10" size="10" class="datepicker" />
		</span>
		부터 
		<span>
			<input id="eDate" name="" type="text" value="" maxlength="10" size="10" class="datepicker"/>
		</span>
		까지
		
		<span class="bt" id="oCheck">예약내역 확인</span>
	</div>	
	<div id="oList"><!-- 여기에 예매내역이 들어온다!! -->

	</div>
	
	<div class="mTitle">일대일상담내역</div>
	<div><!-- 여기에 일대일상담내역이 들어온다!! -->
	<%
	if(!qList.isEmpty()){%>	
		<table class="listb" id="tb_Qy">
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
		%>
			<tr id="Qtr">
				<td><%=q.getQy_num() %></td>
				<td>
				<a class="lin" qyNum="<%=q.getQy_num() %>"><%=q.getQy_title() %></a>
				</td>
				<%
				if(q.getQy_state()==true){%>	
				<td>답변완료</td><%
				}else{%>
				<td>답변대기</td>	<%
				}%>
				<td><%=q.getQy_date() %></td>
			</tr>
			
			<tr class="qyContent">
				<td colspan=5 id="con">
				<%=q.getQy_content() %>
				</td>
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
</div>
<%@ include file="Bottom.html" %>
</body>
</html>