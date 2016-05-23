<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");

DetailMgr detail=DetailMgr.getInstance();

int orderAmount=Integer.parseInt(request.getParameter("orderAmount"));
int p_num=Integer.parseInt(request.getParameter("p_num"));

List<Room_Dto> room=detail.getRoomMin(p_num); 
//Pension_Dto pension=detail.getPension(p_num);
//List<OrderRoom_Dto> order=detail.getOrder(p_num);

String orders[][]=new String[orderAmount][5];
for(int i=0; i<orderAmount; i++){
	orders[i][0]=request.getParameter("r_num"+i);
	orders[i][1]=request.getParameter("date"+i);
	orders[i][2]=request.getParameter("people"+i);
	orders[i][3]=request.getParameter("price"+i);
	orders[i][4]=request.getParameter("exPrice"+i);
}
%>

<html>
	<head>
		<link href="TopBottom.css" type="text/css" rel="stylesheet">
		<script src="moment.js"></script>
    	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    	<script>
	    	$(document).ready(function(){
	    		// 이게 정답인지는 모르겠다.
	    		<% for(int k=0; k<orderAmount; k++){ 
	    			String YYYY=(orders[k][1]).substring(0,4);
	    			String MM=(orders[k][1]).substring(5,7);
	    			String DD=(orders[k][1]).substring(8,10);
	    		%>	
	    			dataSet(
		    			<%= orders[k][0] %>,
		    			<%= YYYY %>,
		    			<%= MM %>,
		    			<%= DD %>,
		    			<%= orders[k][2] %>,
		    			<%= orders[k][3] %>,
		    			<%= orders[k][4] %>
	    			);
	    		<% } %>
	    		
	    		// 전역 설정
	    		$("#mainSizeSet").css({"width":"1000px","margin":"0 auto"});
	    		$("table").css("width","100%");
	    		$("td").css("padding","3px");
	    		
	    		// 쇼핑 리스트 설정
	    		$("#showOrderList").css({"text-align":"center"});
	    		$("#shoppingList").css({"background-color":"#71BFFF","color":"#FFFFFF"});
	    		$(".roomList").parent(":even").css({"background-color":"#EEEEEE"});
	    		$(".roomList").css({"background-color":"#0080FF","color":"#FFFFFF"});

	    		// 개인 정보 동의 폼
	    		$("#terms").css({"text-align":"left","border":"1px solid red"});
	    		$("input[type=text]").css({"font-size":"13pt","width":"100px"});
	    		$("#checkBoxes").css({"text-align":"left","margin":"0 auto","background-color":"#EEEEEE","width":"450px"});
	    		
	    		// 주문 폼 설정
	    		$("td[colspan=2]").css("text-align","center");
	    		$("input[type=text]").css({"font-size":"13pt","width":"100px"});
	    		$(".payForm").css({"width":"135px","padding":"0 0 0 180px","background-color":"#71BFFF"});
	    		$(".payForm").next().css("background-color","#EEEEEE");
	    		$("td[colspan=7]").css({"text-align":"right","padding":"0 100px"});
	    		$("select").css("font-size","13pt");
	    		$("textarea").css({"font-size":"13pt","width":"580px","height":"160px"});
	    		});
	    	
	    	var dataNumSet=0;
	    	function dataSet(r_num, YYYY, MM, DD, people, price, exPrice){
	    		var tossDatas='';
	    		
	    		var zero1='';
	    		var zero2='';
	    		if(MM<10){zero1='0';}
	    		if(DD<10){zero2='0';}
	    		
	    		tossDatas+='<input type="hidden" name="r_num'+dataNumSet+'" value="'+r_num+'">';
	    		tossDatas+='<input type="hidden" name="date'+dataNumSet+'" value="'+YYYY+'-'+zero1+MM+'-'+zero2+DD+'">';
	    		tossDatas+='<input type="hidden" name="people'+dataNumSet+'" value="'+people+'">';
	    		tossDatas+='<input type="hidden" name="price'+dataNumSet+'" value="'+price+'">';
	    		tossDatas+='<input type="hidden" name="exPrice'+dataNumSet+'" value="'+exPrice+'">';
	   			// What should I do???
	    		$("#insertData").append(tossDatas);	
	    		dataNumSet+=1;
	    	}
	    	
	    	function getWeekday(yy, mm, dd, i){
	    		var idSet="#dateDay"+i
	    		
	    		if(mm==7){
	    			if(dd>=15){
	    				$(idSet).append("<b><font color='#FF5050'>성수기</font></b>");
	    			}else{
	    				$(idSet).append("<b><font>비수기</font></b>");
	    			}
	    		}else if(mm==8){
	    			$(idSet).append("<b><font color='#FF5050'>성수기</font></b>");
	    		}else{
	    			$(idSet).append("<b><font>비수기</font></b>");
	    		}
	    		
	    	    var daySet = new Date(yy, mm-1, dd);
	    	    
	    	    if(daySet.getDay()==0||daySet.getDay()==6){
	    	    	$(idSet).append("<br><b><font color='#FF5050'>주말</font></b>");
	    	    }else{
	    	    	$(idSet).append("<br><b><font color='#0080FF'>주중</font></b>");
	    	    }
	    	}
	    	
	    	function commitPay(){
	    		var checker=0;
	    		$(".commitTerms").each(function(index, item){
	    			if($(item).is(":checked")==false){
	    				$(item).focus();
	    				alert("약관에 동의해주시기 바랍니다.");
	    				return false;
	    			}else{
	    				checker+=1;
	    			}
	    		});
	    		if(checker==5){
	    			commitInput();
	    		}	    		
	    	}
	    	
	    	$(document).on("click",".userInput",function(){
	    		var id='#'+$(this).attr("id");
	    		$(id).attr("checked", true);
	    		$("input[name=ou_paytype]").attr("value",$(id).val());	
	    		$(id).nextAll().attr("checked", false);
	    		$(id).prevAll().attr("checked", false);
	    	});
	    	
	    	function commitInput(){
	    		var e_call=$("select").val();
	    		e_call+='-'+$("#ou_emercall2").val();
	    		e_call+='-'+$("#ou_emercall3").val();
	    		
	    		$("input[name=ou_emercall]").val(e_call);
	    		
	    		var radioSet=0;
	    		$("input[name=payTypeSet]").each(function(idx,item){
	    			if($(item).attr("checked")=='checked'){
	    				radioSet+=1;
	    			}
	    		});
	    		
	    		if($("input[name=ou_customer]").val()==''){
	    			$("input[name=ou_customer]").focus();
	    			alert("예약자명을 확인해주시기 바랍니다.");
	    		}else if($("input[name=ou_birth]").val()==''){
	    			$("input[name=ou_birth]").focus();
	    			alert("생년월일을 확인해주시기 바랍니다.");
	    		}else if($("input[name=ou_emercall2]").val()==''){
	    			$("input[name=ou_emercall2]").focus();
	    			alert("전화번호를 확인해주시기 바랍니다.");
	    		}else if($("input[name=ou_emercall3]").val()==''){
	    			$("input[name=ou_emercall3]").focus();
	    			alert("전화번호를 확인해주시기 바랍니다.");
	    		}else if(radioSet==0){
	    			$("input[class=payTypeSet]").focus();
	    			alert("결제 정보를 확인해주시기 바랍니다.");
	    		}else{
	    			if($("textarea[name=ou_request]").val()==''){
	    				if(confirm("요청사항 없이 결제를 진행하시겠습니까?")){
	    					
	    				}
	    				else{
	    					$("textarea[name=ou_request]").focus();
	    					return false;
	    				}
	    			}
	    			$("#goPayProc").submit();
	    		}
	    	}

			function allCommitPay(){
	    		$(".commitTerms").each(function(index, item){
	    			if($(item).is(":checked")==false){
	    				$(item).prop("checked",true);
	    			}
	    		});
	    	}
	    	
		</script>
	</head>
	<body>
	<%@ include file="Top.jsp" %>
	<br>
		<div id="mainSizeSet">
			<table id="showOrderList" >
				<tr id="shoppingList">
					<td>객실명</td>
					<td>수용 인원</td>
					<td>이용일</td>
					<td>신청 인원</td>
					<td>요금 타입</td>
					<td>이용 요금</td>
					<td>결제액</td>
				</tr>
				<!-- from here -->
				<% 	// 선택된 모든 객실 리스트를 출력한다.
					// 최종 결제 앞이므로 모든 리스트가 필요하다.
					int totalPrice=0;
					for(int i=0; i<orderAmount; i++){
						for(int j=0; j<room.size(); j++){
							int roomNumber=Integer.parseInt(orders[i][0]);
							int originPrice=Integer.parseInt(orders[i][3]);
							int extraPrice=Integer.parseInt(orders[i][4]);
													
							if(roomNumber==room.get(j).getR_num()){
								totalPrice+=originPrice+extraPrice;
				%>
				<tr>
					<!-- 객실 이름 -->
					<td class="roomList"><%=room.get(j).getR_name() %></td>
					
					<!-- 수용 인원 -->
					<td>추천 : <%=room.get(j).getR_mincapa() %> 명 / 최대 : <%=room.get(j).getR_maxcapa() %> 명</td>
					
					<!-- 이용일 -->
					<td><%=orders[i][1] %></td>
					
					<!-- 신청 인원 -->
					<td>
				<%
					int roomPeopleAmt=Integer.parseInt(orders[i][2]);
					if(roomPeopleAmt>100){
						int temp=roomPeopleAmt/100;
						roomPeopleAmt=roomPeopleAmt%100+temp;
					}
				%>
					<%=roomPeopleAmt %> 명
					</td>
					
					<!-- 요금 타입(주중/주말:성수기/비수기) -->
					<td id="dateDay<%= i %>">
				<%
					int yy = Integer.parseInt(orders[i][1].substring(0, 4));
					int mm = Integer.parseInt(orders[i][1].substring(5, 7));
					int dd = Integer.parseInt(orders[i][1].substring(8));
				%>	
					<script>
						getWeekday(<%=yy %>, <%=mm %>, <%=dd %>, <%= i %>);
		    		</script>
					</td>
					
					<!-- 요금 계산 -->
					<td>
						기본 요금 : <%=originPrice/4*5 %>원<br>
						할인(20%) : -<%=originPrice/4 %>원<br>
				<%
								if(extraPrice!=0){
				%>
						추가 요금 : +<%=extraPrice %>원
				<%
								}
				%>
					</td>
					
					<!-- 총 계산 금액 -->
					<td><%=originPrice+extraPrice %>원</td>
				</tr>
				<% 
							}
						}
					}
				%>
				<!--to here -->
				<tr>
					<td colspan="7">
						<font size="3">총액 </font>
						<font size="5" color="blue"><%= totalPrice %></font>
						<font size="3"> 원</font>
					</td>
				</tr>
			</table>
			
			<br>
			
			<form method="post" id="goPayProc" action="PaymentProc.jsp">
				<table>
					<tr>
						<td colspan="2"><font size="5">개인정보 제 3자 제공 동의</font></td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="terms">
								개인정보의 제3자 제공
								<br>- 이용자의 경우
								<br>1) 개인정보를 제공받는 자 : 이용하고자 하는 해당 숙박업소. 미스터와이
								<br>2) 제3자의 개인정보 이용 목적 : 숙박업소를 이용하는 고객의 본인확인 및 미성년자 여부를 확인하고 연락을 유지하기 위함
								<br>3) 제공하는 개인정보의 항목 : 이름, 휴대전화번호, 이메일, 생년월일, 예약정보
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="checkBoxes">
								<input class="commitTerms" type="checkbox">&nbsp;이용시 유의사항에 동의
								<br><input class="commitTerms" type="checkbox">&nbsp;취소 수수료에 동의 <b><font color="red">(예약시점과 무관한 이용일 기준)</font></b>
								<br><input class="commitTerms" type="checkbox">&nbsp;개인정보 수집 및 이용에 동의
								<br><input class="commitTerms" type="checkbox">&nbsp;개인정보 제 3자 제공에 동의
								<br><input class="commitTerms" type="checkbox">&nbsp;이용자가 미성년자가 아니며 성인임에 동의
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input  id="allCommitTerms" type="button" value="모두 승인하기" OnClick="allCommitPay()"></td>
					</tr>
					<tr>
						<td colspan="2"><br><font size="5">예약정보 입력</font></td>
					</tr>
					<tr>
						<td class="payForm">예약자명</td>	
						<td><input name="ou_customer" class="userInput" type="text"></td>			
					</tr>
					<tr>
						<td class="payForm">생년월일</td>
						<td><input name="ou_birth" class="userInput" type="text"> ex : 890607</td>
					</tr>
					<tr>
						<td class="payForm">비상 연락처</td>
						<td>
							<select>
								<option value="010">010</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							- <input id="ou_emercall2" name="ou_emercall2" type="text">
							- <input id="ou_emercall3" name="ou_emercall3" type="text">
							<input name="ou_emercall" class="userInput" type="hidden">
						</td>
					</tr>
					<tr>
						<td class="payForm">예약시 요청사항</td>
						<td><textarea name="ou_request"></textarea></td>
					</tr>
					<tr>
						<td class="payForm">결재 금액</td>
						<td>총 <font size="5" color="#0080FF"><%= totalPrice %></font> 원</td>
					</tr>
					<tr>
						<td colspan="2">
							결제 정보 :&nbsp;
							<input type="radio" class="userInput" id="creditCard" name="payTypeSet" value="100">신용카드&nbsp;
							<input type="radio" class="userInput" id="realtimeSend" name="payTypeSet" value="10">실시간 계좌이체&nbsp;
							<input type="radio" class="userInput" id="SendToAccount" name="payTypeSet" value="1">무통장 입금
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="취소하기">&nbsp;&nbsp;
							<input type="button" value="결제하기" Onclick="commitPay()">
						</td>
					</tr>
					<tr>
						<td id="insertData">
							<input type="hidden" name="orderAmount" value='<%= orderAmount %>'>
							<input type="hidden" name="p_num" value='<%= p_num %>'>
							<input type="hidden" name="ou_paytype">
						</td>
					</tr>
				</table>
			</form>
		</div>
	<%@ include file="Bottom.html" %>
	</body>
</html>











