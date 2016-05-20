<%@page import="sun.security.jca.GetInstance"%>
<%@page import="sun.security.util.PendingException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.List"
    import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
/*tab*/
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}
ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px; /*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}
ul.tabs li lable{
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff; /*--Gives the bevel look with a 1px white border inside the list item--*/
	outline: none;
}
ul.tabs li lable:hover {
	background: #ccc;
}
html ul.tabs li.active, html ul.tabs li.active lable:hover  { /*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	border-bottom: 1px solid #fff; /*--Makes the active tab look like it's connected with its content--*/
}

/*content*/
b_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left; width: 100%;
	background: #fff;
}
.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
</style>
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(function(){
	$("#tab2").hide();
$("#la_tab1").click(function(){
	
	$("#tab1").show();
	$("#tab2").hide();
	
});
$("#la_tab2").click(function(){

	$("#tab1").hide();
	$("#tab2").show();
	
});


});
</script>
</head>
<body>
<ul class=tabs>
	<li><lable id="la_tab1">펜션전경사진</lable></li>
	<li><lable id="la_tab2">객실사진 및 소개</lable></li>
</ul>
<div class=tab_container>
	<div id="tab1" class="tab_content">
	<table>
	 <tr>
	 	<td></td>

	   <% 
	   PensionDao dao=PensionDao.getInstance();
	   //String num=request.getParameter("p_num");
	   String num="1";
	   
	   List photo_list=dao.get_photo(num);
	   String photo="";

	   if(photo_list.get(0)!=null){
	   
	   StringTokenizer st=new StringTokenizer((String)photo_list.get(0),"|");
	 
			while(st.hasMoreTokens()){
				photo=st.nextToken();
				%>
				<td><img src="imgs/pension/<%=num%>/<%=photo%>"></td>
				<%
			}//while
	   }//if

	   %>
	 </tr>
	 
	</table>

	</div>
	<div id="tab2" class="tab_content">
	<%
	 if(photo_list.get(1)!=null){
		   
		   StringTokenizer st=new StringTokenizer((String)photo_list.get(1),"|");
		 
				while(st.hasMoreTokens()){
					photo=st.nextToken();
					%>
					<td><img src="imgs/pension/<%=num%>/room/<%=photo%>"></td>
					<%
				}//while
		   }//if
	%>	
	</div>
</div>	

</body>
</html>