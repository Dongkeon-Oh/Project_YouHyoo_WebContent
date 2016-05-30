<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<html>
<head>
<title>잔여객실 즉시 확인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="TopBottom.css" type="text/css" rel="stylesheet">
<link href="S_Discount.css" type="text/css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="Dcalendar.js"></script>

<script>

$(document).ready(function(){
	calendar();
	today();
	
	var location="경기";
	$("#setLo").text(location).css("display","none");
	
	var kYear=$("#sYear").text();
	var kMonth=$("#sMonth").text();
	var kDate=$("#sDate").text();
	var o_date=kYear+"-"+kMonth+"-"+kDate;
	$.ajax({
		type : 'POST',
		url : 'S_Discount_rs.jsp',
		data : "location="+location+"&o_date="+o_date,
		dataType : 'html',
		success : function(data){//콜백 성공 응답시 실행
			$("#result").html(data);	
		}
	});

	$(".location").click(function(){
		var location=$(this).text()
		$("#setLo").text(location);
		var kYear=$("#sYear").text();
		var kMonth=$("#sMonth").text();
		var kDate=$("#sDate").text();
		var o_date=kYear+"-"+kMonth+"-"+kDate;
		//alert("location : "+location+" o_date : "+o_date);
		$(".location").css("background-color","#fffff");
		$(this).css("background-color","#E08888");		
		
		$.ajax({
			type : 'POST',
			url : 'S_Discount_rs.jsp',
			data : "location="+location+"&o_date="+o_date,
			dataType : 'html',
			success : function(data){//콜백 성공 응답시 실행
				$("#result").html(data);	
			}
		});
	});
});

</script>
</head>
<%@ include file="Top.jsp" %>

<body>
<div id="s_discount">
<div class="mbug">
1. 펜션주에겐 취소된예약 및 미예약 잔여객실 빠르게 채우기 위해
<br />
2. 미리 예약하지 못한 예약자에게 저렴한 예약 기회를 제공하고자 만들어진 서비스 입니다.
<br />
할인정보는 숙박업주에 의해 실시간으로 등록됩니다.
<br />
또한 소셜커머스 진행중인 펜션을 포함해 각종 펜션할인정보를 한눈에 확인 할수 있어 편리 합니다.
<br />
숙박하실 날자를 클릭하시면 해당일에 예약 가능한 객실을 확인할 수 있습니다.
<br />
상세한 문의는 유휴~! 고객센터 <b>02-813-0960</b> 으로 문의하세요.
</div>
<hr>

<table width="100%">
<tr>
	<td>
	<div id="cal"></div>
	</td>
	<td>
	<!-- 날짜 부분 -->
	<div id="selDate">
	<span id="sYear"></span>년
	<span id="sMonth"></span>월
	<span id="sDate"></span>일
	<span id="sYoil"></span>
	</div>
	</td>
</tr>
</table>
<hr>
<div id="dLocation">
<a href="#"><span class="location" id="sel">경기도</span></a>
<a href="#"><span class="location">충청도</span></a>
<a href="#"><span class="location">경상도</span></a>
<a href="#"><span class="location">전라도</span></a>
<a href="#"><span class="location">제주도</span></a>
<a href="#"><span class="location">가평</span></a>
<a href="#"><span class="location">양평</span></a>
<a href="#"><span class="location">강화</span></a>
<a href="#"><span class="location">춘천</span></a>
<a href="#"><span class="location">태안</span></a>
<a href="#"><span class="location">평창</span></a>
<a href="#"><span class="location">포천</span></a>
<a href="#"><span class="location">남양주</span></a>
<a href="#"><span class="location">강릉</span></a>
<a href="#"><span class="location">경주</span></a>
<a href="#"><span class="location">여수</span></a>
<a href="#"><span class="location">용인</span></a>
</div>
<hr>
<!-- 검색결과 -->
<div id="result">
		
</div>
</div>
<span id="setLo"></span>
<%@ include file="Bottom.html" %>
</body>
</html>