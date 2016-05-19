<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>

<%request.setCharacterEncoding("utf-8"); %>

<html>
 <head>
 </head>
  <body>
  <h2>이용후기</h2>
  <hr>
  근거없는 비방/욕설 등록 시 통보없이 삭제 될 수 있습니다.<br>
  베스트 이용후기 선정 된 회원님은 추첨을 통해 적립금이 지급 될 수 있습니다.( 행사기간에 한함 )<br>
  <hr>
  
   <form method="post" name="viewForm" action="ReviewProc.jsp?flag=insert" enctype="multipart/form-data">
    <table cellpadding=0 cellspacing=0 border=1 width=1000px>
    <tr>
    <th>예약번호</th>
    <td>asd</td>
    <th>업소명</th>
    <td>asd</td>
    </tr>
    <tr>
    <th>평가/추천</th>
    <td colspan=3>
    <input type="radio" name="rv_score" id="rv_score" value="3">적극추천
    <input type="radio" name="rv_score" id="rv_score" value="2">추천
    <input type="radio" name="rv_score" id="rv_score" value="1">보통
    <input type="radio" name="rv_score" id="rv_score" value="0">추천안함
    </td>
    </tr>
    <tr>
     <th>제목</th>
     <td colspan=3><input type="text" name="rv_title"></td>
    </tr>
    <tr>
     <th>이미지첨부</th>
     <td colspan=3><input type="file" name="rv_photo"></td>
    </tr>
    <tr>
     <td colspan=4><textarea rows="30" cols="30" name="rv_content" ></textarea></td>
    </tr>
    <tr>
     <td colspan=4 align="right">
      <input type="hidden" name="rv_pension" value=1>
      <input type="hidden" name="rv_id" value=1>
      <input type="submit" value="저장하기">
      <input type="button" onclick="self.close()"value="작성취소">
     </td>
    </tr>  
    </table>
     </form>
  </body>
</html>
    
  