<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/css/index.js"></script>
</head>
<body style="padding-top: 0">
		<div id="carpool">
		<a href="carpool/list" style="text-decoration:none">
			<div class="circle_div">
				<span class="text1"
					style="display: none; z-index: 9; position: relative; margin-left: 3.9%; 
					margin-top: 34%; font-size: 50px; font-weight: bolder; color: white; 
					text-shadow: black 0px 0px 10px;">카풀</span>
					<img id="carimg" style="margin: auto; width: 100%; height: 100%; min-width: 240px; 
					min-height: 240px; border-radius: 30%"
					src="${pageContext.request.contextPath}/images/카풀.png">
			</div>
			</a>
			<form style="text-align: center;">

				<select name='kind1' id='kind1'
					style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
					<option value="5">전체</option>
					<option value="1">정기 카풀</option>
					<option value="2">단기 카풀</option>
					<option value="3">여성전용 카풀</option>
					<option value="4">운전자</option>
				</select> <select name='kind2' id='kind2'
					style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
					<option value="1">전체</option>
					<option value="2">타세요</option>
					<option value="3">태워주세요</option>
				</select>
				<div class="search_wrap">
					<div>
						<img src="${pageContext.request.contextPath}/images/ico_start.gif"
							title="출발지" alt="출발지" width="12px" height="20px"> <input
							name="src_key_1" value="" title="출발지를 입력해주세요" size="10"
							maxlength="100"
							style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
						<img
							src="${pageContext.request.contextPath}/images/ico_arrival.gif"
							title="도착지" alt="도착지" width="12px" height="20px"> <input
							name="src_key_2" value="" title="도착지를 입력해주세요" size="10"
							maxlength="100"
							style="border: none; border: 1px solid #d8d8d8; width: 40%; height: 35px">
					</div>
				</div>
				<input type="submit" name="" value="검색" title="검색">

			</form>
		</div>
		<div id="bus">
			<div class="circle_div">
				<span class="text2"
					style="display: none;; z-index: 9; position: relative; margin-left: 0.6%; margin-top: 80px; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">전세버스</span><img
					id="busimg"
					style="margin: auto; width: 100%; height: 100%; min-width: 240px; min-height: 240px; object-fit: cover; border-radius: 30%;"
					src="${pageContext.request.contextPath}/images/버스.jpg">
			</div>
		</div>
		<div id="ktx">
			<div class="circle_div">
				<span class="text3"
					style="display: none;; z-index: 9; position: relative; margin-left: 3%; margin-top: 80px; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">KTX</span><img
					id="ktximg"
					style="margin: auto; width: 100%; height: 100%; min-width: 240px; min-height: 240px; object-fit: cover; border-radius: 30%;"
					src="${pageContext.request.contextPath}/images/기차.png">
			</div>
		</div>
		<div id="carsharing">
			<div class="circle_div">
				<span class="text4"
					style="display: none;; z-index: 9; position: relative; margin-left: 1.8%; margin-top: 35px; font-size: 50px; font-weight: bolder;; color: white; text-shadow: black 0px 0px 10px;">Car<br>Sharing
				</span><img id="shareimg"
					style="margin-top: 0px; width: 100%; height: 100%; min-width: 240px; min-height: 240px; object-fit: cover; border-radius: 50%;"
					src="${pageContext.request.contextPath}/images/sharing.gif">
			</div>
		</div>

		<div
			style="clear: left; text-align: center; margin: 20px 0px; font-size: 50px; font-weight: bolder; color: #3c3c3c">우리의
			커뮤니티</div>
		<div id="food">
			<div id="foodimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">맛있는
				것 어때?</div>
		</div>
		<div id="travel">
			<div id="travelimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">여기
				놀러갈래?</div>
		</div>
		<div id="help">
			<div id="helpimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">도움이
				필요하세요?</div>
		</div>
		<div id="research">
			<div id="researchimg"
				style="padding-top: 120px; z-index: 3; width: 350px; height: 180px; font-size: 30px; font-weight: bolder; text-shadow: black 0px 0px 10px; color: white;">몇가지만
				물어볼께요~</div>
		</div>
</body>
</html>