<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8"); 
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");

int cnt = dao.updatePasswd(id, passwd);
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
 
<DIV class="title">패스워드 수정 처리</DIV>
 <div class="content">
<% 
  if(cnt == 1){ 
  %> 
    패스워드를 변경했습니다.<br> 
    로그인해보세요~~~<br><br> 
    <input type='button' value='로그인' onclick="location.href='./loginForm.jsp'"> 
  <%  
  }else{ 
  %>     
    패스워드 변경에 실패 했습니다.<br><br><br> 
    <input type='button' value='다시 시도' onclick="history.back();">
  <% 
  } 
  %> 
</DIV> 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp"/> 
</body> 
<!-- *********************************************** --> 
</html> 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 