<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");

IndexMgr indexMgr=IndexMgr.getInstance();
List<Pension_Dto> pensionList=indexMgr.getIndexPensionList();

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
	</head>
	<body>
		<%@ include file="Top.jsp" %>
		
		<table id="index_mainTab">
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
									<img src="imgs/pension/<%=pension.getP_num() %>/<%=pensionPhoto.nextToken()%>" class="thumbnail">
								</a>
							</td>
						</tr>
						<tr>
							<td class="index_link">
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
		<br>
		<br>
		<br>
		<br>
		<br>
		<%@ include file="Bottom.html" %>
	</body>
</html>