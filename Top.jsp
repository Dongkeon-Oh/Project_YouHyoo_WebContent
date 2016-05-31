<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
        
<%
String u_id=(String)session.getAttribute("u_id");
%>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="moment.js"></script>
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

	  $('#datepicker_top').datepicker({
	      showOn: "button",
	      buttonImage: "imgs/top/cal.png",
	      
	      buttonImageOnly: true,
	      buttonText: "Select date"
	    });
	

	//변수 
	add_date=""; //날짜+숙박일 = 최종숙박일
	date_sql=""; //날짜 sql
	option_sql=""; //최종 전송 sql
	
	//기본값 - 오늘날짜
	 today = moment().format("YYYY-MM-DD");
	 $('#datepicker_top').attr('value',today);
  
	//날짜search 검색
     $("#button").click(function() {
	   sel_date=$("select[name=sel]").val();
	   
	  //선택한 날짜 구하기
	  switch (sel_date) {
		case "1": {
			date_sql="'"+ $('#datepicker_top').val()+"')";
			break;
		}
		case "2": {
			date_sql="'"+ $('#datepicke_topr').val()+"'or ";
			add_date=moment(moment($('#datepicker_top').val())).add(1,'days').format("YYYY-MM-DD");
			date_sql=date_sql+"'"+add_date+"')";			
  			break;
		}
		case "3": {
			date_sql="'"+$('#datepicker_top').val()+"'";
			for(var i=1;i<3;i++){
			add_date=moment($('#datepicker_top').val()).add(i,'days').format("YYYY-MM-DD");
			date_sql=date_sql+"or'"+add_date+"'";
			}
			date_sql=date_sql+")";
			break;
		}
		case "4": {
			date_sql="'"+$('#datepicker_top').val()+"'";
			for(var i=1;i<4;i++){
			add_date=moment($('#datepicker_top').val()).add(i,'days').format("YYYY-MM-DD");
			date_sql=date_sql+"or'"+add_date+"'";
			}
			date_sql=date_sql+")";
			break;
		}
		case "5": {
			date_sql="'"+$('#datepicker_top').val()+"'";
			for(var i=1;i<5;i++){
			add_date=moment($('#datepicker_top').val()).add(i,'days').format("YYYY-MM-DD");
			date_sql=date_sql+"or'"+add_date+"'";
			}
			date_sql=date_sql+")";
			break;

		}
		case "6": {
			date_sql="'"+$('#datepicker_top').val()+"'";
			for(var i=1;i<6;i++){
			add_date=moment($('#datepicker_top').val()).add(i,'days').format("YYYY-MM-DD");
			date_sql=date_sql+"or'"+add_date+"'";
			}
			date_sql=date_sql+")";
			break;
		}
		}//switch
		
	     $("#date_sql_top").attr("value",date_sql);
	     document.top_form.submit();
     	});	
     
     //통합검색search
     $("#button_sel").click(function() {
    	document.top_form2.submit();
    	 
     });
     });
</script>
  
<div id="top_function">
		<%
     		if(u_id==null){
        %>
   	   <a class="top_menu" href="Login.jsp">로그인</a>
   	   <font color="#FFFFFF"> | </font>
        <%
      		}else{
        %>
    <a class="top_menu" href="Log_Out.jsp">로그아웃</a>
    <font color="#FFFFFF"> | </font>
        <%
     		}
     	 	if(u_id==null){
        %>
    <a class="top_menu" href="Join.jsp">주민등록 없이 회원가입</a>
    <font color="#FFFFFF"> | </font>
        <%
 	    	}else{
		%>
    <a class="top_menu" href="MyPage.jsp">MyPage</a>
    <font color="#FFFFFF"> | </font>
		<%
	    	}
	    %>
	<a class="top_menu" href="Management.jsp">업소 관리</a>
	<font color="#FFFFFF"> | </font>
	<a class="top_menu" href="Q_Youhyoo.jsp?state=top">일대일 상담</a>
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
				<a class="top_menu" href="S_Location.jsp">지역별 펜션</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="top_menu" href="S_Discount.jsp">잔여객실 즉시할인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="top_menu" href="S_OneShot.jsp">맞춤으로 한방에 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="top_menu" href="S_OnMap.jsp">지도에서 한눈에 검색</a>
			</td>
		</tr>
		<tr>
			<td id="top_option">
			<div class="top_form_div" style="float: left;">
				<form name="top_form" id="top_form" method=post action="S_OneShot.jsp">
					<font size="2">실시간 빈방 검색</font>
					<input type="text" name="datepicker_top" class="datepicker" id="datepicker_top" size="13">&nbsp;
					<select name="sel" id="sel" size="1"> 
				        <option value="1">1박 2일</option> 
				        <option value="2">2박 3일</option> 
				        <option value="3">3박 4일</option> 
				        <option value="4">4박 5일</option> 
				        <option value="5">5박 6일</option> 
				        <option value="6">6박 7일</option>
				    </select>
					<input type="text" name="member_top" id="member_top" size="1" value=2><font size="2">명</font>
					<button id="button" class="top_button">
						<img src="imgs/top/search.PNG" width=60>
					</button>
					<input type="hidden" name="state" id="state" value=top>
				    <input type="hidden" name="date_sql_top" id="date_sql_top">
				</form>
			</div>
					
			<div class="top_form_div" style="float:right;">
				<form name="top_form2" id="top_form2" method=post action="Top_Searchproc.jsp" >
					<font size="2">통합 검색</font>
					<input type="text" name="totalSearch" id="totalSearch" size="13">
					<button name="button_sel" id="button_sel" class="top_button">
						<img src="imgs/top/search.PNG" width=60>
					</button>
				</form>
			</div>
			</td>
		</tr>
	</table>
</center>
	