<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>
<html>
 <head>
  <style type="text/css">
 h3{
 	font-family: monospace;
 	font-weight: 700;
 }
 </style>
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
 <script type="text/javascript">
 $(function(){
	$("input:checkbox[class=chk]").click(function(){
		if($("input:checkbox[class=chk]:checked").length==$(".chk").length){
			$("#agreeall").prop("checked",true);
		}
		
		if($("input:checkbox[class=chk]:checked").length<$(".chk").length){
			$("input:checkbox[id=agreeall]").prop("checked",false);
		}else{
			$("input:checked[id=agreeall]").prop("checked",this.checked);
		}
	});
	
	$("#agreeall").click(function(){
		if($("input:checkbox[id='agreeall']").is(":checked")){
			$(".chk").prop("checked", this.checked);
		}else if($("input:checkbox[id='agreeall']").is(":checked")==false){
		    $(".chk").prop("checked", false);
		}
	});
 });
 
 function checkIt(){
	 var join=eval("document.joinForm");
	
	 if(!$("#agree1").is(":checked")){
		 alert("서비스 이용약관 동의 약관에 동의하십시오");
		 $('#agree1').focus();
		 return false;
	 }
	 if(!$("#agree2").is(":checked")){
		 alert("개인정보수집 및 이용 동의 약관에 동의하십시오");
		 $('#agree2').focus();
		 return false;
	 }
	 if(!$("#agree3").is(":checked")){
		 alert("개인정보 제3자 제공 동의 약관에 동의하십시오");
		 $('#agree3').focus();
		 return false;
	 }
	 if(!joinForm.u_id.value){
		 alert("id는 필수 입력입니다");
		 return false;
	 }
	 
	 if(joinForm.checkid.value==0){
		 alert("중복확인을 하세요");
		 return false;
	 }
	 
	 if(joinForm.u_name.value==''){
		 alert("이름은 필수 입력입니다");
		 joinForm.u_name.focus();
		 return false;
	 }
	 if(joinForm.u_pwd.value==''){
		 alert("pwd는 필수 입력입니다");
		 joinForm.u_pwd.focus();
		 return false;
	 }
	 if(joinForm.u_cell1.value==''){
		 alert("핸드폰번호를 입력하시오");
		 joinForm.u_cell1.focus();
		 return false;
	 }
	 if(joinForm.u_cell2.value==''){
		 alert("핸드폰번호를 다시 입력하시오");
		 joinForm.u_cell2.focus();
		 return false;
	 }
	 if(joinForm.u_cell3.value==''){
		 alert("핸드폰번호를 전부 입력하시오");
		 joinForm.u_cell3.focus();
		 return false;
	 }
	 if(joinForm.u_zipcode.value==''){
		 alert("우편번호를 입력하시오");
		 joinForm.u_zipcode.focus();
		 return false; 
	 }
	 if(joinForm.u_addr.value==''){
		 alert("주소를 입력하시오");
		 joinForm.u_addr.focus();
		 return false;
	 }
	 if(joinForm.u_birth.value=='' || joinForm.u_birth.value.length!='6'){
		 alert("생년월일 6자로 입력하세요");
		 joinForm.u_birth.focus();
		 return false;
	 }
	 	 
	 var month=Number(joinForm.u_birth.value.substr(2,2));
	 var day=Number(joinForm.u_birth.value.substr(4,2));
	 var today=new Date(); 
	 var yearNow=today.getFullYear();
	 var adultYear=yearNow-20;
	 if(month<1 || month>12){
		 alert("1월부터 12월 입력 가능");
		 return false;
	 }
	 if(day<1 || day>31){
		 alert("1일부터 31까지 입력 가능");
		 return false;
	 }
	 if((month==4 || month==6 || month==9 || month==11) && day==31){
		 alert(month+"월은 31일 존재하지 않음");
		 return false;
	 }
	 if(month==2){
		 var isleap=(year%4==0 && (year%100!=0 || year%400==0));
		 if(day>29 || (day==29 && !isleap)){
			 alert(year+"년 2월은"+day+"일 없음");
			 return false;
		 }
	 }
	 if(joinForm.u_email.value==''){
		 alert("이메일을 입력하세요");
		 joinForm.u_email.focus();
		 return false;
	 } 
	 return true;
 }//checkIt()

 //아이디 중복 체크 함수  
 function confirmId(joinForm){
	 if(joinForm.u_id.value==''){
		 //alert(joinForm.u_id.value);
		 alert("아이디를 입력하시오");
		 joinForm.u_id.focus();
		 return false;
	 }
	 url="ConfirmId.jsp?u_id="+joinForm.u_id.value;
	 open(url,"confirm","width=500,height=350");
 }//ConfirmId()
 
 function rechkId(){
	 joinForm.checkid.value=0;
 }
 
 //주소 자동입력
 function zipCheck(){
	 url="Zipcheck.jsp?check=y";
	 window.open(url,"zip","width=500,height=300,status=yes,scrollbars=yes");
 }//zipCheck() 
 </script>
 </head>
 <body>
  <form method=post name=joinForm action="Join_Proc.jsp" onsubmit="return checkIt()">
  <div align=center>
  <a href="Index.jsp"><img src="imgs/top/youhyoo.PNG" width=300></a>
  <table align=center border="0" cellpadding="0" cellspacing="0">
   <tr>
    <td>
     <h3>회원가입</h3>
     <p>회원정보는 예약에 필요한 최소한의 사항만을 입력받고 있으며,<br>
        고객정보 보호를 위해 주민등록번호와 같은 중요한 개인정보는 입력받지 않습니다.</p>
    <br>
    </td>
   </tr>
   
   <tr>
    <td><h3>서비스 이용약관 동의</h3></td>
    <td>
     <label><input type="checkbox" class=chk name=agree1 id=agree1>동의</label>
	</td>
   </tr>   
   <tr>
    <td>
     <textarea rows="5" cols="100">
목적 및 약관의 효력

제 1 조 (목적)
본 약관은 유휴(사이트명)을 통상 "회사"로 규정하고 회사에서 제공하는 인터넷 서비스 및 부가 서비스를 이용하는 사용자(네티즌, 이용회원, 일반고객, 예약자, 펜션주)을 통상 이용자 또는 회원으로 규정하여, "회사"와 "이용자" 또는 "회원간의 의무 와 책임, 서비스 이용시 준수 사항등을 규정한 것입니다.

제 2 조 (약관의 효력 및 변경) 
(1) 본 약관에 효력에 있어 본 사이트의 인터넷 서비스에 명시된 방법이나 기타방법으로 회원 또는 이용자로 등록함에 약관의 효력이 발생하며, 비회원으로 이용하는 사람도 회사 서비스를 이용하시면 회원과 동일하게 적용되어 이용약관에 동의하시는 것으로 간주됩니다. 
(2) 회사는 회사의 운영방침에 변화가 있을 시 본 약관의 내용을 변경할 수 있으며, 수정 및 개정된 약관을 회사 사이트에 공지할 수 있습니다.
(3) 변경된 약관에 동의하지 않은 회원 또는 이용자는 언제든지 회원탈퇴를 요청하거나 동의하지 않는다는 의사표시를 해 올 수 있습니다. 만약 이미 계약을 체결한 회원이 회사 사이트에 개정된 약관 공지 후 탈퇴하지 않으면 개정된 약관에 동의하는 것으로 간주합니다.
(4) 그 외 정하지 않은 약관은 소비자보호지침 및 관계법령 또는 상.관례에 따릅니다. 

서비스 이용계약 및 이용, 등록안내

제 3 조 (서비스 이용신청, 이용, 등록안내(계약)) 
(1) 이용자가 회사 약관에 동의한다는 의사표시를 하였을 경우 본 사이트를 통하여 웹상에서 등록이 가능하며 등록 방법을 모르시는 분은 전화문의 또는 전자우편으로(문서)등록이 가능합니다. 
(2) 이용자 및 회원은 회사 가입양식에 명기한 내용과 절차에 따라 선 등록하며, 회사에서 자체 심사하여 규정에 어긋날 시에는 등록을 유보하거나 제한할(삭제, 편집) 수 있습니다. 
(3) 등록이 제한되거나 유보될 경우 

※ 회사는 이용자와 회원에게 되도록이면 질 높고 정확한 정보를 제공하고자 하는 취지에서 아래와 같이 규정하는 것이니 양해를 부탁합니다 

  ① 회원정보를 허위로 기재시 
  ② 타인 명의 사용시 
  ③ 회사 규정에 어긋날 경우 
  ④ 성인 음난물 및 미풍양속에 벗어날 때 
  ⑤ 기타 회사 카테고리에 맞지 않을 경우 

  가) 회사에서 구분 해놓은 지역과 일치되지 않거나, 관리가 안되는 싸이트 
  나) 사이트의 제목과 내용이 상이하거나, 다른 목적이 있는 경우 
  다) 타인 및 다른 이용자로부터 민원 및 제보가 있을시
      (회사에서 진위 여부를 확인 후 판단함) 

(4) 회원 또는 이용자(정보제공자)가 웹상에서 등록하신 후 회사 자체 심사 후 적합하지 않은 사항이나 규정에 어긋난다고 판단할 경우, 회원이나, 이용자(정보제공자)에게 시정, 수정 요구할 수 있으며 회원 또는 이용자가 이를 무시할 경우 회사는 회원 및 이용자의 사전 동의 없이 삭제 편집할 수 있습니다.

회사와 회원준수사항 

제 4 조 (회사준주사항) 
(1) 회사는 회원이 서비스 이용할시 불편함이 없도록 최대한 노력해야 합니다. 
(2) 회사는 본 약관에서 정한 바에 따라 계속적이고 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실되지 않토록 노력해야 합니다. 다만, 천재지변, 비상사태 또는 그밖에 회사의 운영사정상 서비스 제공이 곤란한 경우에는 그 서비스를 일시 중단하거나 완전 중지할 수 있습니다. 
(3) 회사는 이용자 또는 회원으로부터 정당한 불만이 있을 경우 인정되는 부분이 있으면 회원과 상의하여 적합한 조치를 취하여야 합니다. 
(4) 이용자 또는 회원의 개인 정보를 함부로 누출해서는 안됩니다. 
(5) 회사와 회원간에 불미스러운 일이 생기지 않도록 최선을 다해 서비스 해야합니다. 

부칙 
(시행일) 이 약관은2009년 2월 15일부터 시행합니다. 
     </textarea> 
     <br><br>  
	</td>
   </tr>
  
   <tr>
    <td><h3>개인정보수집 및 이용 동의</h3></td>
    <td>
     <label><input type="checkbox" class=chk name=agree2 id=agree2>동의</label>
	</td>
   </tr>   
   <tr>
    <td>
     <textarea rows="5" cols="100">
수집하는 개인정보 항목 

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
1)구매(예약)자
- 수집항목 : 이름 , 로그인ID , 비밀번호 , 생년월일 , 휴대전화번호 , 이메일 , 서비스 이용기록 , 결제기록
- 개인정보 수집방법 : 홈페이지(회원가입,주문,예약)
2)숙박업주(가맹점)
- 수집항목 : 업소명 , 로그인ID , 비밀번호 , 담당자 및 신청인정보 , 연락처 , 홈페이지주소 , 사업자정보(세무신고 관련정보 일체) , 계좌정보
- 개인정보 수집방법 : 홈페이지(가맹접수 및 계약) 및 서류접수(FAX/우편) 


개인정보의 수집 및 이용목적

 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
 구매 및 요금 결제
- 회원 관리
 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리
- 예약 관리
 숙박업소이용에 필요한 예약관리 차원의 본인확인 및 식별
- 가맹 관리
 입점계약진행 및 가맹점 관리 차원 


개인정보의 보유 및 이용기간

 회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. 
단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.
- 보존 항목 : 접속 로그, 예약기록, 결제기록 
- 보존 근거 : 전자상거래등에서의 소비자보호에 관한 법률- 보존 기간 : 3년
- 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
     </textarea>
     <br><br>    
	</td>
   </tr>
   
     <tr>
    <td><h3>개인정보 제3자 제공 동의</h3></td>
    <td>
     <label><input type="checkbox" class=chk name=agree3 id=agree3>동의</label>
	</td>
   </tr>   
   <tr>
    <td>
     <textarea rows="5" cols="100">
개인정보의 제3자 제공

- 이용자의 경우
1) 개인정보를 제공받는 자 : 이용하고자 하는 해당 숙박업소. 확인하기
2) 제3자의 개인정보 이용 목적 : 숙박업소를 이용하는 고객의 본인확인 및 미성년자 여부를 확인하고 연락을 유지하기 위함
3) 제공하는 개인정보의 항목 : 이름, 휴대전화번호, 이메일, 생년월일, 예약정보
 
- 숙박업주의 입장
1) 개인정보를 제공받는 자 : 숙박업소를 이용 예정에 있는 예약자
2) 제3자의 개인정보 이용 목적 : 숙박업소와 숙박업소를 이용하려는 예약자 양측의 원활한 이용을 위함
3) 제공하는 개인정보의 항목 : 숙박업주 연락처, 사업자정보, 그외 업소정보
     </textarea>
     <br><br>    
	</td>
   </tr>
   <tr>
    <td align=center>
     <label><input type="checkbox" name=agreeall id=agreeall>전체 동의<br><br></label>
	</td>
   </tr>
  </table>
  </div>
  
  <div>
  <table align=center width=750 cellspacing=0 cellpadding=3>
   <tr>
    <td colspan=2 height=30><h3>회원정보</h3></td>
   </tr>  
   <tr> 
    <td width=150>아이디</td>
    <td>
     <input type=text name=u_id id=u_id size=20 style="font-size:12pt; padding:5px 40px 5px 5px; margin-top: 5" onclick="rechkId()"> 
     <input type=hidden name=checkid id=checkid value="0">
     <input type="button" value="중복확인" style="font-size:10pt; width: 65px; height: 30px" onclick="confirmId(this.form)">
    </td>
   </tr>
   <tr>
    <td>이름</td>
    <td>
     <input type=text name=u_name id=u_name style="font-size:12pt; padding:5px 40px 5px 5px; margin-top: 5">
    </td>
   </tr>
   <tr>
    <td>비밀번호</td>
    <td><input type="password" name="u_pwd" id=u_pwd size=20 style="font-size:12pt; padding:5px 40px 5px 5px; margin-top: 5"></td>
   </tr> 
   <tr>
    <td>회원유형</td>
    <td>
     <input type="radio" name=u_type id=u_type size=20 style="margin-top: 5" value="일반">일반&nbsp;
     <input type="radio" name=u_type id=u_type size=20 style="margin-top: 5" value="업체">업체&nbsp;
    </td>
   </tr>
   <tr>
    <td>핸드폰</td>
    <td>
     <input type=text name=u_cell1 id=u_cel1l maxlength="3" size="4" style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5"> -
     <input type=text name=u_cell2 id=u_cell2 maxlength="4" size="4" style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5"> -
     <input type=text name=u_cell3 id=u_cell3 maxlength="4" size="4" style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5">
    </td>
   </tr>
   <tr>
   <td>우편번호</td>
    <td>
     <input type=text name=u_zipcode id=u_zipcode size=7 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5">
     <input type=button value="우편번호" style="font-size:10pt; width: 65px; height: 30px" onclick="zipCheck()">
    </td>
   </tr>
   <tr>
    <td>주소</td>
    <td>
     <input type=text name=u_addr id=u_addr size=40 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5" placeholder=상세주소>
    </td>
   </tr>
   <tr>
    <td>생년월일</td>
    <td>
     <input type=text name=u_birth id=u_birth size=6 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5" placeholder="ex)900101">
    </td> 
   </tr>
   <tr>
    <td>이메일</td>
    <td>
     <input type=text name=u_email id=u_email size=40 style="font-size:12pt; padding:5px 5px 5px 5px; margin-top:5" placeholder=example@naver.com>
    </td>
   </tr>  
   
   <tr>
    <td colspan=2 align=center>
     <input type=submit value=가입하기 style="font-size:12pt; width: 200px; height: 40px"> 
     <br><br>
    </td>
   </tr>
  </table>
  </div>
  </form>
  
  <footer style="text-align:center;">
   <p>ⓒYou休</p>
  </footer>
  
 </body>
</html>