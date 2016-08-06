<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<FORM name='frm' method='POST' action='createProc.jsp'>
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" placeholder="홍길동" maxlength="6"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size='40' placeholder="title" maxlength="33"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea name="content" rows='10' cols='40' placeholder="content" maxlength="1333"></textarea></TD>
    </TR>
       <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" placeholder="1234" maxlength="15"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 