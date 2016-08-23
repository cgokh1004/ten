<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitiobuttonl//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/top.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/top.js"></script>
</head>
<body>
	<div id="top">
	<div id="inside">
	<c:if test="${sessionScope.mem_type=='관리자'}">
	<div style="color: blue; float: left; margin-left: 700px;margin-top: 5px;font-size: 30px">관리자 입장!</div>
	</c:if>
	<img alt="down" id="down" src="${pageContext.request.contextPath}/images/down.png">
	<c:choose>
	<c:when test="${empty sessionScope.id}">
	<div id="login"><a style="text-decoration:none" href="/ten/member/login">로그인</a></div>
		<img alt="사진" id="profile" src="${pageContext.request.contextPath}/storage/사진.jpg">
	</c:when>
	<c:otherwise>
	<div id="login_name">${sessionScope.name}</div>
	<img alt="사진" id="profile" src="${pageContext.request.contextPath}/storage/${sessionScope.mfile}">
	</c:otherwise>
	</c:choose>
	</div>
	</div>
	<c:choose>
	<c:when test="${empty sessionScope.id}">
	<div id="sign1"><a style="text-decoration:none" href="/ten/member/agree">회원가입</a></div>
	</c:when>
	<c:otherwise>
	<div id="sign2">
	<div style="margin: 8px"><a style="text-decoration:none" href="/ten/member/logout">로그아웃</a></div>
	<div style="margin: 8px"><a style="text-decoration:none" href="/ten/member/mypage">마이페이지</a></div>
	</div>
	</c:otherwise>
	</c:choose>
	<div id="effect"></div>
	<div id="menu">
		<div style="padding-left: 40px;">
			<div id="logo" style="z-index: 10; margin-left: -20px">
				<a href="/ten"><img alt="logo"
					src="${pageContext.request.contextPath}/images/로고.png" width="200px"></a>
			</div>
			<div>
				<a href="/ten/carpool/list">Carpool</a>
			</div>
			<div>
				<a href="http://www.google.co.kr"
					style="text-decoration: none; color: #3c3c3c">구글</a>
			</div>
			<div>
				<a href="http://www.daum.net"
					style="text-decoration: none; color: #3c3c3c">다음</a>
			</div>
			<c:if test="${sessionScope.mem_type=='관리자'}">
			<div >
				<a href="/ten/member/read" style="color: red;">회원목록</a>
			</div>
			</c:if>
		</div>
	</div>
	<div id="button"></div>
</body>
</html>