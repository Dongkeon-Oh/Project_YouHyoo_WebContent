<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.List"%>

<%
//String aa=null;
if(request.getParameter("qy_num")!=null){
int contentNum=Integer.parseInt(request.getParameter("qy_num"));
IndexMgr indexMgr=IndexMgr.getInstance();// indexMgr=new IndexMgr();
String content=indexMgr.getQListCon(contentNum);		
%>
		{"content":"<%=content%>"}
<%
}
%>

