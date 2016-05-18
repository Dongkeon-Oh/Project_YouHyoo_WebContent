<%@page import="sun.org.mozilla.javascript.internal.ast.SwitchCase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <%
   
   request.setCharacterEncoding("utf-8");
   
   Review review=new Review();//객체생성
   
   if(request.getParameter("flag").equals("insert")){
	review.Insert_Review(request);//등록메서드 호출
	
   }else if(request.getParameter("flag").equals("list")){
	   List list=review.List_Review();
	   Review_Dto review_dto=null;
	   if(list.size()>=0){
		   %>
		   <table border=1 width=1000px>
		   <%
		   for(int i=0;i<list.size();i++){
			   review_dto=(Review_Dto)list.get(i);
			   %>
			   <tr>
			     <td>
			     <%
			     switch(review_dto.getRv_score()){
			     case 0:{
			    	 %>
			    	 <img src="imgs/review/review0.jpg">
				     <%
				     break;
			     }
			     case 1:{
			    	 %>
			    	 <img src="imgs/review/review1.jpg">
				     <%	 
				     break;
			     }
			     case 2:{
			    	 %>
			    	 <img src="imgs/review/review2.jpg">
				     <%
				     break;
			     }
			     case 3:{
			    	 %>
			    	 <img src="imgs/review/review3.jpg">
				     <%
				     break;
			     }
			     }//switch
			     %>
			     </td>
			     <td><a href="ReviewProc.jsp?flag=list&num=<%=review_dto.getRv_num()%>">
			     <%

			     if(!(review_dto.getRv_photo().equals("ready"))){
			    	 %>
			    	 <img src="imgs/review/ifimage.jpg">
			    	 <%
			     }
			     %>
			     <%=review_dto.getRv_answer()%></td></a><%--제목으로 대체--%>
			     <td><%=review_dto.getRv_id()%>
			     <td><%=review_dto.getRv_date()%></td>
			     <td><%=review_dto.getRv_view()%></td>
			   </tr>
			    <%
			    String num=request.getParameter("num");
			     if(num!=null){
			     if(review_dto.getRv_num()==Integer.parseInt(num)){
			    	 review.View_Review(num);
			     %>
			    	 <tr>
			    	 <td colspan=5>
			    	 <%
			    	  if(!(review_dto.getRv_photo().equals("ready"))){
			    	 %>
			    	  <img src="imgs/<%=review_dto.getRv_photo()%>"><br>
			    	 <%=review_dto.getRv_question()%></td>
			    	 </tr>
			    	 
			    	 <%
			    	  }//사진여부if
			      }//num확인
			     }//
			     %>
			   <%
		   }
		   %>

		   </table>
		   <%
	   }else{
		   %>
		   <table>
		    <tr>
		     <td><b>이용 후기가 없습니다</b></td>
		    </tr>
		   </table>
		   <%
		   
	   }//else
   }
   %>
</body>
</html>