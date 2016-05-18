<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<!-- 디테일뷰 우헤헤헤헤~~ -->    
<%
request.setCharacterEncoding("utf-8");
//int p_num=Integer.parseInt(request.getParameter("p_num"));
int p_num=1;
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
    	<link href="Index.css" type="text/css" rel="stylesheet">
    	<meta charset="utf-8">
    	<style>
      		body {
        		height: 100%;
        		margin: 0;
        		padding: 0;
     		}
     		
      		#outLine{
      			margin: 0 auto;
      			width: 1000px;
      		}
      		  
      		table{
      			width: 100%;
      		}
      		
      		#pensionImg{
				width: 320px;
      			height: 240px;
				display: block; 
				margin-left: auto; 
				margin-right: auto;
      		}      		
      		
      		#imgMenu{
      			text-align:center;
      		}
      		
      		.btnSet{
      			background-color:#bbbbbb; 
      			margin-left:5px; 
      			color:White; 
      			padding:2px; 
      			border:solid 1px gray; 
      			font-size:11px;"
      		}
      		
      		.highlightFont{
      			color:#ff6c00;
      		}
      		
      		#pensionName{
      			font-weight: bold; 
      			text-align: center;"
      		}
    	</style>
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
					
					<td>
						<table>
							<tr>
								<td colspan="2" id="pensionName">
									<font size="5"><%=pension.getP_name() %></font>&nbsp;&nbsp;
									<a href="javascript:QuickMenu('map')" class="btnSet">찜하기</a>
								</td>
							</tr>
							<tr>
								<th>펜션주소</th>
								<td>
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

<!-- /////////////////////////////////////////////////////////////////////// -->
<script>
	    	var days=new Array("일", "월", "화", "수", "목", "금", "토");
	    	
    		var checkDay=moment().format('dddd');
    		var checkToday=moment().format('DD');
    		var increaseDate=15;

    		var checkYear=moment().format('YYYY');
    		
    		function setDayForm(){
    	   		var temp=days[0];
        		for(var j=0; j<6; j++){
        			days[j]=days[j+1];
        		}
        		days[6]=temp;        
    		}
    		
    		switch(checkDay){
	    		case 'Saturday': setDayForm();
	    		case 'Friday': setDayForm();
	    		case 'Thursday': setDayForm();
	    		case 'Wednesday': setDayForm();
	    		case 'Tuesday': setDayForm();
				case 'Monday': setDayForm();
			}
    	
    		function dateAdd(){
    			increaseDate-=14;
    		}
    		
    		function dateSub(){
    			increaseDate+=14;
    		}
    		
    		function printDays(){
	    		//document.write('<div><table><tr>');
	    		for(var i=0; i<2; i++){
		    		for(var j=0; j<days.length; j++){
		    			if(days[j]=='토'){
		    				document.write('<td id="cal_saturday"><font size="2" color="#FFFFFF">'+days[j]+'</font></td>');
		    			}else if(days[j]=='일'){
		    				document.write('<td id="cal_sunday"><font size="2" color="#FFFFFF">'+days[j]+'</font></td>');
		    			}else{
			    			document.write('<td><font size="2" color="#000000">'+days[j]+'</font></td>');
			    		}
		    		}
	    		}
	    		//document.write('</tr></table></div>');
    		}
    		
    		function printDates(){
		    	for(var j=0; j<days.length*2; j++){
		    		if((days[j]||days[j-7])=='토'){
		    			document.write('<td><table><tr><td id="cal_saturday"><font size="2" color="#FFFFFF">'
		    					+moment().add(j+increaseDate, 'days').format("DD")
		    					+'</font></td></tr>');
		    			if((moment().add(j+increaseDate, 'days').format("MM-DD")<"07-15")
		    					||(moment().add(j+increaseDate, 'days').format("MM-DD")>("08-20"))){
		    				document.write('<tr><td><font size="2" color="#000000">비수기</font><td></tr></table></td>');
		    			}else{
		    				document.write('<tr><td><font size="2" color="#FF6060">성수기</font><td></tr></table></td>');
		    			}
		    		}else if((days[j]||days[j-7])=='일'){
		    			document.write('<td><table><tr><td id="cal_sunday"><font size="2" color="#FFFFFF">'
		    					+moment().add(j+increaseDate, 'days').format("DD")
		    					+'</font></td>');
		    			if((moment().add(j+increaseDate, 'days').format("MM-DD")<"07-15")
		    					||(moment().add(j+increaseDate, 'days').format("MM-DD")>("08-20"))){
		    				document.write('<tr><td><font size="2" color="#000000">비수기</font><td></tr></table></td>');
		    			}else{
		    				document.write('<tr><td><font size="2" color="#FF6060">성수기</font><td></tr></table></td>');
		    			}
		    		}else{
			   			document.write('<td><table><tr><td><font size="2" color="#000000">'
			   					+moment().add(j+increaseDate, 'days').format("DD")
			   					+'</font></td>');
			   			if((moment().add(j+increaseDate, 'days').format("MM-DD")<"07-15")
		    					||(moment().add(j+increaseDate, 'days').format("MM-DD")>("08-20"))){
		    				document.write('<tr><td><font size="2" color="#000000">비수기</font><td></tr></table></td>');
		    			}else{
		    				document.write('<tr><td><font size="2" color="#FF6060">성수기</font><td></tr></table></td>');
		    			}
		    		}
	   			}
    		}
    		
    		function priceSetting(roomNum, max_wd, max_we, min_wd, min_we){
    			for(var j=0; j<days.length*2; j++){
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
    		/*
    		$(function(){
				alert("test");
        		$('#test1').printDays();
            		
    		});
    		*/
    		
	    	</script>
	    	
	    	<input type="button" value="이전" onClick="dateSub()">
	    	<script></script>
	    	<input type="button" value="다음" onClick="dateAdd()">
	    	
	    	<table border="1">
	    		<tr id="test1">
	    			<td ></td>
	    			<script>printDays()</script>
	    		</tr>
	    		<tr>
	    			<td></td>
	    			<script>printDates()</script>
	    		</tr>
	    		<% for(int i=0; i<room.size(); i++){ %>
		    	<tr>
		    		<td><font size="2"><%=room.get(i).getR_name() %></font></td>
		    		<script>
		    			priceSetting(
		    				<%=room.get(i).getR_num() %>,	
		    				<%=room.get(i).getR_max_wd() %>,
		    				<%=room.get(i).getR_max_we() %>,
		    				<%=room.get(i).getR_min_wd() %>,
		    				<%=room.get(i).getR_min_we() %>
		    			)
		    		</script>
		    	</tr>
	    		<% } %>
	    		
	    	</table>
	    	</div>
	<%@ include file="Bottom.html" %>
</body>
</html>