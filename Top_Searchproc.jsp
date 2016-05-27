<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="TopBottom.css" type="text/css" rel="stylesheet">
		<style type="text/css">
		.tableshot {
		width: 1000px;
		margin: auto;
		text-align: left;
		border-collapse: collapse;
		border-color: #BDBDBD;
		border-width: 0;
		color: #5D5D5D;
		}

		.tableshot td {
		padding: 10px;
		}	
		
		.tableshot th {
		font-size: 15;
		}	
		

</style>

	</head>
	<body>
	<%@ include file="Top.jsp" %>

		<table width=1000px border=1 class=tableshot>
		<tr>
		 <th>팬션 검색 결과</th>
		</tr>
			<tr>
				<%
				request.setCharacterEncoding("utf-8");
				String search=request.getParameter("totalSearch");
				System.out.println(search);
				One_shotDao dao=new One_shotDao();
				List<Pension_Dto> s_list=dao.top_Search_List(search);
				
				for(int i=0;s_list.size()>i;i++){
					Pension_Dto dto=new Pension_Dto();
					dto=s_list.get(i);
					
					String p_num=dto.getP_num()+"";
		  			String p_num2;
		  			
		  			if(Integer.parseInt(p_num)/100>0){
			  			p_num2="P"+p_num;
		 			 }else if(Integer.parseInt(p_num)/10>0){
						  p_num2="P0"+p_num;
		 			 }else{			 
						  p_num2="P00"+p_num;
		 			 }//if
				
		 			 if(i%5==0){
		 				 %>
		 	<tr>
		 				<%
		 			}//if %5 	
		 			 %>
				<td>
				<a href="DetailView.jsp?p_num=<%=dto.getP_num()%>"><img src="imgs/pension/<%=p_num%>/<%=p_num2%>_F01.jpg" width=180></a>
				<br>
				<b><%=dto.getP_name() %></b>
				<br>
				<%=dto.getP_addr1() %> <%=dto.getP_addr2()%>
				</td>
				<%
					
				}//for
				%>
			</tr>
		</table>
		<%@ include file="Bottom.html" %>
	</body>
</html>