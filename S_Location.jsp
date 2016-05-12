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

System.out.println(location);

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
		<link href="Index.css" type="text/css" rel="stylesheet">
		<script>
		function locationDetail(location) {
			document.locationChoice.location.value=location;
			document.locationChoice.submit();
		}
		</script>
	</head>
	<body>
		<%@ include file="Top.jsp" %>
		<div id="S_LocMainFrame">
			<div id="S_LocMenu">
				<form method="post" name="locationChoice" id="locationChoice" action="S_Location.jsp">
					<img src="imgs/S_Location/good.jpg" class="S_LocImg">
					<font size="4" color="#3F48CC">인기 지역</font><br>
					<font size="3" OnClick="locationDetail('hot가평')">가평</font><br>
					<font size="3" OnClick="locationDetail('hot양평')">양평</font><br>
					<font size="3" OnClick="locationDetail('hot강화')">인천 강화도</font><br>
					<font size="3" OnClick="locationDetail('hot춘천')">춘천/강촌/홍천</font><br>
					<font size="3" OnClick="locationDetail('hot태안')">태안/안면도</font><br>
					<font size="3" OnClick="locationDetail('hot평창')">평창/횡성</font><br>
					<font size="3" OnClick="locationDetail('hot포천')">포천</font><br>
					<font size="3" OnClick="locationDetail('hot남양주')">남양주</font><br>
					<font size="3" OnClick="locationDetail('hot속초')">속초/설악산</font><br>
					<font size="3" OnClick="locationDetail('hot경주')">경주/속초/강릉</font><br>
					<font size="3" OnClick="locationDetail('hot거제')">거제/여수</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">용인/안성</font><br>
					
					<br><br>
					<img src="imgs/S_Location/good.jpg" class="S_LocImg">
					<font size="4" color="#3F48CC">전체 지역</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">경기도</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">강원도</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">충청도</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">경상도</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">전라도</font><br>
					<font size="3" OnClick="locationDetail('hot용인')">제주도</font><br>
	
					<input type="hidden" name="location">
				</form>
			</div>
		<table id="S_LocmainTab">
			<tr>
			<%
				int cnt=12;
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
								StringTokenizer pensionPhoto = new StringTokenizer(pension.getPhoto(),"|");
								if(pensionPhoto.hasMoreTokens()){
			%>
								<a href="http://google.com">
									<img src="imgs/pension/<%=pension.getP_num() %>/<%=pensionPhoto.nextToken()%>" class="S_Locthumbnail">
								</a>
							</td>
						</tr>
						<tr>
							<td class="S_Locindex_link">
								<a href="http://google.com" id="index_pensionName">
									<font size="4"><%=pension.getP_name() %></font>
								</a>
								<font size="2" color="gray">(<%=pension.getP_addr1() %> <%=pension.getP_addr2() %>)</font>
							</td>
						</tr>
						<tr>
							<td class="index_link">
								<font size="2">주중 </font>
								<font size="2" color="red"><%=room.getR_min_wd() %></font>~ / 
								<font size="2">주말 </font>
								<font size="2" color="red"><%=room.getR_min_we() %></font>~
							</td>
			<%
								}
			%>
						</tr>
					</table>
				</td>
			<%
				}
			%>
			</tr>
		</table>
		</div>
		<%@ include file="Bottom.html" %>
	</body>
</html>