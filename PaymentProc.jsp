<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"
    import="java.util.*"
    %>
    
<%
request.setCharacterEncoding("utf-8");

DetailMgr detail=DetailMgr.getInstance();

int orderAmount=Integer.parseInt(request.getParameter("orderAmount"));
int p_num=Integer.parseInt(request.getParameter("p_num"));
int ou_paytype=Integer.parseInt(request.getParameter("ou_paytype"));
//System.out.println("파라미터 주문량 / 펜션넘버 / 주문방법 = "+orderAmount+" / "+p_num+" / "+ou_paytype);

//최신 주문 정보를 가지고 옴
int maxOrderNum=detail.maxOrderNum();


//각각의 주문정보
for(int i=0; i<orderAmount; i++){
	OrderRoom_Dto dto=new OrderRoom_Dto();
	
	int r_num=Integer.parseInt(request.getParameter("r_num"+i));
	List<String> roomInfo=detail.getRoomForOrder(r_num ,p_num);
	String r_name=roomInfo.get(0);
	String p_name=roomInfo.get(1);;
	
	dto.setO_pnum(p_num);
	dto.setO_pname(p_name);
	dto.setO_rnum(r_num);
	dto.setO_rname(r_name);
	
	dto.setO_people(Integer.parseInt(request.getParameter("people"+i)));
	// 데이터 형 변경
	Date date=(new SimpleDateFormat("yyyy-MM-dd")).parse(request.getParameter("date"+i));
	java.sql.Date sqldate= new java.sql.Date(date.getTime());
	//
	dto.setO_date(sqldate);
	dto.setO_exprice(Integer.parseInt(request.getParameter("exPrice"+i)));
	dto.setO_price(Integer.parseInt(request.getParameter("price"+i)));
	
	dto.setO_state(false);
	dto.setO_group(maxOrderNum);
	
	detail.insertOrderRoom(dto);
}

// 주문자 정보가 들어가는 곳
OrderUser_Dto OU_dto=new OrderUser_Dto();

OU_dto.setOu_customer(request.getParameter("ou_customer"));
OU_dto.setOu_birth(Integer.parseInt(request.getParameter("ou_birth")));
OU_dto.setOu_emercall(request.getParameter("ou_emercall"));
OU_dto.setOu_request(request.getParameter("ou_request"));
OU_dto.setOu_id((String)session.getAttribute("u_id"));
OU_dto.setOu_cell(detail.orderUserCell("test"));
OU_dto.setOu_paytype(ou_paytype);
OU_dto.setOu_group(maxOrderNum);

detail.insertOrderUser(OU_dto);
response.sendRedirect("MyPage.jsp");
%>  