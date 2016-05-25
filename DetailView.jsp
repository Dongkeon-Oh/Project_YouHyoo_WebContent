<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<!-- 디테일뷰 우헤헤헤헤~~ -->    
<%
request.setCharacterEncoding("utf-8");
int p_num=Integer.parseInt(request.getParameter("p_num"));
//int p_num=1;
DetailMgr detail=DetailMgr.getInstance();

Pension_Dto pension=detail.getPension(p_num);
List<Room_Dto> room=detail.getRoom(p_num); 
List<OrderRoom_Dto> order=detail.getOrder(p_num);

%>    

<html>
	<head>
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    	<script src="moment.js"></script>
    	
    	<!-- 기본적인 CSS -->
    	<link href="TopBottom.css" type="text/css" rel="stylesheet">
    	<link href="DetailView.css" type="text/css" rel="stylesheet">
    	
    	<!-- 주문부에 필요한 스크립트 파일과 css 파일 -->
    	<script src="DetailOrder.js"></script>
    	<link href="DetailOrder.css" type="text/css" rel="stylesheet">
    	
    	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    	
    	<script>
    	$(document).ready(function(){	
    		// 기간 출력
    		printPeriod();
    		
    		// 요일 출력 
    		printDays();
    		
    		// 날짜 출력
    		printDates();
    		
    		<% for(int i=0; i<room.size(); i++){ %>
    		roomNameGet(
    			"<%=room.get(i).getR_name()%>",
    			<%=room.get(i).getR_num()%>,
    			<%=room.get(i).getR_maxcapa()%>,
    			<%=room.get(i).getR_mincapa()%>
    		);
    		roomPriceGet(
    			<%=room.get(i).getR_max_wd() %>,
    			<%=room.get(i).getR_max_we() %>,
    			<%=room.get(i).getR_min_wd() %>,
    			<%=room.get(i).getR_min_we() %>	
    		);
    		<% } %>
    			 
    		<% for(int i=0; i<order.size() ; i++){ %>
    		roomStateGet("<%=order.get(i).getO_rnum()%>","<%=order.get(i).getO_date()%>");
    		<% } %>
    		
    		// 선택 버튼 출력
    		printCheckbox();
    		
			// 요금 계산 영역 출력
			calcPricePoint(0);
			
			// 주문 완료일자 출력
			printOrderedDate();
    	});
    	</script>
	</head>
	
	<body>
		<%@ include file="Top.jsp" %>
		<div id="outLine">
			<table>
				<tr>
					<td width="350px">
						<%
							StringTokenizer pensionPhoto = new StringTokenizer(pension.getP_photo(),"|");
								if(pensionPhoto.hasMoreTokens()){
							}
						%>
						<br>
						<img src="imgs/pension/<%=pension.getP_num() %>/<%=pensionPhoto.nextToken()%>" id="pensionImg"/>
						<br>
						<div id="imgMenu">
							<a href="javascript:QuickMenu('imgHotel')">
								<font>전경사진</font>
							</a>
							&nbsp;&nbsp;&nbsp;
							<a href="javascript:QuickMenu('imgRoom')">
								<font>객실사진</font>
							</a>
						</div>
					</td>
					
					<td >
						<table>
							<tr>
								<td colspan="2" id="pensionName">
									<font size="5"><%=pension.getP_name() %></font>&nbsp;&nbsp;
									<a href="javascript:QuickMenu('map')" class="btnSet">찜하기</a>
								</td>
							</tr>
							<tr>
								<th>펜션주소</th>
								<td width="500px">
									<%=pension.getP_addr1()+" "+pension.getP_addr2()+" "+pension.getP_addr3() %>
									<a href="javascript:QuickMenu('map')" class="btnSet">지도보기</a>
								</td>
							</tr>
							<tr>
								<th>예약문의</th>
								<td class="highlightFont">
									<b><%=pension.getP_tel() %></b>
								</td>
							</tr>
							<tr>
								<th>결제안내</th>
								<td>
									<img src="imgs/DetailView/credit.jpg"/>
									<img src="imgs/DetailView/sendWithAccount.jpg"/>
									<img src="imgs/DetailView/sendWithoutAccount.jpg"/>
								</td>
							</tr>
							<tr>
								<th>무통장계좌</th>
								<td><%=pension.getP_account() %></td>
							</tr>
							<tr>
								<th>입/퇴실안내</th>
								<td>이용/시설안내 참조</td>
							</tr>
							<tr>
								<th>픽업안내</th>
								<td>픽업가능 (이용/시설안내 참조)</td>
							</tr>
							<tr>
								<th class="highlightFont">할인/이벤트</th>
								<td style=" padding:5px; border:solid 1px #ff4e00;">
									<div>
										<div>
											적립금
											<b><font class="highlightFont">2</font></b>% (결제액에 대한 적립금)
											<br>
											할인행사 : 08월 18일 ~ 06월 30일
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>판매가</th>
								<td>
									주중 <b><font class="highlightFont"><%=detail.getMin_wd(p_num)%>원</font></b>, 
									주말 <b><font class="highlightFont"><%=detail.getMin_we(p_num)%>원</font></b> 부터
								</td>
							</tr>
						</table>					
					</td>
				</tr>
			</table>
			<br>
	    	
			
			<!-- 주문영역 출력부 /////////////////////////////////////////////////////////// -->
			
	    	<div id="calsetdiv">
		    	<div id="calSet">
			    	<input type="button" id="back" value="이전" onClick="">
			    	<div id="periodSpace"></div>
			    	<input type="button" id="prev" value="다음" onClick="">
		    	</div>
	    	</div>
	    	
	    	<br>
	    	
	    	<table id="addOption">
	    	</table>
	    	<form method="post" id="goPay" action="Payment.jsp">
	    	<table id="addOrder">
	    		<tr class="payForm">
	    			<td colspan="7">
	    				<font size="2">총 금액 </font>
	    				<font size="5" color="#0080FF" id="totalPrice">0</font>
	    				<font size="2"> 원</font>
	    			</td>
	    		</tr>
	    		<tr class="payForm">
	    			<td colspan="7">
	    				<font size="2">총 적립금 </font>
	    				<font size="4" color="#0080FF" id="totalPoint">0</font>
	    				<font size="2"> 점</font>
	    			</td>
	    		</tr>
	    		<tr class="payForm">
	    			<td colspan="7">
		    			<div id="warning">
							기준인원 초과시 추가요금이 있습니다.<br>
							최대인원 초과로 인한 입실 거부시 환불도 되지 않으니 유의하시기 바랍니다.
						</div>
						<!-- 주문의 총 수를 구한다. -->
						<input type="hidden" id="orderAmount" name="orderAmount" value="">
						<input type="hidden" name="p_num" value="<%=p_num %>">
						<input type="button" id="pay_Button" name="pay_Button" Onclick="submitOrder()">
					</td>
	    		</tr>
	    	</table>
	    	</form>
	    	<div id="PhotoList"></div>
	    	<div id="RoomOptionList"></div>
	    </div>
	   
	    
	    <%@ include file="Review.jsp" %>
	    
	<%@ include file="Bottom.html" %>
	<%@ include file="Detail_intro.jsp" %>
</body>
</html>