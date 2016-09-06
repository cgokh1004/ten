<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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

<!-- *********************************************** -->
 
<DIV class="title">회원탈퇴</DIV>
 
<div class="content">
<c:choose>
<c:when test="${cnt==1}">
탈퇴 되었습니다. 자동 로그아웃 됩니다.<br>
<DIV class='bottom'>
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
</DIV>
</c:when>
<c:otherwise>
탈퇴가 실패했습니다.<br>
<DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
</c:otherwise>
</c:choose>
</div>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 