<%@ page contentType="text/html; charset=UTF-8" %> 
<%
request.setCharacterEncoding("utf-8");

%> 
 
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
 
<DIV class="title">비밀번호 찾기</DIV>
 
<FORM name='frm' method='POST' action='./pwFindProc.jsp'>
  <TABLE class='table'>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" value="user2"></TD>
    </TR>
    <TH>이름</TH>
      <TD> <input type="text" name="mname" value="개발자2"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 