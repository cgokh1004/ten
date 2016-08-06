<%@ page contentType="text/html; charset=UTF-8" %> 
<%
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
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
 
<DIV class="content">삭제</DIV>
 삭제하면 복구할 수 없습니다.<br><br>
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="bbsno" value=<%=bbsno%>>
<input type="hidden" name="col" value=<%=col%>>
<input type="hidden" name="word" value=<%=word%>>
<input type="hidden" name="nowPage" value=<%=nowPage%>>
  <TABLE class='table'>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 