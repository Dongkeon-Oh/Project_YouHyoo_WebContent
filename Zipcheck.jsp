<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="youhyoo.*"%>
<%-- Zipcheck.jsp --%>
<%
request.setCharacterEncoding("UTF-8");

User_Dao dao=User_Dao.getInstance(); //dao 객체 얻기 
String check=request.getParameter("check"); //y,n
String z_addr3=request.getParameter("z_addr3"); //동이름

Vector <Zipcode_Dto>vec=dao.zipcodeRead(z_addr3); //dao 메소드 호출 
int totalList=vec.size(); //동을 검색하는 레코드 수 
%>
<html>
 <head>
  <script type="text/javascript">
  function dongCk(){
	  if(document.zipForm.z_addr3.value==""){
		  alert("동이름을 입력하세요");
		  document.zipForm.z_addr3.focus();	  
		  return false;
	  }
	  document.zipForm.submit();
  }//dongCk()
  
  function sendAddress(z_zipcode,z_addr1,z_addr2,z_addr3,z_addr4){
	  var addrAll=z_addr1+" "+z_addr2+" "+z_addr3+" "+z_addr4;
	  opener.document.joinForm.u_addr.value=addrAll; //주소 자동입력
	  opener.document.joinForm.u_zipcode.value=z_zipcode; //자동입력
	  
	  self.close();
  }//sendAddress
  </script>
 </head>
 <body>
 <div align=center><img src="imgs/top/youhyoo.PNG" width=200>
  <form method=post name=zipForm action=Zipcheck.jsp>
   <table>
    <tr>
     <td><br>
         동 입력 <input type=text name=z_addr3 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5">
      <input type=button value=검색 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5" onclick="dongCk()">
      <input type=hidden name=check value=n>
     </td>
    </tr>
   </table>
  </form>
  <table>
  <%
  if(check.equals("n")){
	  if(vec.isEmpty()){	  
		  out.println("<tr><td align=center><br>검색된 결과가 없습니다</td></tr>");
	  }else{ //검색된 주소가 있을때
		  %>
		  <tr>
		   <td align=center><br>
		          ※ 해당 우편번호 선택하면 주소 자동 입력됩니다</td>
	      </tr>
	      <%
	      for(int i=0;i<totalList;i++){
	    	  Zipcode_Dto dto=(Zipcode_Dto)vec.get(i); //벡터내용을 꺼낸다 
	    	  
	    	  String z_zipcode1=dto.getZ_zipcode();
	    	  String z_addr11=dto.getZ_addr1().trim();
	    	  String z_addr22=dto.getZ_addr2().trim();
	    	  String z_addr33=dto.getZ_addr3().trim();
	    	  String z_addr44=dto.getZ_addr4().trim();
	    	  
	    	  //System.out.println(z_zipcode1);
	    	  %>
	    	  <tr>
	    	   <td>
	    	    <a href="javascript:sendAddress('<%=z_zipcode1%>','<%=z_addr11%>','<%=z_addr22%>','<%=z_addr33%>','<%=z_addr44%>')">
	    	     <%=z_zipcode1%>&nbsp;
	    	     <%=z_addr11%>&nbsp;<%=z_addr22%>&nbsp;<%=z_addr33%>&nbsp;<%=z_addr44%>
	    	    </a>
	    	   </td>
	    	  </tr>
	    	  <%
	      }//for 
	      %>
	      <%
	  }//else
  }//if
  %>
  <tr>
   <td align=center><br>
    <a href="javascript:this.close()">닫기</a>
   </td>
  </tr>
  </table>
  </div>
 </body>
</html>