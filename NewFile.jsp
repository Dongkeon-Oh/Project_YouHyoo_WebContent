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
     		select{
     			width: 100px;
     		}
     		
     		.payForm > td{
     			text-align: right;
     		}
     		
     		#warning{
     			background-color: #EEEEEE;
     			padding : 5px;
     			font-size : 15px;
     			width:400px;
     			float: left;
     			text-align: left;
     		}
     		
     		#pay_Button{ 
				width: 150px;
				height: 60px;
				vertical-align: bottom;
			 	background-image: url('imgs/DetailView/orderButton.jpg'); 
			 	background-position: top right; 
			 	background-repeat: no-repeat;
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
	    		
	    		// 이용중인 객실 상태 초기화
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
	    						+'<br><font size="2">추천 : '+roomName[targetIndex][3]+'명 / 최대 : '
	    						+roomName[targetIndex][2]+'명</font>'
	    					+'</td>'
	    					+'<td>'
	    						+targetDate+"<br>("+targetDay+"요일)"
	    					+'</td>'
	    					+'<td>'
	    						+'<select class="people" name="people">'
		    						+'<optgroup label="추천 인원">'
		    			for(var i=1; i<=roomName[targetIndex][3]; i++){
		    				orderSet+='<option " value="'+i+'">'+i+' 명</option>';		
		    			}
		    				orderSet+='<optgroup label="추가 인원">'
		    					// 추가 인원만큼만 for문이 작동해야 함.
		    					var extrapeople=roomName[targetIndex][2]-roomName[targetIndex][3];
		    			for(var i=1; i<=extrapeople; i++){
		    				// 추가인원은 처리방법을 모색하던중 100의 자리로 관리가 가능 할 것으로 여겨 백의 자리로 주었음.
		    				orderSet+='<option " value="'+(i*100+roomName[targetIndex][3])+'">'+(roomName[targetIndex][3]+i)+' 명</option>';		
		    			}
	    						
					orderSet+=	'</select>'
								+'<input type="hidden" name="price" id="price" value="'+(targetPrice-targetPrice/5)+'">'
								+'<input type="hidden" name="exPrice" id="exPrice" value="0">'
								+'<input type="hidden" name="date" value='+targetDate+'>'
								+'<input type="hidden" name="r_num" value='+roomName[targetIndex][1]+'>'
    						+'</td>'
    						+'<td id="personPerPrice">' // id는 최대인원에 따라 가격을 변경하는 로직이 접근 할 수 있도록 하기 위해 주었음
	    						+'<font size="3">기본가 :'+targetPrice+" 원 </font>"
	    						+'<br><font size="3" color="#FF5050">객실 할인가 : - '+targetPrice/5+" 원 </font>"
	    					+'</td>'
	    					+'<td>'
	    						+'<font class="points" size="4">'+(targetPrice*4/5)/50+'</font>'
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
	    		
	    		// 인원수 변경시 추가요금 계산
	    		$(document).on("click",".people",function(){
	    			// 일단 추가 요금에 관한 정보를 지움
	    			$(this).parent().next().children(".exPriceBlock").remove();
	    			$(this).parent().next().children(".exPriceSet").remove();
	    			
	    			//Math.floor()는 버림을 처리하는 부분임. 이 함수가 없으면 2.02명 같은 이상한 수가 출력됨
	    			var overPeole=Math.floor($(this).val()/100);
	    			
	    			// 바뀔 가격 계산
	    			var changedPrice=($(this).next().val()*1)+overPeole*10000;
	    			
	    			// 만약 추가인원 (overPeole)이 0보다 크면 추가 요금은 계산한다.
	    			if(overPeole>0){
	    				// 추가요금이 발생함을 알린다.
	    				$(this).parent().next().append('<br class="exPriceBlock"><font class="exPriceSet" size="3" color="red">추가 요금 : '
	    						+overPeole+"명 ("+overPeole*10000+'원)</font>');
	    				
	    				// 추가요금을 input 태그에 값으로 입력한다.
		    			$(this).next().next("#exPrice").attr("value",overPeole*10000);
	    				
	    			// 추가인원이 없으면 추가요금을 출력하는 코드를 지우고, 추가요금을 전달하는 input 태그는 0으로 초기화하여 주문사항에서 제외한다.
	    			}else{
	    				$(this).parent().next().children(".exPriceBlock").remove();
		    			$(this).parent().next().children(".exPriceSet").remove();
		    			$(this).next().next("#exPrice").attr("value",0);
	    			}
					
	    			// 요금 출력
	    			$(this).parent().parent().children(":eq(5)").children(":first").text(changedPrice);
	    			calcPricePoint(0);
	    		});
	    		
	    		// 취소 버튼 클릭시 목록 삭제
	    		$(document).on("click",".cancelButton",function(){
	    			var fullId='#'+$(this).attr("id");
	    			var originId=$(this).attr("id").substring(5);
	    			var orderNum='#'+$(this).attr("id").substring(0,5);
	    			$(orderNum).remove();
	    		
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
	    			
	    			// 객실 임대료에 다른 2% 포인트 계산. 추가 비용은 포인트에 합산되지 않음
	    			var t_point=0;
	    			$(".points").each(function(index,item){
	    				t_point+=($(item).text()-0);
	    			});
	    			$("#totalPoint").text(t_point);
	    			
	    			// 객실 선택 내용이 없는 경우 총 금액, 포인트, 버튼등은 출력되지 않음
	    			orderListSet+=sizeSet;    			
	    			if(orderListSet==0){
	    				$("#addOrder").hide();
	    		//		$("#orderMenuBar").html("");
	    			}else{
	    				$("#addOrder").show();
	    			}
	    			
	    			$('#orderMenuBar').remove();
	    			$('#addOrder').prepend(orderMenu);
	    			$(".orders").css("background-color", "#EEEEEE" );
	    		}
							
				function submitOrder(){
					$(".orders").each(function(index, item){
						$(item).find(":input").each(function(innerIdx, innerItm){
							var temp=$(innerItm).attr("name");
							$(innerItm).attr("name",temp+""+index);
						});
						$("#orderAmount").attr("value",index+1);
					});
					$("#goPay").submit();
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
	    </div>
  	</body>
</html>