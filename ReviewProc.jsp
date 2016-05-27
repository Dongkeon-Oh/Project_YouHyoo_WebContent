<%@page import="sun.org.mozilla.javascript.internal.ast.SwitchCase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<style type="text/css">
 .review_table{
 width: 1000px;
 margin: auto;
 text-align:center;
 border-collapse: collapse;
 border-color: #BDBDBD;
 border-width: 0;
 color: #5D5D5D;
 }
 </style>
 
<script type="text/javascript">
function question(this_num,this_tr,this_photo,this_view,this_pension){
	var tr = $(this_tr).parents("tr:first");
	var temptd=$(this_tr).parents()[0];
	var td=$(temptd).next().next().next();
	
	if($('#id'+this_num).length==0){

	$.ajax({
		type:'POST',
		url:'Review_question.jsp',
		data:'rv_num='+this_num+'&rv_view'+this_view+"&rv_pension="+this_pension,
		//"name=홍길동&location=서울"
		dataType:'json',
	success:function(data){	
	
		$(tr).after('<tr id=id'+this_num+'><td id=idd'+this_num+' colspan=5 align=left><br>'+data.question+'</td></tr>');
		if(this_photo!="ready"){
			$('#idd'+this_num).prepend("<img width=250 src='imgs/"+this_photo+"'>");
			$(td).text(data.view);
		}//photo
	
	}//success
	});//ajax
	}else{
		$('#id'+this_num).remove();
	}//else
}//question
</script>
</head>

<body>
<table>
		<tr>
			<td width="1000px" height="40px"></td>
		</tr>
</table>
 <table border=1 class=review_table>
			   <tr style="background-color: #CDCDCD; color : #4D4D4D;">
			   	<td>평가</td>
			   	<td>리뷰</td>
			   	<td>작성자</td>
			   	<td>작성일</td>
			   	<td>조회수</td>
			   </tr>
   <%
   request.setCharacterEncoding("utf-8");
   
   Review review=new Review();//객체생성

//   if(request.getParameter("flag").equals("insert")){
//	 review.Insert_Review(request);//등록메서드 호출
//   }

   		int pension_num=Integer.parseInt(request.getParameter("p_num"));// -> 디테일뷰에서 num 받아오는 부분
   	//★★★int pension_num=1; //★★★임의로 줌
   		
	   List<Review_Dto> list=review.List_Review(pension_num);
   		
	   Review_Dto review_dto=null;
	   
	   if(!(list.isEmpty())){
		   for(int i=0;i<list.size();i++){
			   review_dto=(Review_Dto)list.get(i);
			   %>
			  
			   <tr>
			     <td width=100px>
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
			     
			     <td width=490 align="left">
			     <%

			     if(!(review_dto.getRv_photo().equals("ready"))){
			    	 %>
			    	 <img src="imgs/review/ifimage.jpg">
			  
			    	 <%
			     }
			     %>
			     <input type="text" value="<%=review_dto.getRv_title()%>" style="outline-style: none; border: transparent;"  readonly="readonly" onclick="question('<%=review_dto.getRv_num()%>',this,'<%=review_dto.getRv_photo()%>','<%=review_dto.getRv_view()%>','<%=pension_num%>')">
			     </td>
			     
			     <td width=100px><%=review_dto.getRv_id()%></td>
			     
			     <td width=100px><%=review_dto.getRv_date()%></td>
			     
			     <td width=50px><%=review_dto.getRv_view()%></td>
			   </tr>
			   <%
		   }//for
	   }else{ //후기가 없으면
		   %>
			<table border=1 class=review_table>
		    <tr>
		     <td style="padding: 15px 0 15px 0;"><b>이용 후기가 없습니다</b></td>
		    </tr>
		   </table>
		   <%
	  }//else
   %>
  </table>
  <table>
		<tr>
			<td width="1000px" height="40px"></td>
		</tr>
</table>
</body>
</html>