<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");

%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#tabs" ).tabs();
  });
  
  function nullDestroy(){
	  $("p").each(function(index, item){
		  if($(item).text()=="null"){
			  $(item).remove();
		  }
	  });
	  
  }
  </script>
</head>
<body>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">소개/인사말</a></li>
    <li><a href="#tabs-2">이용/시설 안내</a></li>
    <li><a href="#tabs-3">주의/이용/취소안내</a></li>
  </ul>
  <div id="tabs-1">
    <%
    PensionDao dao=PensionDao.getInstance();
    //int p_num=Integer.parseInt(request.getParameter("p_num"));
    int p_num=1;
    InsertDto dto=dao.PensionDetail(p_num);
    %>
    <p><%=dto.getP_intro() %></p>
  </div>
  <div id="tabs-2">
    <p><%=dto.getRs_meal() %></p>
    <p><%=dto.getRs_party() %></p>
    <p><%=dto.getRs_board()%></p>
    <p><%=dto.getRs_pickup()%></p>
    <p><%=dto.getRs_inet()%></p>
    <p><%=dto.getRs_movie()%></p>
    <p><%=dto.getRs_cafe()%></p>
    <p><%=dto.getRs_shuttle()%></p>
    <p><%=dto.getRf_pool()%></p>
    <p><%=dto.getRf_slide()%></p>
    <p><%=dto.getRf_soccer()%></p>
    <p><%=dto.getRf_jokgoo()%></p>
    <p><%=dto.getRf_bbq()%></p>
    <p><%=dto.getRf_campfire()%></p>
    <p><%=dto.getRf_karaoke()%></p>
    <p><%=dto.getRf_basketball()%></p>
    <p><%=dto.getRf_seminar()%></p>
    <p><%=dto.getRf_bike()%></p>
    <p><%=dto.getRf_4wbike()%></p>
    <p><%=dto.getRf_servival()%></p>
  </div>
  
  <div id="tabs-3">
	<div style="font-weight:bold; color:Black; margin:0px 0px 5px 0px;">이용시유의사항</div>
		<div class="smtView">
			<p>떠나요닷컴은 통신판매 중개자로써. 펜션운영은 펜션주의 책임하에 운영되고 있습니다.<br>
			펜션 현장에서 일어난 일에 대해서는 떠나요닷컴은 책임이 없습니다.<br>
			예약관리는 특성상 약간의 시간차에 의하여 오차가 발생할수 있습니다.<br>
			오차에 의한 중복예약 발생시 먼저 예약된 예약건이 우선시 되며 떠나요닷컴과 펜션측에선 어떤 책임의 의무도 지지않습니다.<br>
			
			보호자 동반없는 <span style="color: rgb(255, 108, 0);">미성년자는 예약 및 입실 불가합니다.</span><br>
			예약시 신청하신 <span style="color: rgb(255, 108, 0);">인원이외에 추가인원은 입실이 거부될 수 있습니다.</span><br>
			예약인원 초과로 인한 입실 거부시 환불도 되지 않으니 유의하시기 바랍니다.<br>
			예약후 펜션이나 객실 변경은 해당예약 취소후 다시 예약하셔야 합니다.<br>
			예약변경을 위한 <span style="color: rgb(255, 108, 0);">취소시에도 취소수수료가 부과</span>되오니 신중하게 예약하시기 바랍니다.<br>
			최대인원이 2인인 커플전용룸의 경우 유아나 아동은 동반입실이 불가능합니다.<br>
			<span style="color: rgb(255, 108, 0);">애완견 동반시 입실이 불가능 </span>합니다.<br>
			퇴실 시에는 내집같이 정돈을 부탁 드립니다.</p><br>
		</div>
		
	<div style="font-weight:bold; color:Black; margin:0px 0px 5px 0px;">예약취소 및 취소수수료안내</div>
		<div class="cancelnote">
			<p>예약취소는 구매한 사이트 "MYPAGE" 혹은 "예약확인/취소"에서 가능합니다. (전화처리는 영업시간내에만 가능)<br>
			취소수수료는 예약시점과는 무관한 <span style="color: rgb(255, 108, 0);">이용시작일 기준</span>입니다.<br>
			환불시 <span style="color: rgb(255, 108, 0);">결제하신 금액에서 취소수수료를 제외한 금액을 환불</span>해 드립니다.<br>
			취소수수료는 결제금액이 아닌 예약금(객실요금+기타옵션요금) 기준으로 책정됩니다.<br>
			<b>취소수수료가 100% 인 경우 전액 환불되지 않습니다.</b><br>
			수수료 내역은 아래와 같습니다.</p>
		<table class="cancelfee">
		<tr>
			<th>
				기준
			</th>
			<th>
				취소수수료(%)
			</th>
			<th>
				환불액(%)
			</th>
		</tr>
		
		<tr>
			<td>이용일 <b>당일</b> 취소시</td>
			<td>100%</td>
			<td>0% 환불없음</td>
		</tr>	
		
		<tr>
			<td>이용일 <b>1</b> 일전 취소시</td>
			<td>70%</td>
			<td>30% 환불</td>
		</tr>	
		
		<tr>
			<td>이용일 <b>2</b> 일전 취소시</td>
			<td>50%</td>
			<td>50% 환불</td>
		</tr>	
		
		<tr>
			<td>이용일 <b>3</b> 일전 취소시</td>
			<td>30%</td>
			<td>70% 환불</td>
		</tr>	
		
		<tr>
			<td>이용일 <b>4</b> 일전 취소시</td>
			<td>20%</td>
			<td>80% 환불</td>
		</tr>	
		
		<tr>
			<td>이용일 <b>5</b> 일전 취소시</td>
			<td>15%</td>
			<td>85% 환불</td>
		</tr>	
		
		<tr>
			<td>이용일 <b>6</b> 일전 취소시</td>
			<td>10%</td>
			<td>90% 환불</td>
		</tr>
		
		<tr id="ctt_ctt_CancelFee_tr_basefee" class="basefee">
			<td>기본 취소 수수료</td>
			<td>10%</td>
			<td>90% 환불</td>
		</tr>
		</table>
		<br>
		</div>
		<br>
		
	<div style="font-weight:bold; color:Black; margin:0px 0px 5px 0px;">무통장 입금안내</div>
		<div class="inputbankmemo">
			<p>입금계좌 : 국민 448601-01-509071 피크소프트(떠나요닷컴)<br>
			<span style="color: rgb(255, 108, 0);">예약시 입력하신 휴대폰으로 입금계좌가 전송됩니다.</span><br>
			예약신청 하신뒤 정해진 시간내에 입금 하시면 예약이 완료 됩니다.<br>
			<span style="color: rgb(255, 108, 0);">입금확인이 되면. 예약완료정보(업소연락처,예약번호등)가 핸드폰으로 전송</span>됩니다.<br>
			무통장입금시 반드시 예약자명으로 입금하셔야합니다. 입금확인이 되지 않을 수 있습니다.</p><br>
		</div>
	  </div>
	</div>
<script>
nullDestroy();
</script>
 
</body>
</html>