<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");

String location=request.getParameter("location");
if(location==null){
	location="index";
}

IndexMgr indexMgr=IndexMgr.getInstance();
List<Pension_Dto> pensionList=indexMgr.getIndexPensionList(location);

int pensionNumber[]=new int[pensionList.size()];
for(int i=0; i<pensionList.size(); i++){
	pensionNumber[i]=pensionList.get(i).getP_num();
}

List<Room_Dto> roomList=indexMgr.getIndexRoomList(pensionNumber);
%>   

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="TopBottom.css" type="text/css" rel="stylesheet">
	  	<link href="S_Location.css" type="text/css" rel="stylesheet">
		<script>
			
			function jjimSet(thisForm,pensionNumber){
				if('<%=(String)session.getAttribute("u_id")%>'=='null'){
					alert("로그인이 필요한 메뉴입니다.\n로그인 페이지로 이동합니다.");
					location.href="Login.jsp";
				}else{
					thisForm.pension.value=pensionNumber;
					thisForm.submit();
				}
			}

			function locationDetail(loc){
				$("input[type=hidden]").attr("value",loc);
				locationChoice.submit();
			}
		</script>
	</head>
	<body>
		<%@ include file="Top.jsp" %>
		<table id="S_LocMainFrame">
			<tr>
				<td id="S_LocPadding">
					<div id="S_LocMenu">
						<form method="post" name="locationChoice" id="locationChoice" action="S_Location.jsp">
							<img src="imgs/S_Location/good.jpg" class="S_LocImg">
							<a href="#" OnClick="locationDetail('index')"><font size="4" color="#3F48CC">전체 지역</font></a><br><br>
							
							<img src="imgs/S_Location/good.jpg" class="S_LocImg">
							<font size="4" color="#3F48CC">인기 지역</font><br>
							<a href="#" OnClick="locationDetail('hot가평')"><font size="3">가평</font></a><br>
							<a href="#" OnClick="locationDetail('hot양평')"><font size="3">양평</font></a><br>
							<a href="#" OnClick="locationDetail('hot강화')"><font size="3">인천 강화도</font></a><br>
							<a href="#" OnClick="locationDetail('hot춘천')"><font size="3">춘천/강촌/홍천</font></a><br>
							<a href="#" OnClick="locationDetail('hot태안')"><font size="3">태안/안면도</font></a><br>
							<a href="#" OnClick="locationDetail('hot평창')"><font size="3">평창/횡성</font></a><br>
							<a href="#" OnClick="locationDetail('hot포천')"><font size="3">포천</font></a><br>
							<a href="#" OnClick="locationDetail('hot남양주')"><font size="3">남양주</font></a><br>
							<a href="#" OnClick="locationDetail('hot속초')"><font size="3">속초/설악산</font></a><br>
							<a href="#" OnClick="locationDetail('hot경주')"><font size="3">경주/속초/강릉</font></a><br>
							<a href="#" OnClick="locationDetail('hot거제')"><font size="3">거제/여수</font></a><br>
							<a href="#" OnClick="locationDetail('hot용인')"><font size="3">용인/안성</font></a><br>
							
							<br><br>
							<img src="imgs/S_Location/good.jpg" class="S_LocImg">
							<font size="4" color="#3F48CC">전체 지역</font><br>
							<a href="#" OnClick="locationDetail('경기도')"><font size="3">경기도</font></a><br>
							<a href="#" OnClick="locationDetail('강원도')"><font size="3">강원도</font></a><br>
							<a href="#" OnClick="locationDetail('충청도')"><font size="3">충청도</font></a><br>
							<a href="#" OnClick="locationDetail('경상도')"><font size="3">경상도</font></a><br>
							<a href="#" OnClick="locationDetail('전라도')"><font size="3">전라도</font></a><br>
							<a href="#" OnClick="locationDetail('제주도')"><font size="3">제주도</font></a><br>
			
							<input type="hidden" name="location">
						</form>
					</div>
					</td>
					<td>
					<table id="S_LocmainTab">
						<tr>
						<%
							int cnt=12;
							if(pensionList.size()==0){
							%>
									<td><img src="imgs/S_Location/search_fail.jpg"></td>
							<%
							}else{
								if(cnt>pensionList.size()){
									cnt=pensionList.size();
								}
								for(int i=0; i<cnt; i++){
									if(i%3==0){
										out.println("</tr><tr>");
									}
									Pension_Dto pension=(Pension_Dto)pensionList.get(i);
									Room_Dto room=(Room_Dto)roomList.get(i);
							%>
								<td>
									<table class="index_subTab">
										<tr>
											<td>
							<%
												StringTokenizer pensionPhoto = new StringTokenizer(pension.getP_photo(),"|");
												if(pensionPhoto.hasMoreTokens()){
							%>
												<a href="DetailView.jsp?p_num=<%=pension.getP_num() %>">
													<img src="imgs/pension/<%=pension.getP_num() %>/<%=pensionPhoto.nextToken()%>" class="S_Locthumbnail">
												</a>
											</td>
										</tr>
										<tr>
											<td class="S_Locindex_link">
												<a href="DetailView.jsp?p_num=<%=pension.getP_num() %>" id="index_pensionName">
													<font size="4"><%=pension.getP_name() %></font>
												</a>
												<font size="2" color="gray">(<%=pension.getP_addr1() %> <%=pension.getP_addr2() %>)</font>
											</td>
										</tr>
										<tr>
											<td class="S_Locindex_link">
												<font size="2">주중 </font>
												<font size="2" color="red"><%=room.getR_min_wd() %></font>~ / 
												<font size="2">주말 </font>
												<font size="2" color="red"><%=room.getR_min_we() %></font>~
											</td>
										</tr>
										<tr>
											<td>
												<form method="post" name="jjim" class="jjim" action="WishlistProc.jsp">
													<input type="button" id="index_Button" onclick="javascript:jjimSet(this.form,'<%=pension.getP_num() %>')">
													<input type="hidden" name="pension">
													&nbsp;
													<input type="button" id="index_Detail" onclick="location.href='DetailView.jsp?p_num=<%=pension.getP_num() %>'">
												</form>
											</td>
							<%
												}
							%>
										</tr>
									</table>
								</td>
							<%
								}
							}
						%>
						</tr>
					</table>
				</td>	
			</tr>	
		</table>
		<%@ include file="Bottom.html" %>
	</body>
</html>