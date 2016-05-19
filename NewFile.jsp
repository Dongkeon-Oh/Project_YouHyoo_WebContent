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
    	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    	<script src="moment.js"></script>
    	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    	<meta charset="utf-8">
    	<title>Info windows</title>
    	<style>
      		html, body {
        		height: 100%;
        		margin: 0;
        		padding: 0;
     		}
     		#periodSpace{
     			width: 500px;
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
		    		
		    		// 체크 박스 출력
		    		printCheckbox();
		    		
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
					});
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
	    			$('.Sunday').css({'color':'#FFFFFF','font-size':15,"background-color":"#FF5050"});
	    			$('.Saturday').css({'color':'#FFFFFF','font-size':15,"background-color":"#0080FF"});
	    		}
	    		
		    	// 요일 출력
	    		function printDays(){
		    		var daysSet='<tr id="days"><td></td>';
		    		for(var cnt=0; cnt<days.length; cnt++){
		    			daysSet+="<td class="+moment().add(cnt, 'days').format('dddd')+">"+days[cnt]+"</td>";
		    		}
		    		daysSet+="</tr>";
					$('#addOption').append(daysSet);
		    		colorSetOnCal();
	    		}
		    	
		    	// 기간 출력
	    		function printPeriod(){
		    		var daysSet=moment().add(increaseDate, 'days').format('YYYY-MM-DD')+" ~ "
		    				+moment().add(increaseDate+13, 'days').format('YYYY-MM-DD');
					$('#periodSpace').append(daysSet);
	    		}
		    	
	    		// 날짜 출력 
	    		function printDates(){ 
	    			var dateSet='<tr id="dates"><td></td>';
		    		for(var cnt=0; cnt<days.length; cnt++){
		    			var date=moment().add(cnt+increaseDate, 'days').format('MM-DD');
		    			var day=moment().add(cnt+increaseDate, 'days').format('dddd');
		    			dateSet+="<td class="+day+">"+date+"<br><font size='3'>"
		    			if(date>"07-15"&&date<"08-31"){
		    				dateSet+="성수기</font></td>";
		    			}else{
		    				dateSet+="비수기</font></td>";
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
		    			checkboxSet+="<tr class='room' ><td>"+roomName[j][0]+"</td>";
		    			for(var k=0; k<days.length; k++){
		    				var dateSet=k+increaseDate;
		    				var date=moment().add(dateSet, 'days').format('YYYY-MM-DD');
		    				var day=moment().add(dateSet, 'days').format('dddd');
		    						    				
		    				if(moment().add(dateSet, 'days').format('MM-DD')<"08-31"
		    						&&moment().add(dateSet, 'days').format('MM-DD')>"07-15"){
		    					if("Saturday"!=day&&"Sunday"!=day){ 
		    						checkboxSet+="<td id='"+j+"'>"+roomPrice[j][0]
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약하기' onclick=''></td>"; 
		    					}else{ 
		    						checkboxSet+="<td id='"+j+"'>"+roomPrice[j][1]
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약하기' onclick=''></td>"; 
		    					}
		    				}else{
		    					if("Saturday"!=day&&"Sunday"!=day){ 
		    						checkboxSet+="<td id='"+j+"'>"+roomPrice[j][2]
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약하기' onclick=''></td>"; 
		    					}else{ 
		    						checkboxSet+="<td id='"+j+"'>"+roomPrice[j][3]
		    						+"<br><input class='booking' id="+dateSet+" type='button' value='예약하기' onclick=''></td>"; 
		    					}
		    				}
		    			}
		    			checkboxSet+="</td>";
		    		}
		    		$('#addOption').append(checkboxSet);
	    		}
	    		
	    		// 주문 선택
	    		var orderCount=10000;
	    		$(document).on("click",".booking",function(){
	    			var orderDate;
	    			if($(this).attr('value')=='예약하기'){
	    				$(this).val('예약대기');
	    				
	    				orderDate=$(this).attr("id");	    			
					
	    			var targetIndex=$(this).parent().attr("id");
	    			var targetDate=moment().add($(this).attr("id"), 'days').format('YYYY-MM-DD');
    				var targetDay=moment().add($(this).attr("id"), 'days').format('dddd');
    				
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
	    			
	    			var orderSet=
	    				'<tr id="'+orderCount+'">'
	    					+'<td id="'+'rnumOrder'+targetIndex+'">'+roomName[targetIndex][0]
	    						+'<br><font size="2">최소 : '+roomName[targetIndex][3]+'명 / 최대 : '
	    						+roomName[targetIndex][2]+'명</font>'
	    					+'</td>'
	    					+'<td>'
	    						+targetDate+"("+targetDay+")"
	    					+'</td>'
	    					+'<td>'
	    						+'<select>'
	    						
	    			for(var i=1; i<=roomName[targetIndex][2]; i++){
	    				orderSet+='<option " value="'+i+'">'+i+'</option>';		
	    			}
	    						
					orderSet+=	'</select>'
    						+'</td>'
    						+'<td>'
	    						+'<font size="3">기본가 :'+targetPrice+" 원 </font>"
	    						+'<br><font size="3" color="#FF5050">객실 할인가 : - '+targetPrice/5+" 원 </font>"
	    					+'</td>'
	    					+'<td>'
	    						+'<font class="prices" size="4">'+(targetPrice-targetPrice/5)+" 원 </font>"
	    					+'</td>'
	    					+'<td>'
	    						+'<input class="cancelButton" id='+orderCount+' type="button" value="취소">'
	    					+'</td>'
	    				+'</tr>';
	    			$('#addOrder').append(orderSet);
	    			orderCount++;
	    			
	    			}else{
	    				
	    				$(this).val('예약하기');
	    				orderDate='';
	    			}
	    		});
	    		
	    		$(document).on("click",".cancelButton",function(){
	    			
	    			alert($(this).parent().parent().html());
	    			orderCount--;
	    		});
	    		
	    		
	    		
	    	</script>
	    	<input type="button" id="back" value="이전" onClick="">
	    	<div id="periodSpace"></div>
	    	<input type="button" id="prev" value="다음" onClick="">
	    	
	    	<table id="addOption">
	    	</table>
	    	<table id="addOrder">
	    	
	    	</table>
	    </div>
  	</body>
</html>