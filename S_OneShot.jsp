<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
 <head>
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript">
 tempArea="";
  subSql="";
  where="where";
 $(function() {
     $("input:radio[name='Area']").click(function() {
        tempArea=$(this).val();
        if(tempArea=="allArea"){
        	subSql="select p_num from pension";
        	 alert(subSql);
        }else{
        	subSql="select p_num from pension where p_addr2="+tempArea;
        	 alert(subSql);
        }//if
     });
    // var temp = new Array();
    var checkboxValues = [];
    $("input[name='check']:checked").each(function(i) {
        checkboxValues.push($(this).val());
        alert(checkboxValues);
    });
     
    	 //$("input:checkbox[name='check']").click(function() {
    	      //  var temp=$(this).val();
    	     //   alert(temp);
    	// });
 });
 </script>
 </head>
 <body>

  <form name="searchForm" method="get">
   <table border="1">
   <tr>
    <td rowspan="4">업소</td>
    <td>인기지역</td>
    <td>
    <input type="radio" name="Area" value="allArea">전지역
     <input type="radio" name="Area" value="가평군">가평
     <input type="radio" name="Area" value="양평군">양평
     <input type="radio" name="Area" value="강화군">강화
     <input type="radio" name="Area" value="춘천시">춘천
     <input type="radio" name="Area" value="태안군">태안
     <input type="radio" name="Area" value="평창군">평창
     <input type="radio" name="Area" value="포천시">포천
     <input type="radio" name="Area" value="남양주시">남양주
     <input type="radio" name="Area" value="강릉시">강릉
     <input type="radio" name="Area" value="경주시">경주
     <input type="radio" name="Area" value="여수시">여수
     <input type="radio" name="Area" value="용인시">용인
     <input type="radio" name="Area" value="안산시">대부도
     <input type="radio" name="Area" value="부안군">변산
    </td>
    </tr>
    <tr>
     <td>주변여행지</td>
     <td>
     <input type="checkbox" name="check" value="ra_sea">바다
     <input type="checkbox" name="check" value="ra_valley">바다
     <input type="checkbox" name="check" value="ra_river">바다
     <input type="checkbox" name="check" value="ra_mountain">산
     <input type="checkbox" name="check" value="ra_island">섬
     </td>
    </tr>
    <tr>
     <td>편의제공</td>
     <td>
     <input type="checkbox" name="check" value="rs_market">매점
     <input type="checkbox" name="check" value="rs_meal">식사가능
     <input type="checkbox" name="check" value="rs_pet">애완견동반가능
     <input type="checkbox" name="check" value="rs_part">파티/이벤트제공
     <input type="checkbox" name="check" value="rs_board">보드게임
     <input type="checkbox" name="check" value="rs_pickup">픽업가능
     <input type="checkbox" name="check" value="rs_inet">인터넷
     <input type="checkbox" name="check" value="rs_movie">영화관람
     <input type="checkbox" name="check" value="rs_cafe">카페
     <input type="checkbox" name="check" value="rs_shuttle">셔틀버스
     </td>
    </tr>
    <tr>
     <td>부대시설</td>
     <td>
     <input type="checkbox" name="check" value="rf_pool">수영장
     <input type="checkbox" name="check" value="rf_slide">워터슬라이드
     <input type="checkbox" name="$check[]" value="rf_soccer">간이축구장
     <input type="checkbox" name="$check[]" value="rf_footb">족구장
     <input type="checkbox" name="$check[]" value="rf_bbq">바베큐장
     <input type="checkbox" name="$check[]" value="rf_campfire">캠프화이어
     <input type="checkbox" name="$check[]" value="rf_karaoke">노래방
     <input type="checkbox" name="$check[]" value="rf_basketb">농구장
     <input type="checkbox" name="$check[]" value="rf_seminar">세미나실
     <input type="checkbox" name="$check[]" value="rf_bike">자전거
     <input type="checkbox" name="$check[]" value="rf_4wbike">4륜오토바이
     <input type="checkbox" name="$check[]" value="rf_servival">서바이벌게임
     </td>
    </tr>
    <tr>
     <td colspan=2>객실기준</td>
     <td>
      <input type="checkbox" name="$check[]" value="rr_sndfloor">복층
      <input type="checkbox" name="$check[]" value="rr_single">독채
      <input type="checkbox" name="$check[]" value="rr_spa">스파시설보유
      <input type="checkbox" name="$check[]" value="rr_terrace">테라스바베큐가능
      <input type="checkbox" name="$check[]" value="rr_roomamt">풀빌라
     </td>
    </tr>
    <tr>
     <td colspan=2>이용기준</td>
     <td>
      이용일
      부터 명
     </td>
    </tr>
   </table>
   <table>
    <tr>
     <td>
      <input type=submit value=검색하기>
     </td>
    </tr>
   </table>
  </form>
 </body>
</html>