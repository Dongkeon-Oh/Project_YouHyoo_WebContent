<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
int p_num=1;
DetailMgr detail=DetailMgr.getInstance();

Pension_Dto pension=detail.getPension(p_num);
List<Room_Dto> room=detail.getRoom(p_num); 
List<OrderRoom_Dto> order=detail.getOrder(p_num);
%>
<html>
  	<head>
    	<script src="moment.js"></script>
    	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    	<meta charset="utf-8">
    	<style>
      		html, body {
      			width: 1000px;
        		height: 100%;
        		margin: 0;
        		padding: 0;
     		}
     		
     		td{
     			text-align: center;
     		}
     		
     		/* 달력 범위 변경 버튼 and 달력 범위 표시부 */ 
     		#calsetdiv{
     			background-color: #CCCCCC;
     		}
     		
     		#calSet{
     			padding: 5px;
     			width: 350px;
     			margin: 0 auto;
     		}
     		
     		#back{
     			float: left;
     			margin: 0px 30px 0px 0px;
     		}
     		
     		#periodSpace{
     			float: left;
     			margin: 0px 30px 0px 0px;
     		}
     		     		
     		/* 요일, 날짜, 성or비수기 출력부*/
     		#days{
     			background-color: #71BFFF;
     			color: #FFFFFF;
     			font-size: 17px;
     		}
     		
     		#dates{
     			background-color: #71BFFF;
     			color: #FFFFFF;
     			font-size: 17px;
     		}
     		
     		/* 펜션 정보 출력부 */ 
     		#addOption{
	     		width: 100%;
     			float: left;
	     		font-size: 13px;
     		}
     		
     		.roomOrderCheck{
     			padding: 3px;
     			text-align: center;
     			font-size: 20px; 
     			color: #ffffff;
     			background-color: #0080FF;
     		}
     		
     		/* 주문부 */
     		#addOrder{
	     		width: 100%;
     			float: left;
	     		font-size: 20px;
     		}
     		
     		.payForm > td{
     			text-align: right;
     		}
     		
     		#warning{
     			width:400px;
     			float: left;
     		}
    	</style>
  	</head>
  	<body>
	    <div>
	    	<script>
	    	
		    	// 달력 세팅
		    	var days=new Array("일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일");
	    		var checkDay=moment().format('dddd');
	    		var increaseDate=0;
	    		switch(checkDay){
		    		case 'Saturday': setDayForm();
		    		case 'Friday': setDayForm();
		    		case 'Thursday': setDayForm();
		    		case 'Wednesday': setDayForm();
		    		case 'Tuesday': setDayForm();
					case 'Monday': setDayForm();
				}
	    		
	    		function setDayForm(){
	    	   		var temp=days[0];
	        		for(var cnt=0; cnt<days.length; cnt++){
	        			days[cnt]=days[cnt+1];
	        		}
	        		days[days.length-1]=temp;        
	    		}
	    	
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
		    			<%=room.get(i).getR_maxcapa()%>
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
		    	
		    	// 기간 변경 - 이전일
				$(document).on("click","#back",function(){ 
					if(increaseDate-14<0){
						alert("예약이 불가능한 기간입니다.");
					}else{
						$('#addOption').html("");
						$('#periodSpace').html("");
						increaseDate-=14;
						printPeriod();
						printDays();
						printDates();
						printCheckbox();
						printOrderedDate();
					}	
				});
	    		
				// 기간 변경 - 이후일
				$(document).on("click","#prev",function(){ 
					$('#addOption').html("");
					$('#periodSpace').html("");
					increaseDate+=14;
					printPeriod();
					printDays();
					printDates();
					printCheckbox();
					printOrderedDate();
				});
	    		
		    	// 객실 이름 초기화
	    		var roomName=new Array();
				function roomNameGet(rName, rNum, max_capa, min_capa){
					var roomInfo=[rName, rNum, max_capa, min_capa];
					roomName.push(roomInfo);
	    		}
	    		
				// 객실 가격 초기화
	    		var roomPrice=new Array();
	    		function roomPriceGet(max_wd, max_we, min_wd, min_we){
	    			// 0=성수기_주중, 1=성수기_주말, 2=비수기_주중, 3=비수기_주말
	    			var price=[max_wd, max_we, min_wd, min_we];
	    			roomPrice.push(price);
	    		}
	    		
	    		// 객실 상태 초기화
	    		var roomState=new Array();
	    		function roomStateGet(room, state){
	    			var roomSet=[room, state];
	    			roomState.push(roomSet);
	    		}
	    		
		    	// 색상 설정 // 토요일 : 파랑 , 일요일 or 성수기 : 빨강
	    		function colorSetOnCal(){
	    			$('.Sunday').css({'color':'#FFFFFF',"background-color":"#FF5050"});
	    			$('.Saturday').css({'color':'#FFFFFF',"background-color":"#0080FF"});
	    		}
	    		
	    		// 기간 출력
	    		function printPeriod(){
		    		var daysSet=moment().add(increaseDate, 'days').format('YYYY-MM-DD')+" ~ "
		    				+moment().add(increaseDate+13, 'days').format('YYYY-MM-DD');
					$('#periodSpace').append(daysSet);
	    		}
	    		
		    	// 요일 출력
	    		function printDays(){
		    		var daysSet='<tr id="days"><td></td>';
		    		for(var cnt=0; cnt<days.length; cnt++){
		    			daysSet+="<td class="+moment().add(cnt, 'days').format('dddd')+">"
		    			+days[cnt]+"</td>";
		    		}
		    		daysSet+="</tr>";
					$('#addOption').append(daysSet);
		    		colorSetOnCal();
	    		}
		    			    	
	    		// 날짜 출력 
	    		function printDates(){ 
	    			var dateSet='<tr id="dates"><td></td>';
		    		for(var cnt=0; cnt<days.length; cnt++){
		    			var date=moment().add(cnt+increaseDate, 'days').format('MM-DD');
		    			var day=moment().add(cnt+increaseDate, 'days').format('dddd');
		    			dateSet+="<td class="+day+">"+date+"<br>"
		    			if(date>"07-15"&&date<"08-31"){
		    				dateSet+="성수기</td>";
		    			}else{
		    				dateSet+="비수기</td>";
		    			}
		    		}
		    		dateSet+="</tr>";
		    		$('#addOption').append(dateSet);
		    		colorSetOnCal();
		  		}
	    			    		
	    		// 선택 버튼 초기화
	    		function printCheckbox(){
	    			var checkboxSet='';
	    			
		    		for(var j=0; j<roomName.length; j++){
		    			checkboxSet+="<tr class='room'><td class='roomOrderCheck' id="+roomName[j][1]+"><b>"+roomName[j][0]+"</b></td>";
		    			for(var k=0; k<days.length; k++){
		    				var dateSet=k+increaseDate;
		    				var date=moment().add(dateSet, 'days').format('YYYY-MM-DD');
		    				var day=moment().add(dateSet, 'days').format('dddd');
		    						    				
		    				if(moment().add(dateSet, 'days').format('MM-DD')<"08-31"
		    						&&moment().add(dateSet, 'days').format('MM-DD')>"07-15"){
		    					if("Saturday"!=day&&"Sunday"!=day){ 
		    						checkboxSet+="<td class='"+j+"' id='"+date+"'>"+roomPrice[j][0]+" 원"
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약'></td>"; 
		    					}else{ 
		    						checkboxSet+="<td class='"+j+"' id='"+date+"'>"+roomPrice[j][1]+" 원"
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약'></td>"; 
		    					}
		    				}else{
		    					if("Saturday"!=day&&"Sunday"!=day){ 
		    						checkboxSet+="<td class='"+j+"' id='"+date+"'>"+roomPrice[j][2]+" 원"
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약'></td>"; 
		    					}else{ 
		    						checkboxSet+="<td class='"+j+"' id='"+date+"'>"+roomPrice[j][3]+" 원"
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약'></td>"; 
		    					}
		    				}
		    			}
		    			checkboxSet+="</td>";
		    		}
		    		$('#addOption').append(checkboxSet);
	    		}
	    		
	    		// 이미 예약된 방 검사
	    		function printOrderedDate(){
	    			for(var i=0; i<roomState.length; i++){
	    				$(".roomOrderCheck").each(function(index,item){
	    					if(roomState[i][0]==$(item).attr("id")){
	    						var innerClass="."+$(item).next().attr("class")
	    						$(innerClass).each(function(innerIndex,innerItem){
	    							if(roomState[i][1]==$(innerItem).attr("id")){
	    								$(innerItem).text("예약불가");
	    								$(innerItem).attr("class","disable");
	    							}
	    						});
	    					}
	    				});
	    			}
	    			$(".room:even").css("background-color", "#CCCCCC" );
	    		}
	    		
	    		// 주문 선택
	    		var orderCount=10000;
	    		$(document).on("click",".booking",function(){
	    			var orderDate=$(this).attr("id").substring( 5 );
	    			var originId=orderCount+''+$(this).attr('id');
	    			var targetDate=moment().add($(this).attr("id"), 'days').format('YYYY-MM-DD');
    				var targetDay=moment().add($(this).attr("id"), 'days').format('dddd');
    				
	    			$(this).attr('id',originId).attr('class','cancelButton').val('예약중');
	    				
	    			var targetIndex=$(this).parent().attr("class");
	    			// 0=성수기_주중, 1=성수기_주말, 2=비수기_주중, 3=비수기_주말
    				var targetPrice;
    				if(targetDate.substring( 5 )>"07-15"&&targetDate.substring( 5 )<"08-31"){
    					if("Saturday"!=targetDay&&"Sunday"!=targetDay){ 
    						targetPrice=roomPrice[targetIndex][0];
    					}else{
    						targetPrice=roomPrice[targetIndex][1];
    					}
    				}else{
						if("Saturday"!=targetDay&&"Sunday"!=targetDay){ 
							targetPrice=roomPrice[targetIndex][2];
    					}else{
    						targetPrice=roomPrice[targetIndex][3];
    					}
    				}
    				
    				//요일 세팅
    				if("Monday"==targetDay){			targetDay='월'}
    				else if("Tuesday"==targetDay){		targetDay='화'}
    				else if("Wednesday"==targetDay){	targetDay='수'}
    				else if("Thursday"==targetDay){		targetDay='목'}
    				else if("Friday"==targetDay){		targetDay='금'}
    				else if("Saturday"==targetDay){		targetDay='토'}
    				else if("Sunday"==targetDay){		targetDay='일'}
	    			
	    			var orderSet=
	    				'<tr id="'+orderCount+'" class="orders">'
	    					+'<td id="'+'rnumOrder'+targetIndex+'">'+roomName[targetIndex][0]
	    						+'<br><font size="2">최소 : '+roomName[targetIndex][3]+'명 / 최대 : '
	    						+roomName[targetIndex][2]+'명</font>'
	    					+'</td>'
	    					+'<td>'
	    						+targetDate+"<br>("+targetDay+"요일)"
	    					+'</td>'
	    					+'<td>'
	    						+'<select>'
	    						
	    			for(var i=1; i<=roomName[targetIndex][2]; i++){
	    				orderSet+='<option " value="'+i+'">'+i+' 명</option>';		
	    			}
	    						
					orderSet+=	'</select>'
    						+'</td>'
    						+'<td>'
	    						+'<font size="3">기본가 :'+targetPrice+" 원 </font>"
	    						+'<br><font size="3" color="#FF5050">객실 할인가 : - '+targetPrice/5+" 원 </font>"
	    					+'</td>'
	    					+'<td>'
	    						+'<font size="4">'+targetPrice/50+'</font>'
	    						+'<font size="4"> 점 </font>'
	    					+'</td>'
	    					+'<td>'
	    						+'<font class="prices" size="4">'+(targetPrice-targetPrice/5)+'</font>'
	    						+'<font size="4"> 원 </font>'
	    					+'</td>'
	    					+'<td>'
	    						+'<input class="cancelButton" id='+originId+' type="button" value="취소">'
	    					+'</td>'
	    				+'</tr>';
	    			$('#addOrder').prepend(orderSet);
	    			orderCount++;
	    			
	    			calcPricePoint(1);
	    		});
	    		
	    		$(document).on("click",".cancelButton",function(){
	    			var fullId='#'+$(this).attr("id");
	    			var originId=$(this).attr("id").substring(5);
	    			var orderNum='#'+$(this).attr("id").substring(0,5);
	    			$(orderNum).html("");
	    		
	    			$(this).attr("id",originId).attr("class","booking").val('예약');
	    			$(fullId).attr("id",originId).attr("class","booking").val('예약');
	    			
	    			calcPricePoint(-1);
	    		});
	    		
	    		var orderListSet=0;	// 주문 목록이 있는지 검사하기 위한 변수 0이 되면 주문 내역이 없는 것임.
	    		var orderMenu="	<tr id='orderMenuBar'>"
								+"<td>객실 이름</td>"
								+"<td>이용일</td>"
								+"<td>대여 인원</td>"
								+"<td>이용 요금</td>"
								+"<td>포인트</td>"
								+"<td>이용 요금</td>"
								+"<td>취소</td>"
							+"	</tr>"
	    		function calcPricePoint(sizeSet){
	    			// 객실 총 임대료 계산
	    			var t_price=0;
	    			$(".prices").each(function(index,item){
	    				t_price+=($(item).text()-0);
	    			});
	    			$("#totalPrice").text(t_price);
	    			
	    			// 객실 총 임대료에 다른 2% 포인트 계산
	    			$("#totalPoint").text(t_price/50);
	    			
	    			// 객실 선택 내용이 없는 경우 총 금액, 포인트, 버튼등은 출력되지 않음
	    			orderListSet+=sizeSet;
	    			if(orderListSet==0){
	    				$(".payForm").hide();
	    		//		$("#orderMenuBar").html("");
	    				//$('#addOrder').prepend("");
	    			}else{
	    				$(".payForm").show();
	    		//		$('#addOrder').prepend(orderMenu);
	    			}
	    		}
	    	</script>
	    	<!-- Size tester /////////////////////////////////////////////////////////// -->
	    	<div style="width:1000px; height:15px; background-color:#0080FF;"></div>
	    	<!-- Size tester /////////////////////////////////////////////////////////// -->
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
						<input type="button" value="결제하기">
					</td>
	    		</tr>
	    	</table>
	    </div>
  	</body>
</html>