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
	<div id="sign2" style="position:relative ; z-index: 10">
	<div style="margin: 8px"><a style="text-decoration:none" href="/ten/member/logout">로그아웃</a></div>
	<div style="margin: 8px"><a style="text-decoration:none" href="/ten/mypage">마이페이지</a></div>
	<div style="margin: 8px"><a style="text-decoration:none" href="/ten/schedule">일정 관리</a></div>
	</div>
	</c:otherwise>
	</c:choose>
	<div id="effect"></div>
	<div id="menu">
		<div>
			<div id="logo" style="z-index: 10; margin-left: -20px;padding:25px;background-color: #3d3d3d">
				<a href="/ten"><img alt="logo"
					src="${pageContext.request.contextPath}/images/로고.png" width="200px"></a>
			</div>
			
			<div style="margin-top: 50px">
				<div id="list">
					<a href="/ten/carpool/list">카풀</a>
				</div>
				<div id="list">
					<a href="/ten/ktx/list"
						style="text-decoration: none; color: #3c3c3c">KTX</a>
				</div>
				<div id="list">
					<a href="/ten/food/list"
						style="text-decoration: none; color: #3c3c3c">맛집</a>
				</div>
				<div id="list">
					<a href="/ten/travel/list"
						style="text-decoration: none; color: #3c3c3c">여행 정보</a>
				</div>
				<div id="list">
					<a href="/ten/center/list"
						style="text-decoration: none; color: #3c3c3c">고객센터</a>
				</div>
				<div id="list">
					<a href="/ten/research/list"
						style="text-decoration: none; color: #3c3c3c">설문조사</a>
				</div>
	<%-- 			<c:if test="${sessionScope.mem_type=='관리자'}"> --%>
	<!-- 			<div > -->
	<!-- 				<a href="/ten/member/read" style="color: red;">회원목록</a> -->
	<!-- 			</div> -->
	<%-- 			</c:if> --%>
			</div>	
	<div id="footer">Copyright © Ten 2016</div>
		</div>
	</div>
	<div id="button"></div>
</body>
</html>