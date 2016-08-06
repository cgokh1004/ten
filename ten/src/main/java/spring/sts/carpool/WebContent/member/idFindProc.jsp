<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
request.setCharacterEncoding("utf-8"); 
String mname=request.getParameter("mname");
String email=request.getParameter("email");
String id=dao.idFind(mname, email);

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
 
<DIV class="title">아이디 찾기</DIV>
<div class="content">
<%
if(id!=""){
	out.print("당신의 아이디는 "+id);
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