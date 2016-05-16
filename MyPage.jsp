<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
String u_id=(String)session.getAttribute("u_id");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="Index.css" type="text/css" rel="stylesheet">
<style type="text/css">
#member{
	width: 1000px;
	margin: 0 auto;
}
A:link{
	color: blue;
}
div{
	
}

</style>
</head>
<body>
<%@ include file="Top.jsp" %>
<div id="member">
	<div class="dtitle">회원정보</div>
	<table width="100%">
		<colgroup>
			<col width="50%" />
			<col width="2%" />
			<col width="50%" />
		</colgroup>
		<tr>
			<td>
				<table class="write_form" cellspacing="1" cellpadding="0">
					<colgroup>
						<col width="120" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>
							아이디
						</th>
						<td>
							<span id="ctt_ctt_id_login">zzang813</span>
						</td>
					</tr>
					<tr>
						<th>
							이름
						</th>
						<td>
							<span id="ctt_ctt_nm_user">김대진</span>
						</td>
						</td>
					</tr>
					<tr>
						<th>
							Email
						</th>
						<td>
							<span id="ctt_ctt_email">zzangjojo@naver.com</span>
						</td>
					</tr>
					<tr>
						<th>
							핸드폰
						</th>
						<td>
							<span id="ctt_ctt_htel">010-4899-5598</span>
						</td>
					</tr>
				</table>
				<div class="btnArea">
					<a href="UpdateInfo.aspx" class="btn"><span>회원정보수정</span></a>
				</div>
			</td>
			<td>
			
			</td>
			<td valign="top">
				<div style="border:solid 10px #eeeeee; height:125px; padding-left:10px;">
					<div style="font-size:14px; color:orange; margin:10px 0px 0px 0px; font-weight:bold;">
						나의 현재 적립금
					</div>
					<div style="margin:0px 20px 0px 0px; font-size:18px; font-weight:bold; text-align:right;">
						<span id="ctt_ctt_lblPoint">0</span> 원
					</div>
					<div class="help" style="margin-top:10px;">적립금은 사이트내에서 현금처럼 사용이 가능합니다.</div>
					<div class="help"">적립금은 3년간 유효합니다.</div>
					<div class="help">적립금은 숙박이용일이 지나면 자동 적립됩니다.</div>
					<div class="help">그밖에 각종이벤트에 의해 적립금이 산정됩니다.</div>
				</div>
				<div class="btnArea">
					<a href="UserPoint.aspx" class="btn"><span>적립금 내역보기</span></a>
				</div>
			</td>
		</tr>
	</table>
	
	<div class="dtitle">최근 나의예약내역</div>
	<div class="help">예약번호를 클릭하시면 보다 상세한 예약정보를 확인 할 수 있습니다.</div>
	<div class="help">비회원 예약건은 조회가 안될수 있습니다. 고객센터로 연락주시면 조회 가능하도록 처리 해드립니다.</div>
	
	<div id="ctt_ctt_upp">
	
			<div style="margin:10px 0px 10px 0px; text-align:right;">
				예약일 
				<span style="display:inline-block;">
				<input name="" type="text" value="2016-05-01" maxlength="10" size="10" id="" onkeyup="javascript:(this);" /> <img src='' align='absmiddle' style='cursor:pointer;' onClick="calendar(event, 'ctt_ctt_dt_rsv_s')"></span>
				 부터 <span style="display:inline-block;"><input name="" type="text" value="2016-05-16" maxlength="10" size="10" id="" onkeyup="" /> <img src="" align='absmiddle' style='cursor:pointer;' onClick="calendar(event, 'ctt_ctt_dt_rsv_e')"></span> 까지
				<a onclick="" id="" class="" href="UserPoint.aspx">
				<span>예약내역 확인</span></a>
			</div>	
			<div id="ctt_ctt_list1"><!-- 여기에 예매내역이 들어온다!! -->
	<div class='emptyMsg'>최근 예매 내역이 존재하지 않습니다.</div>
	</div>
	
	<div class="dtitle">
		일대일상담내역</div>
	<div id="ctt_ctt_list2"><!-- 여기에 일대일상담내역이 들어온다!! -->
<div class='emptyMsg'>문의 내역이 존재하지 않습니다.</div>
</div>

	<div class="btnArea">
		<a href="MtmQaWrite.aspx" class="btn"><span>일대일문의하기</span></a>
	</div>
	
	<div class="dtitle">
		찜리스트</div>
	<div id="ctt_ctt_upp2">
	
			<div id="ctt_ctt_listJJim"><!-- 여기에 찜내역이 들어온다!! -->
	<div class='emptyMsg'>찜 내역이 존재하지 않습니다.</div>
	</div>			

</div>
<%@ include file="Bottom.html" %>
</body>
</html>