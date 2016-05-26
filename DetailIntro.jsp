<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
PensionDao dao=PensionDao.getInstance();
int p_num=Integer.parseInt(request.getParameter("p_num"));

InsertDto dto=dao.PensionDetail(p_num);
%>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <style>
	/*tab*/
	ul.tabs {
		margin: 0;
		padding: 0;
		float: left;
		list-style: none;
		height: 32px; /*--Set height of tabs--*/
		border-bottom: 1px solid #999;
		border-left: 1px solid #999;
		width: 100%;
	}
	ul.tabs li {
		float: left;
		margin: 0;
		padding: 0;
		height: 31px; /*--Subtract 1px from the height of the unordered list--*/
		line-height: 31px; /*--Vertically aligns the text within the tab--*/
		border: 1px solid #999;
		border-left: none;
		margin-bottom: -1px; /*--Pull the list item down 1px--*/
		overflow: hidden;
		position: relative;
		background: #e0e0e0;
	}
	ul.tabs li lable{
		text-decoration: none;
		color: #000;
		display: block;
		font-size: 1.2em;
		padding: 0 20px;
		border: 1px solid #fff; /*--Gives the bevel look with a 1px white border inside the list item--*/
		outline: none;
	}
	ul.tabs li lable:hover {
		background: #ccc;
	}
	html ul.tabs li.active, html ul.tabs li.active lable:hover  { /*--Makes sure that the active tab does not listen to the hover properties--*/
		background: #fff;
		border-bottom: 1px solid #fff; /*--Makes the active tab look like it's connected with its content--*/
	}
	
	/*content*/
		border: 1px solid #999;
		border-top: none;
		overflow: hidden;
		clear: both;
		float: left; width: 100%;
		background: #fff;
	}
	.tab_content {
		padding: 20px;
		font-size: 1.2em;
	}
  </style>
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <meta charset="utf-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <style>
  	#tabs{
  		width:1000px;
  	}
  </style>
  <script>
  $(function(){
    $("#tabs-2").hide();
    $("#tabs-3").hide();
    
    $(document).on("click","#la_tab1",function(){
      	$("#tabs-1").show();
      	$("#tabs-2").hide();
      	$("#tabs-3").hide();
      	$("#tabs-4").hide();
      });
    $(document).on("click","#la_tab2",function(){
      	$("#tabs-1").hide();
      	$("#tabs-2").show();
      	$("#tabs-3").hide();
      	$("#tabs-4").hide();
      	
      });
    $(document).on("click","#la_tab3",function(){
      	$("#tabs-1").hide();
      	$("#tabs-2").hide();
      	$("#tabs-3").show();
      	$("#tabs-4").hide();
      });
    $(document).on("click","#la_tab4",function(){
      	$("#tabs-1").hide();
      	$("#tabs-2").hide();
      	$("#tabs-3").hide();
      	$("#tabs-4").show();
      });
  });
  
  function nullDestroy(){
	  $("p").each(function(index, item){
		  if($(item).text()=="null"){
			  $(item).remove();
		  }
	  });
	  
  };
  </script>
</head>
<body>

<table>
		<tr>
			<td width="1000px" height="40px"></td>
		</tr>
		<tr>
	<tr>
		<td>
		
		
<ul class="tabs">
	<li><lable id="la_tab1">소개/인사말</lable></li>
	<li><lable id="la_tab2">이용/시설안내</lable></li>
	<li><lable id="la_tab3">주의/이용/취소안내</lable></li>
	<li><lable id="la_tab4">찾아오시는 길</lable></li>
</ul>
<div class=tab_container>
  <!-- 소개/인사말 -->
  <div id="tabs-1" class="tab_content">
  	<table>
  	<tr>
  		<td><p><%=dto.getP_intro() %></p></td>
  	</tr>
  	</table>
  </div>
  
  <!-- 이용/시설안내 -->
  <div id="tabs-2" class="tab_content">
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
  
  <!-- 주의/이용/취소안내 -->
  <div id="tabs-3" class="tab_content">
	<div style="font-weight:bold; color:Black; margin:0px 0px 5px 0px;">이용시유의사항</div>
		<div>
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
		<table>
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
		
		<tr>
			<td>기본 취소 수수료</td>
			<td>10%</td>
			<td>90% 환불</td>
		</tr>
		</table>
		<br>
		</div>
		<br>
		
	<div style="font-weight:bold; color:Black; margin:0px 0px 5px 0px;">무통장 입금안내</div>
		<div>
			<p>입금계좌 : 국민 448601-01-509071 피크소프트(떠나요닷컴)<br>
			<span style="color: rgb(255, 108, 0);">예약시 입력하신 휴대폰으로 입금계좌가 전송됩니다.</span><br>
			예약신청 하신뒤 정해진 시간내에 입금 하시면 예약이 완료 됩니다.<br>
			<span style="color: rgb(255, 108, 0);">입금확인이 되면. 예약완료정보(업소연락처,예약번호등)가 핸드폰으로 전송</span>됩니다.<br>
			무통장입금시 반드시 예약자명으로 입금하셔야합니다. 입금확인이 되지 않을 수 있습니다.</p>
		</div>
		<p class="b">현지 사정상 입금시간이 지체되면 예약이 중복 될 수 있어 빠른 입금을 부탁 드립니다.<br>
		현지 사정상 중복이 발생한 경우 먼저 입금한 사람에게 우선권이 주어지게 됩니다.<br>
		아래 시간내 예약자명으로 입금이 완료되지 않는 경우 다음 예약자를 위해 자동 취소 됩니다.<br></p>
		<table>
			<tr>
				<th>예약 신청 시간</th>
				<th>입금 완료 시간</th>
			</tr>
			<tr>
				<td>당일 새벽 0시 부터 오전 8시 이전</td>
				<td>오전 10시 이전까지 입금</td>
			</tr>
			<tr>
				<td>
					오전 8시 부터 낮 12시 이전
				</td>
				<td>
					오후 2시 이전까지 입금
				</td>
			</tr>
			<tr>
				<td>
					오후 12시 부터 오후 4시 이전
				</td>
				<td>
					오후 6시 이전까지 입금
				</td>
			</tr>
			<tr>
				<td>
					오후 4시 부터 밤 8시 이전
				</td>
				<td>
					오후 9시 이전까지 입금
				</td>
			</tr>
			<tr>
				<td>
					오후 8시 부터 밤 12시 이전
				</td>
				<td>
					다음날 오전 10시 이전까지 입금
				</td>
			</tr>
		</table>
		<br>
	  </div>
	  <div id="tabs-4" class="tab_content">
	  	<table>
	  	<tr>
	  		<td><p><%=dto.getP_contect() %></p></td>
	  	</tr>
	  	</table>
	  </div>
</div>
			<tr>
				<td width="1000px" height="40px"></td>
			</tr>
		</td>
	</tr>
</table>
<script>
nullDestroy();
</script>