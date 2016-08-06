<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %>
 
<jsp:useBean id="dao" class="img.ImgDAO" />
<%  //삭제위해 실경로설정
String upDir=application.getRealPath("/member/storage");
 
request.setCharacterEncoding("utf-8"); 
int imgno = Integer.parseInt(request.getParameter("imgno"));
String passwd = request.getParameter("passwd");
String oldfile = request.getParameter("oldfile");
 
int cnt =dao.passwdCheck(imgno, passwd);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지삭제</DIV>
 
<div class="content">
<%
  if(cnt==1){
    	dao.delete(imgno);
    	out.print("글을 삭제했습니다");
 
}else{
    out.print("탈퇴가 실패했습니다. ");
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