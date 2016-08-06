<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="bbs.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
String col=(String)request.getParameter("col");
String word=(String)request.getParameter("word");
String nowPage=(String)request.getParameter("nowPage");
BbsDTO dto=dao.readReply(bbsno);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='replyProc.jsp'>
<input type="hidden" name="bbsno" value="<%=bbsno%>">
<input type="hidden" name="col" value="<%=col%>">
<input type="hidden" name="word" value="<%=word%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size='40' value="<%=dto.getTitle() %>"></TD>
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