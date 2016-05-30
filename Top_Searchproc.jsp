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
	margin-top: 20px;
	margin-bottom: 20px;
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
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="Top.jsp"%>
				<%
				request.setCharacterEncoding("utf-8");
				String search=request.getParameter("totalSearch");
				
				One_shotDao dao=new One_shotDao(); //객체생성
				List<Pension_Dto> s_list=dao.top_Search_List(search);

				if(s_list.size()>0){ //검색결과가 있으면
				%>
	<table class=tableshot>
		<tr>
			<th><font size=5 color="#555555">팬션 검색 결과</font></th>
		</tr>
		<tr>
			<%
				for(int i=0;s_list.size()>i;i++){ 
					Pension_Dto dto=new Pension_Dto();
					dto=s_list.get(i);
					
					//펜션이미지 
					String p_num=dto.getP_num()+"";
		  			String p_num2;
		  			
		  			if(Integer.parseInt(p_num)/100>0){
			  			p_num2="P"+p_num;
		 			 }else if(Integer.parseInt(p_num)/10>0){
						  p_num2="P0"+p_num;
		 			 }else{			 
						  p_num2="P00"+p_num;
		 			 }//if
				
		 			 if(i%5==0){ //줄바꿈
		 			 %>
		
		<tr>
					<%
		 			}//if 	
		 			 %>
			<td width=200>
				<a href="DetailView.jsp?p_num=<%=dto.getP_num()%>">
					<img src="imgs/pension/<%=p_num%>/<%=p_num2%>_F01.jpg" width=180 height=120>
				</a>
				<br><b><%=dto.getP_name()%></b> 
				<br> <%=dto.getP_addr1() %>	<%=dto.getP_addr2()%></td>
		
				<%
				}//for
				%>
		</tr>
	</table>
	<%
	}else{// 검색결과가 없으면
	%>
	<table class=tableshot>
		<tr>
			<td>
			<b><font size=5 color="#555555">검색결과가 없습니다.</font></b>
			</td>
		</tr>
	</table>
	
	<%
	}//else
	%>
	
	<%@ include file="Bottom.html"%>
</body>
</html>