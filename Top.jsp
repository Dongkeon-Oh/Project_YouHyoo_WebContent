<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
        
<%
String u_id=(String)session.getAttribute("u_id");
%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="calendar.js"></script>
<script>
  jQuery(function($){
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

	  $('#datepicker').datepicker({
	      showOn: "button",
	      buttonImage: "imgs/top/cal.png",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	    });
	 });
</script>
  
<div id="top_function">
	<a href="http://www.google.com">일대일 상담</a>
	<%
	if(u_id==null){
		%>
		| <a href="Login.jsp">로그인</a>
		<%
	}else{
		%>
		| <a href="Log_Out.jsp">로그아웃</a>
		<%
	}
	%>
	<%
	if(u_id==null){
		%>
		| <a href="Join.jsp">주민등록 없이 회원가입</a>
		<%
	}else{
		%>
		| <a href="MyPage.jsp">MyPage</a>
		<%
	}
	%>
	| <a href="http://www.google.com">업소 관리</a>
</div>
<center>
	<table>
		<tr>
			<td>
				<a href="Index.jsp"><img src="imgs/top/youhyoo.PNG" id="titleImg"></a>
			</td>
		</tr>
		<tr>
			<td id="top_search">
				<a href="S_Location.jsp">지역별 펜션</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="http://www.google.com">단체/워크샵</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="http://www.google.com">잔여객실 즉시할인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="S_OneShot.jsp">맞춤으로 한방에 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="S_OnMap.jsp">지도에서 한눈에 검색</a>
			</td>
		</tr>
		<tr>
			<td id="top_option">
				<form name="" id="top_form">
					<font size="2">실시간 빈방 검색</font>
					<input type="text" name="datepicker" id="datepicker" size="15">
					<select name="quickTerm" id="quickTerm" size="1"> 
				        <option value="1박 2일">1박 2일</option> 
				        <option value="2박 3일">2박 3일</option> 
				        <option value="3박 4일">3박 4일</option> 
				        <option value="4박 5일">4박 5일</option> 
				        <option value="5박 6일">5박 6일</option> 
				        <option value="6박 7일">6박 7일</option>
				    </select>
					<input type="text" name="quickMember" id="quickMember" size="2"><font size="2">명</font>
					<img src="imgs/top/search.PNG">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<font size="2">통합 검색</font>
					<input type="text" name="totalSearch" id="totalSearch" size="15">
					<img src="imgs/top/search.PNG">
				</form>
			</td>
		</tr>
	</table>
</center>
	