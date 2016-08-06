<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="bbs.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
BbsDTO dto=dao.read(bbsno);
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
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='updateProc.jsp'>
<input type="hidden" name="bbsno" value=<%=bbsno%>>
<input type="hidden" name="col" value=<%=col%>>
<input type="hidden" name="word" value=<%=word%>>
<input type="hidden" name="nowPage" value=<%=nowPage%>>
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" value="<%=dto.getWname()%>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size='40' value="<%=dto.getTitle() %>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea name="content" rows='10' cols='40' placeholder="content" maxlength="1333"><%=dto.getContent() %></textarea></TD>
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