<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/top.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#button").toggle(function() {
		$("#effect").animate({
			left : '0'
		}, 500);
		$("#menu").animate({
			left : '0'
		}, 500);
		$("#content").animate({
			left : '250px'
		}, 500);
		$("#button").animate({
			left : '250px'
		}, 500).css({
			"background-image" : "url('${pageContext.request.contextPath}/images/close.png')",
			"background-repeat" : "no-repeat",
			"background-position" : "center",
			"background-color" : "#0db14b"
		});
	}, function() {
		jQuery("#effect").animate({
			left : '-100%'
		}, 500);
		jQuery("#menu").animate({
			left : '-250px'
		}, 500);
		jQuery("#content").animate({
			left : '0'
		}, 500);
		jQuery("#button").animate({
			left : '0'
		}, 500).css({
			"background-image" : "url('${pageContext.request.contextPath}/images/menu.png')",
			"background-repeat" : "no-repeat",
			"background-position" : "center",
			"background-color" : "#0db14b"
		});
	});
	$("#effect").click(function() {
		$("#button").trigger("click");
	})
});
</script>
</head>
<body>
	<div id="effect"></div>
	<div id="menu">
		<div style="padding-left: 40px;">
			<div id="logo" style="z-index: 10; margin-left: -20px">
				<img alt="logo"
					src="${pageContext.request.contextPath}/images/로고.png" width="200px">
			</div>
			<div>
				<a href="http://www.naver.com"
					style="text-decoration: none; color: #3c3c3c">네이버</a>
			</div>
			<div>
				<a href="http://www.google.co.kr"
					style="text-decoration: none; color: #3c3c3c">구글</a>
			</div>
			<div>
				<a href="http://www.daum.net"
					style="text-decoration: none; color: #3c3c3c">다음</a>
			</div>
		</div>
	</div>
	<div id="button"></div>
</body>
</html>