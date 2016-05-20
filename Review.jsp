<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="youhyoo.*"%>

<%request.setCharacterEncoding("utf-8"); %>

<html>
 <head>
 <script type="text/javascript">
 open("width=300, height=200");
 alert("ddd");
 
 </script>
 <style type="text/css">
 .review_table{
 width: 550px;

 border-collapse: collapse;
 border-color: #BDBDBD;
 border-width: 0;
 color: #5D5D5D;
 }
 
 th{
 color: black;
 width:150
 }

 </style>
 </head>
  <body>
  <h2>이용후기</h2>
  <hr width=550px align=left >
  <font size="2" color="red">
  근거없는 비방/욕설 등록 시 통보없이 삭제 될 수 있습니다.<br>
  베스트 이용후기 선정된 회원님은 추첨을 통해 적립금이 지급될 수 있습니다.<font size="1.8" color="red">( 행사기간에 한함 )</font><br>
  </font>
  <hr width=550px align=left>
  
   <form method="post" name="viewForm" action="ReviewProc.jsp?flag=insert" enctype="multipart/form-data">
    <table class=review_table cellpadding=3 cellspacing=10 border=1>
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
     <td colspan=3><input type="text" name="rv_title" size="50" style="outline-style: none; border: transparent;"></td>
    </tr>
    <tr>
     <th>이미지첨부</th>
     <td colspan=3><input type="file" name="rv_photo"></td>
    </tr>
    <tr>
     <td colspan=4><textarea rows="20" cols="75" name="rv_content"style="outline-style: none; border: transparent;"></textarea></td>
    </tr>
    <tr>
     <td colspan=4 align="right" style="border: none;">
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
    
  