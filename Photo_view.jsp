<%@page import="sun.security.jca.GetInstance"%>
<%@page import="sun.security.util.PendingException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="youhyoo.*" import="java.util.List"
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
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li lable {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	outline: none;
}

ul.tabs li lable:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active lable:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	border-bottom: 1px solid #fff;
	/*--Makes the active tab look like it's connected with its content--*/
}

/*content*/
.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}

 table{
 border-color: #BDBDBD;
 color: #5D5D5D;
 border-width: 3;
 }
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

	$(function() {
		
		//초기상태 지정
		$("#insertimg_pension").attr("src",$(".pension").attr("src"));

		//mouseover
		$(".pension").mouseover(function(){
		$("#insertimg_pension").attr("src",$(this).attr("src"));
		});  
		
		
		$("#tab2").hide();
		$("#la_tab1").click(function() { //탭1 클릭 시
			$("#tab1").show();
			$("#tab2").hide();
			
			
		});
		$("#la_tab2").click(function() {//탭2 클릭 시
			
			$("#tab1").hide();
			$("#tab2").show();
			
			//초기상태지정
			$("input:radio[value='photo_0']").attr("checked","checked");
			$("#insertimg_room").attr("src",$(".photo_0").attr("src"));
			$(".photo_1").parent().hide();
			$(".photo_0").parent().show();
			
			$(".photo_0").mouseover(function(){
				$("#insertimg_room").attr("src",$(this).attr("src"));
				
			}); 
		});	
	
		$(document).on("click","input:radio[name='r_radio']",function(){ //라디오버튼 체크 시
			$("#insertimg_room").attr("src",$("."+$(this).val()).attr("src"));
			
			//해당 룸사진 show 보여주기
			$("."+$(this).val()).each(function(index,item){
				$(item).parent().show();
			
				//mouseover
				$(item).mouseover(function(){
					$("#insertimg_room").attr("src",$(item).attr("src"));
					
				}); 
			});
			//해당하지 않는 룸 사진 hide 숨기기
			$("input:radio[name='r_radio']:not(:checked)").each(function(index,item){
				$("."+$(this).val()).parent().hide();
			});
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
				<td rowspan=2><img src="" id="insertimg_pension"></td>
					<%
						PensionDao dao = PensionDao.getInstance();
						//String num=request.getParameter("p_num");
						String num = "1";

						String p_photo = dao.get_pension_photo(num);

						if (p_photo != null) {
							StringTokenizer st = new StringTokenizer(p_photo, "|");

							while (st.hasMoreTokens()) {
								p_photo = st.nextToken();
					%>
					<td valign="top"><img src="imgs/pension/<%=num%>/<%=p_photo%>" class="pension" width=100></td>
					<%
						}//while
						}//if
					%>
				</tr>

			</table>

		</div>
		<div id="tab2" class="tab_content">
			<table>
				<tr>
				
					<%
						List list = dao.get_room_photo(num);
						for (int i = 0; i < list.size(); i++) {
							Room_Dto r_dto = (Room_Dto) list.get(i);
							%>
							<td><input type="radio" name="r_radio" value="photo_<%=i%>"><%=r_dto.getR_name()%></td>
							<%
								}//for
							%>
						</tr>
					</table>

					<table>
						<tr>
						<td rowspan=2><img src="" id="insertimg_room"></td>
					<%
						List list2 = dao.get_room_photo(num);
						for (int i = 0; i < list2.size(); i++) {
							int j=0;// 사진2개씩 변수
							Room_Dto r_dto = (Room_Dto) list2.get(i);

							StringTokenizer st = new StringTokenizer(r_dto.getR_photo(),"|");

							while (st.hasMoreTokens()) {
								j++;
					%>
					
					<td valign="top" rowspan=2><img src="imgs/pension/<%=num%>/room/<%=st.nextToken()%>" class="photo_<%=i%>" width=100></td>
					
					<% 
					if(j%2==0){//줄바꿈 위치
						%>
						</tr>
						<tr>
						<%
							}//if
						}//while
					}//for
				%>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>