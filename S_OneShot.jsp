<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="youhyoo.*" import="java.util.*"%>

<%response.setCharacterEncoding("utf-8"); %>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="moment.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="TopBottom.css" type="text/css" rel="stylesheet">
<style type="text/css">
.tableshot {
	width: 1000px;
	margin: auto;
	text-align: center;
	border-collapse: collapse;
	border-color: #BDBDBD;
	border-width: 0;
	color: #5D5D5D;
}

.tableshot td {
	padding: 10px;
}

.tableshot th {
	background-color: #EAEAEA;
}

#bu {
	width: 80px;
	height: 40px;
}

#linkshot {
	color: blue;
}

.imgshot {
	width: 150;
}
</style>

<script type="text/javascript">
 
 //날짜 한글처리
 $(function() {
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
			  
 	 //변수
 	 tempArea=""; //선택 된 라디오버튼 값 담을변수
 	 subSql=""; //서브쿼리
 	 //sql=" and "; //넘겨줄 최종 쿼리
 	 sql=""; //넘겨줄 최종 쿼리
  
	 //내일날짜 셋팅하기
	 //tomorrow = moment() .format("YYYY-MM-DD");
	 tomorrow = moment().add(1,'days').format("YYYY-MM-DD");
	 
	 $('#datepicker').attr('value',tomorrow);
	 
	 
	 //옵션 체크
      $("#bu").click(function() {
    	 tempArea=$("input:radio[name='Area']:checked").val();
    	        if(tempArea=="allArea"){
    	        	subSql="select p_num from pension"
    	        }else{
    	        	subSql="select p_num from pension where p_addr2="+"'"+tempArea+"'";
    	        }//if
    	  
    	//check->DB 값이 0 or 1
        $("input[name='check']:checked").each(function(){
    	var checkboxValues=$(this).val()
    			                  
    	sql=sql+checkboxValues+"=1 and ";
    		});
    	//check2 -> DB 값이 varchar
        $("input[name='check2']:checked").each(function(){
        	var checkboxValues=$(this).val();
        	sql=sql+checkboxValues+" is not null and ";
        		});  

        sql=sql+"ra_pnum=any("+subSql+"))";
 
        $("#msql").attr("value",sql);
        $("input[name='check']:checked").attr("checked","");
        
        
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
	<%@ include file="Top.jsp"%>
	<p>
	<form name="searchForm" method="get">
		<table border="1" class="tableshot">
			<tr>
				<th rowspan="4">업소</th>
				<th width=100>인기지역</th>
				<td><input type="radio" name="Area" value="allArea" checked="">전지역
					<input type="radio" name="Area" value="가평군">가평
					<input type="radio" name="Area" value="양평군">양평 
					<input type="radio"	name="Area" value="강화군">강화 
					<input type="radio" name="Area"	value="춘천시">춘천 
					<input type="radio" name="Area" value="태안군">태안
					<input type="radio" name="Area" value="평창군">평창 
					<input type="radio" name="Area" value="포천시">포천 
					<input type="radio"	name="Area" value="남양주시">남양주<br> 
					<input type="radio"	name="Area" value="강릉시">강릉 
					<input type="radio" name="Area"	value="경주시">경주 
					<input type="radio" name="Area" value="여수시">여수
					<input type="radio" name="Area" value="용인시">용인 
					<input type="radio" name="Area" value="안산시">대부도 
					<input type="radio" name="Area" value="부안군">변산</td>
			</tr>
			<tr>
				<th>주변여행지</th>
				<td><input type="checkbox" name="check" value="ra_sea">바다
					<input type="checkbox" name="check" value="ra_valley">계곡 
					<input type="checkbox" name="check" value="ra_river">강/호수 
					<input type="checkbox" name="check" value="ra_mountain">산 
					<input type="checkbox" name="check" value="ra_island">섬</td>
			</tr>
			<tr>
				<th>편의제공</th>
				<td><input type="checkbox" name="check2" value="rs_market">매점
					<input type="checkbox" name="check2" value="rs_meal">식사가능 
					<input type="checkbox" name="check2" value="rs_pet">애완견동반가능 
					<input type="checkbox" name="check2" value="rs_party">파티/이벤트제공 
					<input type="checkbox" name="check2" value="rs_board">보드게임 
					<input type="checkbox" name="check2" value="rs_pickup">픽업가능<br>
					<input type="checkbox" name="check2" value="rs_inet">인터넷 
					<input type="checkbox" name="check2" value="rs_movie">영화관람 
					<input type="checkbox" name="check2" value="rs_cafe">카페 
					<input type="checkbox" name="check2" value="rs_shuttle">셔틀버스</td>
			</tr>
			<tr>
				<th>부대시설</th>
				<td><input type="checkbox" name="check2" value="rf_pool">수영장
					<input type="checkbox" name="check2" value="rf_slide">워터슬라이드
					<input type="checkbox" name="check2" value="rf_soccer">간이축구장
					<input type="checkbox" name="check2" value="rf_jokgoo">족구장
					<input type="checkbox" name="check2" value="rf_bbq">바베큐장 
					<input type="checkbox" name="check2" value="rf_campfire">캠프화이어<br>
					<input type="checkbox" name="check2" value="rf_karaoke">노래방
					<input type="checkbox" name="check2" value="rf_basketball">농구장
					<input type="checkbox" name="check2" value="rf_seminar">세미나실
					<input type="checkbox" name="check2" value="rf_bike">자전거 
					<input type="checkbox" name="check2" value="rf_4wbike">4륜오토바이 
					<input type="checkbox" name="check2" value="rf_servival">서바이벌게임</td>
			</tr>
			<tr>
				<th colspan=2>객실기준</th>
				<td><input type="checkbox" name="check2" value="rr_2floor">복층
					<input type="checkbox" name="check2" value="rr_single">독채 
					<input type="checkbox" name="check2" value="rr_spa">스파시설보유 
					<input type="checkbox" name="check2" value="rr_terrace">테라스바베큐가능</td>
			</tr>
			<tr>
				<th colspan=2 height="40px">이용기준</th>
				<th>이용일 <input type="text" name="quickDate" class="datepicker" id="datepicker" value="">부터 
				<select name="quickTerm" id="quickTerm">
						<option class="quickTerm" value="1">1박 2일</option>
						<option class="quickTerm" value="2">2박 3일</option>
						<option class="quickTerm" value="3">3박 4일</option>
						<option class="quickTerm" value="4">4박 5일</option>
						<option class="quickTerm" value="5">5박 6일</option>
						<option class="quickTerm" value="6">6박 7일</option>
				</select> &nbsp; 
				
				<input type="text" name="quickMember" id="quickMember" size="2">명
				</th>
			</tr>
		</table>
		<p>
		<table class="tableshot">
			<tr>
				<th align=center style="background-color: white;">
				<input type="button" value=검색하기 name=bu id=bu> 
				<input type="hidden" name="msql" id="msql"></th>
			</tr>
		</table>
		<p>
	</form>
	<%
  String sql=request.getParameter("msql");
  if(sql!=null){
	  %>

	<table border=1 style="text-align: left;" class="tableshot">
		<tr style="text-align: center;">
			<th colspan="2">업소</th>
			<th>빈객실</th>
			<th>구조</th>
			<th>인원</th>
			<th>추가금액</th>
			<th>요금</th>
		</tr>

		<%
  One_shotDao you=new One_shotDao();
  String ordsql="";
  List p_list=you.get_P_List(sql);
  
  
  if(request.getParameter("quickTerm").equals("1")){
	 System.out.println(sql);
	 ordsql="select o_num from order_room where o_date='2016-05-30')";
	 
  }//
	 if(p_list.size()>0){
 		for(int i=0;i<p_list.size();i++){
	
			  Pension_Dto p_dto=new Pension_Dto();
  			  p_dto=(Pension_Dto)p_list.get(i);
  
  			  List r_list=you.get_R_List(p_dto.getP_num());
  			 int r_size=r_list.size();
  
 	%>
		<tr>
			<td rowspan="<%=r_size+1%>" style="border-right: 0;">
				<%
  			String p_num=p_dto.getP_num()+"";
  			String p_num2;
  			
  			if(Integer.parseInt(p_num)/100>0){
	  			p_num2="P"+p_num;
 			 }else if(Integer.parseInt(p_num)/10>0){
				  p_num2="P0"+p_num;
 			 }else{
				  p_num2="P00"+p_num;
 			 }//if
  %> 
 			 <a href="DetailView.jsp?p_num=<%=p_num%>">
  			 <img src="imgs/pension/<%=p_num%>/<%=p_num2%>_F01.jpg" class="imgshot"></a>
			</td>
			<td rowspan="<%=r_size+1%>" style="border-left: 0;">
			<label><b><%=p_dto.getP_name()%></b><br>
			<%=p_dto.getP_addr1()%> <%=p_dto.getP_addr2()%><br> 
			<a onclick="open('DetailView.jsp?p_num=<%=p_num%>','preview','width=1050,height=800,scrollbars=yes')" id="linkshot">미리보기</a> </label>
			</td>
		</tr>
		<%
  		for(int j=0;j<r_size;j++){
			    Room_Dto r_dto=new Room_Dto();
	  			r_dto=(Room_Dto)r_list.get(j);
	%>
		<tr>
			<td>
			<%=r_dto.getR_name()%> 
			<a onclick="open('DetailView.jsp?p_num=<%=p_num%>','ord','width=1050,height=800,scrollbars=yes')">
				<input type="button" name="ord" value="예약"></a> 
			<a	onclick="open('DetailPhoto.jsp?p_num=<%=p_num%>','view','width=1050,height=800,scrollbars=yes')">
				<img alt="미리보기" src="imgs/search/view.jpg"></a>
			</td>
			<td>
			<%=r_dto.getR_size()%>평(<%=String.format("%.0f",3.3*r_dto.getR_size())%>㎡)
			</td>
			<td>
			기준<%=r_dto.getR_mincapa()%>명<br> 최대<%=r_dto.getR_maxcapa()%>명
			</td>
			<td>
			<%=r_dto.getR_mincapa()%>초과시<br> 인당10,000</td>
			<td>
				<!-- ★요금 수정해야됨(성수기,비수기 등)★ --> <%=r_dto.getR_max_wd()%>
			</td>
		</tr>

		<%
  }//for
  %>
		<%
	  }//for
	 }else{ //검색리스트 결과가 없으면
		  %>
		<tr>
			<td colspan="7"><font color="blue"><b>검색결과가 없습니다.</b></font></td>
		</tr>
	</table>
	<%
	  }//else
	  %>
	</table>
	<%
	  }//if
	 %>
</body>
<%@ include file="Bottom.html"%>
</html>