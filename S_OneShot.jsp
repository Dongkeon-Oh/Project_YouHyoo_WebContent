<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"%>
<%response.setCharacterEncoding("utf-8"); %>
<html>
 <head>
 <style type="text/css">
 div{
 text-align:center;
 width: 1000px;
 margin: auto;
 }
 table{
 width: 1000px;
 text-align:center;
 margin: auto;
 }
 </style>
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript">
 tempArea="";
  subSql="";
  where="where";
  sql="";
  
 $(function() {
     $("input:radio[name='Area']").click(function() {
        tempArea=$(this).val();
        if(tempArea=="allArea"){
        	subSql="select p_num from pension"
        }else{
        	subSql="select p_num from pension where p_addr2="+"'"+tempArea+"'";
        	
        }//if
     });
    
      $("#bu").click(function() {
    	  
        $("input[name='check']:checked").each(function(){
        
    	var checkboxValues=$(this).val();
    	sql=sql+checkboxValues+" is not null and ";
    		});
        sql="ra_pnum=any("+subSql+"))";
        $("#msql").attr("value",sql);
        alert(sql);
        document.searchForm.submit();
   	 	});
 });
/*
select p_num,p_name,p_addr1,p_addr2 from pension
where p_num=(select distinct ra_pnum from 
detail_Around inner join detail_Facility
on ra_pnum=rf_pnum inner join detail_Support
on ra_pnum=rs_pnum inner join detail_Structure
on ra_pnum=rr_pnum where ra_sea is not null
and ra_pnum=(select p_num from pension where p_addr2='가평군'))

 select p_num,p_name,p_addr1,p_addr2 from pension
 where p_num=any(select distinct ra_pnum from
 detail_Around inner join detail_Facility
 on ra_pnum=rf_pnum inner join detail_Support
 on ra_pnum=rs_pnum inner join detail_Structure
 on ra_pnum=rr_pnum where ra_sea is not null)
*/
 </script>
 </head>
 <body>
<div id="checkdiv">
  <form name="searchForm" method="get">
   <table border="1">
   <tr>
    <th rowspan="4">업소</th>
    <th width=100>인기지역</th>
    <td>
    <input type="radio" name="Area" value="allArea">전지역
     <input type="radio" name="Area" value="가평군">가평
     <input type="radio" name="Area" value="양평군">양평
     <input type="radio" name="Area" value="강화군">강화
     <input type="radio" name="Area" value="춘천시">춘천
     <input type="radio" name="Area" value="태안군">태안
     <input type="radio" name="Area" value="평창군">평창
     <input type="radio" name="Area" value="포천시">포천
     <input type="radio" name="Area" value="남양주시">남양주<br>
     <input type="radio" name="Area" value="강릉시">강릉
     <input type="radio" name="Area" value="경주시">경주
     <input type="radio" name="Area" value="여수시">여수
     <input type="radio" name="Area" value="용인시">용인
     <input type="radio" name="Area" value="안산시">대부도
     <input type="radio" name="Area" value="부안군">변산
    </td>
    </tr>
    <tr>
     <th>주변여행지</th>
     <td>
     <input type="checkbox" name="check" value="ra_sea">바다
     <input type="checkbox" name="check" value="ra_valley">계곡
     <input type="checkbox" name="check" value="ra_river">강/호수
     <input type="checkbox" name="check" value="ra_mountain">산
     <input type="checkbox" name="check" value="ra_island">섬
     </td>
    </tr>
    <tr>
     <th>편의제공</th>
     <td>
     <input type="checkbox" name="check" value="rs_market">매점
     <input type="checkbox" name="check" value="rs_meal">식사가능
     <input type="checkbox" name="check" value="rs_pet">애완견동반가능
     <input type="checkbox" name="check" value="rs_party">파티/이벤트제공
     <input type="checkbox" name="check" value="rs_board">보드게임
     <input type="checkbox" name="check" value="rs_pickup">픽업가능<br>
     <input type="checkbox" name="check" value="rs_inet">인터넷
     <input type="checkbox" name="check" value="rs_movie">영화관람
     <input type="checkbox" name="check" value="rs_cafe">카페
     <input type="checkbox" name="check" value="rs_shuttle">셔틀버스
     </td>
    </tr>
    <tr>
     <th>부대시설</th>
     <td>
     <input type="checkbox" name="check" value="rf_pool">수영장
     <input type="checkbox" name="check" value="rf_slide">워터슬라이드
     <input type="checkbox" name="check" value="rf_soccer">간이축구장
     <input type="checkbox" name="check" value="rf_jokgoo">족구장
     <input type="checkbox" name="check" value="rf_bbq">바베큐장
     <input type="checkbox" name="check" value="rf_campfire">캠프화이어<br>
     <input type="checkbox" name="check" value="rf_karaoke">노래방
     <input type="checkbox" name="check" value="rf_basketball">농구장
     <input type="checkbox" name="check" value="rf_seminar">세미나실
     <input type="checkbox" name="check" value="rf_bike">자전거
     <input type="checkbox" name="check" value="rf_4wbike">4륜오토바이
     <input type="checkbox" name="check" value="rf_servival">서바이벌게임
     </td>
    </tr>
    <tr>
     <th colspan=2>객실기준</th>
     <td>
      <input type="checkbox" name="check" value="rr_2floor">복층
      <input type="checkbox" name="check" value="rr_single">독채
      <input type="checkbox" name="check" value="rr_spa">스파시설보유
      <input type="checkbox" name="check" value="rr_terrace">테라스바베큐가능
     </td>
    </tr>
    <tr>
     <th colspan=2>이용기준</th>
     <th>
     이용일 <input type="text" name="quickDate" id="quickDate">
	  <img name="cal" id="cal"src="imgs/top/cal.png" width=20>부터
	   <select name="quickTerm" id="quickTerm" size="1"> 
	    <option value="1박 2일">1박 2일</option> 
	    <option value="2박 3일">2박 3일</option> 
		<option value="3박 4일">3박 4일</option> 
		<option value="4박 5일">4박 5일</option> 
		<option value="5박 6일">5박 6일</option> 
		<option value="6박 7일">6박 7일</option>
	   </select> &nbsp;
	  <input type="text" name="quickMember" id="quickMember" size="2">명
     </th>
    </tr>
   </table>
  <p>
   <table border=1>
    <tr>
     <th algin=center>
      <input type=button value=검색하기 name=bu id=bu>
      <input type="hidden" name="msql" id="msql">
     </th>
    </tr>
   </table>
   <p>
   </form>
  </div>

<%
  String sql=request.getParameter("msql");
  if(sql!=null){
	  %>
	  
	  <table border=1>
	  <tr>
	   <th>업소</th>
	   <th>빈객실</th>
	   <th>구조</th>
	   <th>인원</th>
	   <th>추가금액</th>
	   <th>요금</th>
	  </tr>

<%
  You you=new You();
    
  List p_num=you.get_P_List(sql);
	  
 for(int i=0;i<p_num.size();i++){
  Pension_Dto p_dto=new Pension_Dto();
  p_dto=(Pension_Dto)p_num.get(i);
  
  List r_list=you.get_R_List(p_dto.getP_num());
  int r_size=r_list.size();
 %>
  <tr>
   <td rowspan="<%=r_size+1%>">
   <label><b><%=p_dto.getP_name()%></b><br>
   <%=p_dto.getP_addr1()%> <%=p_dto.getP_addr2()%><br>
   <a href="">미리보기</a>
   </label>
   </td>
   </tr>
    <%
  for(int j=0;j<r_size;j++){
	  Room_Dto r_dto=new Room_Dto();
	  r_dto=(Room_Dto)r_list.get(j);
		  %>
	<tr>
	<td>
	<%=r_dto.getR_name()%> <input type="button" name="ord" value="예약">
	<img alt="미리보기" src="imgs/view.jpg">
	</td>
	<td>
	<%=r_dto.getR_size()%>평(66㎡)
	</td>
	<td>
	기준<%=r_dto.getR_mincapa()%>명<br>
	최대<%=r_dto.getR_maxcapa()%>명
	</td>
	<td>
	<%=r_dto.getR_mincapa()%>초과시<br>
	인당10,000
	</td>
	<td>
	<!-- ★요금 수정해야됨(성수기,비수기 등)★ -->
	<%=r_dto.getR_max_wd()%>
	</td>
	</tr>
		 
	<%
  }//for
  %>

  <% 
	  }//for
	  %>
	    </table>
	  <%
	  }//if %>

 </body>
</html>