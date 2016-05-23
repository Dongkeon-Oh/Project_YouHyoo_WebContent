<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="TopBottom.css" type="text/css" rel="stylesheet">
<style type="text/css">
body {width: 1000px; margin: 0 auto;}
     td.today {color: #ffffff;   font-weight:bold; border:solid thin 0pt; font-size:9pt; background-color: #cc0033; }  
     td.workday {color: #000099;    font-weight:normal; border:solid thin 0.5pt; font-size:9pt; }  
     td.sunday{color: #cc0033; font-weight:normal; border:solid thin 0.5pt; font-size:9pt; }  
     td.satday{color: #0000ff;    font-weight:normal; border:solid thin 0.5pt; font-size:9pt; }  
     td.week  {color: #000000;   font-weight:normal; border:solid thin 0.5pt; font-size:9pt; background-color:#e6e6e6;width: 18px;text-align:center}  
  
    .preNext {color: #000099;text-decoration: none;} 
</style>

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="Dcalendar.js"></script>
<script>

$(document).ready(function(){
	
	calendar();
	
});

</script>
</head>
<%@ include file="Top.jsp" %>

<body>

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

<table width="90%">
<tr>
	<td>
	<div id="cal"></div>
	</td>
	<td>
	<div id="selDate">2016년 5월 23일(월)</div>
	</td>
</tr>
</table>
<hr>
<div>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">경기도</font></a>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">강원도</font></a>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">충청도</font></a>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">경상도</font></a>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">전라도</font></a>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">제주도</font></a><br>
<a href="#" OnClick="locationDetail('hot가평')"><font size="3">가평</font></a>
<a href="#" OnClick="locationDetail('hot양평')"><font size="3">양평</font></a>
<a href="#" OnClick="locationDetail('hot강화')"><font size="3">인천 강화도</font></a>
<a href="#" OnClick="locationDetail('hot춘천')"><font size="3">춘천/강촌/홍천</font></a>
<a href="#" OnClick="locationDetail('hot태안')"><font size="3">태안/안면도</font></a><br>
<a href="#" OnClick="locationDetail('hot평창')"><font size="3">평창/횡성</font></a>
<a href="#" OnClick="locationDetail('hot포천')"><font size="3">포천</font></a>
<a href="#" OnClick="locationDetail('hot남양주')"><font size="3">남양주</font></a>
<a href="#" OnClick="locationDetail('hot속초')"><font size="3">속초/설악산</font></a><br>
<a href="#" OnClick="locationDetail('hot경주')"><font size="3">경주/속초/강릉</font></a>
<a href="#" OnClick="locationDetail('hot거제')"><font size="3">거제/여수</font></a>
<a href="#" OnClick="locationDetail('hot용인')"><font size="3">용인/안성</font></a><br>
</div>
<hr>

<%@ include file="Bottom.html" %>
</body>
</html>