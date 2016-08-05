<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/create1.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
</head>
<body>
	<form name="frm" method="post" action="/ten/carpool/create2"
		onsubmit="return input()">
		<input type="hidden" name="c_start"> <input type="hidden"
			name="c_startv"> <input type="hidden" name="via"> <input
			type="hidden" name="viav"> <input type="hidden" name="c_end">
		<input type="hidden" name="c_endv">

		<h1>카풀 등록하기</h1>
		<table style="width: 100%; border: 1px solid gray;">
			<tr>
				<td>유형 :</td>
				<td><input type="hidden" id='kind' name="kind"> <span
					id='타세요'
					style="float: left; border: 1px solid #afafaf; width: 30%; display: inline-block; text-align: center; padding: 5%">
						<img height="100px" alt="타세요"
						src="${pageContext.request.contextPath}/images/타세요.png"><br>
						<br>타세요
				</span> <span id='태워주세요'
					style="float: left; border: 1px solid #afafaf; width: 30%; display: inline-block; text-align: center; padding: 5%">
						<img height="100px" alt="타세요"
						src="${pageContext.request.contextPath}/images/태워주세요.png"><br>
						<br>태워주세요
				</span></td>
				<td rowspan="5" width="40%" style="padding-left: 70px">
					<div id='map' style="width: 450px; height: 550px;"></div> <input
					type="button" id="roadfind" value="실제 경로찾기" onclick="find()">
				</td>
			</tr>
			<tr>
				<td>종류 :</td>
				<td><select name='c_type' id='c_type'
					style="border: none; border: 1px solid #a9a9a9; width: 81%; height: 35px; float: left;">
						<option value="">선택해주세요</option>
						<option value="정기카풀">정기 카풀</option>
						<option value="단기카풀">단기 카풀</option>
						<option value="여성전용카풀">여성전용 카풀</option>
				</select></td>
			</tr>
			<tr>
				<td>목적 :</td>
				<td><input name="purpose" id="purpose" type="text"
					placeholder="목적을 간단히 입력해주세요 ex)출퇴근"
					style="width: 80.5%; height: 35px; float: left;"></td>
			</tr>
			<tr>
				<td>출발지 :</td>
				<td>
					<form>
						<button style="display: none;" type="submit"></button>
					</form>
					<div class="option">
						<div>
							<form name="frm1"
								onsubmit="searchPlaces('c_start','c_startv','.map_wrap1','menu_wrap1','placesList1','pagination1'); return false;">
								<input type="hidden" id="c_startv" name="c_startv"> <input
									type="text" placeholder="출발지를 검색해주세요" name="c_start"
									id="c_start" size="15"
									style="width: 80.5%; height: 35px; float: left">
								<button id="search1" type="submit"
									style="width: 12%; height: 40px; float: left; display: none">검색하기</button>
							</form>
						</div>
					</div>
					<div class="map_wrap1">
						<div id="menu_wrap1" class="bg_white">
							<ul id="placesList1"></ul>
							<div id="pagination1"></div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>경유지 :</td>
				<td>
					<div class="option">
						<div>
							<form name="frm2"
								onsubmit="searchPlaces('via','viav','.map_wrap2','menu_wrap2','placesList2','pagination2'); return false;">
								<input type="hidden" id="viav" name="viav"> <input
									type="text" placeholder="경유지를 검색해주세요" name="via" id="via"
									size="15" style="width: 80.5%; height: 35px; float: left">
								<button id="search2" type="submit"
									style="width: 12%; height: 40px; float: left; display: none">검색하기</button>
							</form>
						</div>
					</div>
					<div class="map_wrap2">
						<div id="menu_wrap2" class="bg_white">
							<ul id="placesList2"></ul>
							<div id="pagination2"></div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>목적지 :</td>
				<td>
					<div class="option">
						<div>
							<form name="frm3"
								onsubmit="searchPlaces('c_end','c_endv','.map_wrap3','menu_wrap3','placesList3','pagination3'); return false;">
								<input type="hidden" id="c_endv" name="c_endv"> <input
									type="text" placeholder="목적지를 검색해주세요" name="c_end" id="c_end"
									size="15" style="width: 80.5%; height: 35px; float: left">
								<button id="search3" type="submit"
									style="width: 12%; height: 40px; float: left; display: none">검색하기</button>
							</form>
						</div>
					</div>
					<div class="map_wrap3">
						<div id="menu_wrap3" class="bg_white">
							<ul id="placesList3"></ul>
							<div id="pagination3"></div>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<br>
		<div align="center">
			<input type="submit" value="다음" id='next'
				style="border: 1px solid; width: 200px; height: 35px; margin-left: 60px">
		</div>
	</form>
	<!-- 여기 jquery -->

	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/create1.js"></script>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=dfb4b6ea4ce68e78f0cb653cf043d987&libraries=services"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/create1_map.js"></script>
</body>
</html>