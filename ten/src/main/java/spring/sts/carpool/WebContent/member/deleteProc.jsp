<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
String upDir=application.getRealPath("/member/storage");
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String oldfile=request.getParameter("oldfile");

int cnt=dao.delete(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원탈퇴</DIV>
 
<div class="content">
<%
if(cnt==1){
	out.print("탈퇴 되었습니다. 자동 로그아웃 됩니다.");
	session.invalidate();
	if(oldfile!=null && oldfile.equals("member.jpg")){
		Utility.deleteFile(upDir, oldfile);
	}
}else{
	out.print("탈퇴가 실패했습니다.");
}
%>
</div>
  <%if(cnt==1){%> 
<DIV class='bottom'>
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
</DIV>
<%}else{ %>
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
<%} %>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 