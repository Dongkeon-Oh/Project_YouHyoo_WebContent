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
    	</style>
  	</head>
  	<body>
	    <div>
	    	
	    	<script>
	    	
		    	// 달력 세팅
		    	var days=new Array("일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일");
	    		var checkDay=moment().format('dddd');
	    		var increaseDate=14;
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
	    		// 요일 출력 // 시작시 한번만 출력하면 되므로 메서드로 선언하지 않음.
	    		var daysSet='<tr id="days"><td></td>';
	    		for(var cnt=0; cnt<days.length; cnt++){
	    			daysSet+="<td class="+moment().add(cnt, 'days').format('dddd')+">"+days[cnt]+"</td>";
	    		}
	    		daysSet+="</tr>";
				$('#addOption').append(daysSet);
	    		colorSetOnCal();
	    		
	    		// 날짜 출력
	    		printDates()
	    		
	    		<% for(int i=0; i<room.size(); i++){ %>
	    		pensionNameGet("<%=room.get(i).getR_name()%>");
	    		<% } %>
	    		
	    		// 체크 박스 출력
	    		printCheckbox()
	    	});
    		
	    	// 색상 설정 // 토요일 : 파랑 , 일요일 or 성수기 : 빨강
    		function colorSetOnCal(){
    			$('.Sunday').css({'color':'#FFFFFF','font-size':15,"background-color":"#FF5050"});
    			$('.Saturday').css({'color':'#FFFFFF','font-size':15,"background-color":"#0080FF"});
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
    		
    		/////////////////////////////////////////
    		var pensionName=new Array();
    		var roomPrice=new Array();
    		
    		function pensionNameGet(pension){
    			pensionName.push(pension);
    		}
    		
    		function roomPriceGet(max_wd, max_we, min_wd, min_we){
    			// 0=성수기_주중, 1=성수기_주말, 2=비수기_주중, 3=비수기_주말
    			var price=[max_wd, max_we, min_wd, min_we];
    			roomPrice.push(price);
    		}
    		/*
    		function printCheckbox(){
    			var checkboxSet='';
	    		for(var j=0; j<<%=room.size()%>; j++){
	    			checkboxSet+="<tr id="+pensionName[j]+"><td>"+pensionName[j]+"</td>";
	    			for(var k=0; k<days.length; k++){
	    				var date=moment().add(k+increaseDate, 'days').format('MM-DD');
	    				checkboxSet+="<td><input type='checkbox' id="date+"></td>";
	    			}
	    			checkboxSet+="</tr>";
	    		}
	    		$('#addOption').append(checkboxSet);
    		}
			*/
    		function priceSetting(roomNum, max_wd, max_we, min_wd, min_we){
    			for(var j=0; j<days.length; j++){
	    			if((moment().add(j+increaseDate, 'days').format("MM-DD")<"07-15")
	    					||(moment().add(j+increaseDate, 'days').format("MM-DD")>("08-20"))){
	    				// 성수기일 때
	    				if(((days[j]||days[j-7])=='토')||((days[j]||days[j-7])=='일')){	
	    					// 주말이면
	    					document.write('<td><font size="2" color="#000000">'
	    							+max_we+'</font><br>'+bookedDate(roomNum, moment().add(j+increaseDate, 'days').format("YYYY-MM-DD"))+'</td>');
	    				}else{
	    					// 주중이면
	    					document.write('<td><font size="2" color="#000000">'
	    							+max_wd+'</font><br>'+bookedDate(roomNum, moment().add(j+increaseDate, 'days').format("YYYY-MM-DD"))+'</td>');
	    				}
	    			}else{
	    				// 비수기
	    				if(((days[j]||days[j-7])=='토')||((days[j]||days[j-7])=='일')){	
	    					// 주말이면
	    					document.write('<td><font size="2" color="#000000">'
	    							+min_we+'</font><br>'+bookedDate(roomNum, moment().add(j+increaseDate, 'days').format("YYYY-MM-DD"))+'</td>');
	    				}else{
	    					// 주중이면
	    					document.write('<td><font size="2" color="#000000">'
	    							+min_wd+'</font><br>'+bookedDate(roomNum, moment().add(j+increaseDate, 'days').format("YYYY-MM-DD"))+'</td>');
	    				}
	    			}
    			}
    		}
    		
    		function bookedDate(roomNum, dateCheck){
    			<% 
    				for(int i=0; i<order.size(); i++){ 
    				String orderDate=""+order.get(i).getO_date();
    			%>    			
    			var orderDate=new String('<%= orderDate%>');
    			if(dateCheck==orderDate&&roomNum==<%= order.get(i).getO_room()%>){
    				return '<font size="2" color="#FF0000">SOLD OUT</font>';
    			}else{
    				return '<input type="checkbox" id="'+dateCheck+'">';
    			}
    			<% } %>
    		}
    		
	    	</script>
	    	<input type="button" value="이전" onClick="">
	    	<input type="button" value="다음" onClick="">
	    	
	    	<table>
	    		<tbody id="addOption">
	    	<!--	
	    		<tr id="days">
	    			<td><script>printDays()</script></td>
	    		</tr>
	    		
	    		<tr id="date">
	    			<td><script>printDates()</script></td>
	    		</tr>
	    		<tr id="choices">
		    		<td><script>printCheckbox()</script></td>
	    		</tr>
	    		-->
	    	</table>
	    	
	    </div>
  	</body>
</html>