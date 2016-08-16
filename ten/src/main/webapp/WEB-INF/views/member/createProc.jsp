<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">회원가입 처리</DIV>

	<DIV class="content">
	
	<c:choose>
	<c:when test="${flag}">
	아이디와 이메일 중복확인 하세요<br>
	<input type='button' value='다시시도' onclick="history.back()">
	</c:when>
	<c:otherwise>
		<c:choose>
		<c:when test="${cnt==1}">
			회원가입을 했습니다.<br>
			<DIV class='bottom'>
			<input type='button' value='로그인' onclick="location.href='login'">
			<input type='button' value='홈' onclick="location.href='../'">
			</DIV>
		</c:when>
		<c:otherwise>
			회원가입을 실패했습니다.
			<DIV class='bottom'><br>
			<input type='button' value='다시시도' onclick="history.back()"> 
			<input type='button' value='홈' onclick="location.href='../'">
			</DIV>
		</c:otherwise>
		</c:choose>
	</c:otherwise>
	</c:choose>

	</DIV>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
