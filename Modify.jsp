<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
회원정보수정 페이지에여~!
<div>
  <table align=center width=750 cellspacing=0 cellpadding=3 >
   <tr>
    <td colspan=2 height=30><h3>회원정보</h3></td>
   </tr>  
   <tr> 
    <td width=150>아이디</td>
    <td>
     <input type=text name=u_id id=u_id size=20> 
     <input type="button" value="중복확인" onclick="confirmId(this.form)">
    </td>
   </tr>
   <tr>
    <td>이름</td>
    <td>
     <input type=text name=u_name id=u_name size=10>
    </td>
   </tr>
   <tr>
    <td>비밀번호</td>
    <td><input type="password" name="u_pwd" id=u_pwd size=20></td>
   </tr> 
   <tr>
    <td>핸드폰</td>
    <td>
     <input type=text name=u_cell1 id=u_cel1l maxlength="3" size="4"> -
     <input type=text name=u_cell2 id=u_cell2 maxlength="4" size="4"> -
     <input type=text name=u_cell3 id=u_cell3 maxlength="4" size="4">
    </td>
   </tr>
   <tr>
   <td>우편번호</td>
    <td>
     <input type=text name=u_zipcode id=u_zipcode size=7>
     <input type=button value="우편번호" onclick="zipCheck()">
    </td>
   </tr>
   <tr>
    <td>주소</td>
    <td>
     <input type=text name=u_addr id=u_addr size=40 placeholder=상세주소>
    </td>
   </tr>
   <tr>
    <td>생년월일</td>
    <td>
     <input type=text name=u_birth id=u_birth size=6>
    </td> 
   </tr>
   <tr>
    <td>이메일</td>
    <td>
     <input type=text name=u_email id=u_email size=40>
    </td>
   </tr>  
   
   <tr>
    <td colspan=2 align=center>
     <input type=submit value=수정하기 style="width: 200px; height: 30px">
    </td>
   </tr>
  </table>
  </div>