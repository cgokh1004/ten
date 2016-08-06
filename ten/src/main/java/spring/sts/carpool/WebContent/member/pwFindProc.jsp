<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
request.setCharacterEncoding("utf-8"); 
String id=request.getParameter("id");
String mname=request.getParameter("mname");
String passwd=dao.pwFind(id, mname);

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
<div class="content">
<%
if(passwd!=""){
	out.print("당신의 비밀번호는 "+passwd);
%>
<DIV class='bottom'>
  <input type='button' value='로그인' onclick="location.href='./loginForm.jsp'">
</DIV>
 <%}else{out.print("회원정보가 없습니다."); %>
<DIV class='bottom'>
<input type='button' value='다시시도' onclick="history.back()">
</DIV>
</div>
<%} %>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 