<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/side.css">
</head>
<body>
<side> 
<div id="user_profile">
<p style="text-align: center;">
<img alt="사진" id="photo" src="${pageContext.request.contextPath}/storage/${sessionScope.mfile}">
</p>
<p style="text-align: center;">${sessionScope.name}</p>
</div>
<div id="star_avr">
	<p style="text-align: center;">
	<c:forEach begin="1" end="5">
		<img alt="별1" id="star" src="${pageContext.request.contextPath}/images/별1.png">
	</c:forEach>
	</p>
</div>
<ul id="side_menu">
<li>내 프로필</li>
<li>인증 센터</li>
<li>등록 글</li>
<li>예약</li>
<li>평가</li>

</ul>
</side>
</body>
</html>