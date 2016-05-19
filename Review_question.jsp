<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.List"%>

<%
//String aa=null;
if(request.getParameter("rv_num")!=null){
int num=Integer.parseInt(request.getParameter("rv_num"));
Review review=new Review();
review.View_Review(request.getParameter("rv_num"));
List review_list=review.List_Review();
for(int i=0;i<review_list.size();i++){
	Review_Dto dto=(Review_Dto)review_list.get(i);
	
	if(dto.getRv_num()==num){
		
%>
		{"question":"<%=dto.getRv_content()%>",
		"view":"<%=dto.getRv_view()%>"}
<%
	}//if
	
}
}
%>

