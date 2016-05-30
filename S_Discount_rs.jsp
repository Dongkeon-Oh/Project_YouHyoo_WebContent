<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="youhyoo.*"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("utf-8");
String location=request.getParameter("location");
//int p_num=Integer.parseInt(request.getParameter("p_num"));
String o_date=request.getParameter("o_date");
//String location="경기";
//int p_num=1;
//String o_date="2016-05-30";
			
%>

		<table width="100%" style="text-align: left;" class="tableshot">
			<tr style="text-align: center;">
				<th colspan="2">업소</th>
				<th>빈객실</th>
				<th>구조</th>
				<th>인원</th>
				<th>추가금액</th>
				<th>요금</th>
			</tr>

			<%
				IndexMgr mgr =IndexMgr.getInstance();
						
					List<Pension_Dto> p_list = mgr.getDPList(location,o_date);
					if (p_list.size() > 0) {
						for (int i = 0; i < p_list.size(); i++) {

							Pension_Dto p_dto = new Pension_Dto();
							p_dto = (Pension_Dto) p_list.get(i);

							List<Room_Dto> r_list = mgr.getDRList(p_dto.getP_num(), o_date);
							int r_size = r_list.size();
			%>
			<tr>
				<td rowspan="<%=r_size + 1%>" style="border-right: 0;">
					<%
					String p_num1 = p_dto.getP_num() + "";
									String p_num2;
									if (Integer.parseInt(p_num1) / 100 >=1 ) {
										p_num2 = "P" + p_num1;
									} else if (Integer.parseInt(p_num1) / 10 >=1) {
										p_num2 = "P0" + p_num1;
									} else {
										p_num2 = "P00" + p_num1;
									}
					%> <img width="150px" height="120px" src="imgs/pension/<%=p_num1%>/<%=p_num2%>_F01.jpg"
					class="imgshot">
				</td>
				<td rowspan="<%=r_size + 1%>" style="border-left: 0;"><label><b><%=p_dto.getP_name()%></b><br>
						<%=p_dto.getP_addr1()%> <%=p_dto.getP_addr2()%><br> <a
						href="DetailView.jsp?p_num=<%=p_num1%>" id="linkshot">미리보기</a> </label></td>
			</tr>
			<%
				for (int j = 0; j < r_size; j++) {
								Room_Dto r_dto = new Room_Dto();
								r_dto = (Room_Dto) r_list.get(j);
			%>
			<tr>
				<td><%=r_dto.getR_name()%> <input type="button" name="ord"
					value="예약"> <img alt="미리보기" src="imgs/search/view.jpg">
				</td>
				<td><%=r_dto.getR_size()%>평(<%=String.format("%.0f",
									3.3 * r_dto.getR_size())%>㎡)</td>
				<td>기준<%=r_dto.getR_mincapa()%>명<br> 최대<%=r_dto.getR_maxcapa()%>명
				</td>
				<td><%=r_dto.getR_mincapa()%>초과시<br> 인당10,000</td>
				<td>
					<!-- ★요금 수정해야됨(성수기,비수기 등)★ --> <%=r_dto.getR_max_wd()%>
				</td>
			</tr>

			<%
				}//for
			%>
			<%
				}//for
			} else { //검색리스트 결과가 없으면
			%>
			<tr>
				<td colspan="6"><font color="blue"><b>검색결과가 없습니다.</b></font></td>
			</tr>
		</table>
		<%
			}//else
		%>
