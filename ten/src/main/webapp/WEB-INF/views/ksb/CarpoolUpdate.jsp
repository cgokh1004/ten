<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/create1.css">
<link rel="stylesheet"
	href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
</head>
<body>
	<form name="frm" action="../carpool/update" method="post" onsubmit="return input()">
	<input type="hidden" value="${carpoolDTO.carpoolno}" name="carpoolno">
	<input type="hidden" class="c_start" name="c_start">
	<input type="hidden" class="c_startv" name="c_startv">
	<input type="hidden" class="via" name="via">
	<input type="hidden" class="viav" name="viav">
	<input type="hidden" class="c_end" name="c_end">
	<input type="hidden" class="c_endv" name="c_endv">
		<h1>
			<c:set var="c_type" value="${carpoolDTO.c_type}"/>
			<select name='c_type' id='c_type'
				style="border: none; border: 1px solid #a9a9a9; width: 250px; height: 55px;
				font-size: xx-large;font-weight: bolder">
				<option value="" selected="selected">선택해주세요</option>
				<option value="정기카풀"
				<c:if test="${c_type eq '정기카풀'}">selected="selected"</c:if>
				>정기 카풀</option>
				<option value="단기카풀"
				<c:if test="${c_type eq '단기카풀'}">selected="selected"</c:if>
				>단기 카풀</option>
				<option value="여성전용카풀"
				<c:if test="${c_type eq '여성전용카풀'}">selected="selected"</c:if>
				>여성전용 카풀</option>
			</select>
		</h1>
		<h2 align="left">
			<c:set var="kind" value="${carpoolDTO.kind}"/>
			<select name='kind' id='kind'
				style="border: none; border: 1px solid #a9a9a9; width: 150px; height: 45px;
				font-size: large;font-weight: bold">
				<option value="" selected="selected">선택해주세요</option>
				<option value="타세요"
				<c:if test="${kind eq '타세요'}">selected="selected"</c:if>
				>타세요</option>
				<option value="태워주세요"
				<c:if test="${kind eq '태워주세요'}">selected="selected"</c:if>
				>태워주세요</option>
			</select>
		</h2>
		<table style="width: 80%;">
			<tr>
				<td width="10%">출발지 :</td>
				<td width="30%" valign="top">
					<form>
						<button style="display: none;" type="submit"></button>
					</form>
					<div class="option">
						<form name="frm1"
							onsubmit="searchPlaces('c_start','c_startv','.map_wrap1','menu_wrap1','placesList1','pagination1'); return false;">
							<input type="hidden" id="c_startv" name="c_startv"
								value="${carpoolDTO.c_startv}"> 
							<input type="text"
								value="${carpoolDTO.c_start}" name="c_start" id="c_start"
								size="30" maxlength="30"
								style="width: 80.5%; height: 35px; float: left">
							<button id="search1" type="submit"
								style="width: 80px; height: 40px; float: left; display: none">검색하기</button>
						</form>
					</div>
					<div class="map_wrap1">
						<div id="menu_wrap1" class="bg_white">
							<ul id="placesList1"></ul>
							<div id="pagination1"></div>
						</div>
					</div>
				</td>
				<td width="10%">목적지 :</td>
				<td width="30%" valign="top">
					<div class="option">
						<form name="frm3"
							onsubmit="searchPlaces('c_end','c_endv','.map_wrap3','menu_wrap3','placesList3','pagination3'); return false;">
							<input type="hidden" id="c_endv" name="c_endv"
								value="${carpoolDTO.c_endv}"> <input type="text"
								value="${carpoolDTO.c_end}" name="c_end" id="c_end" size="30"
								maxlength="30" style="width: 80.5%; height: 35px; float: left">
							<button id="search3" type="submit"
								style="width: 80px; height: 40px; float: left; display: none">검색하기</button>
						</form>
					</div>
					<div class="map_wrap3">
						<div id="menu_wrap3" class="bg_white">
							<ul id="placesList3"></ul>
							<div id="pagination3"></div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table border="1" style="width: 100%; border-collapse: collapse;">
						<tr>
							<td>경유지</td>
							<td colspan="3">
								<div class="option">
									<form name="frm2"
										onsubmit="searchPlaces('via','viav','.map_wrap2','menu_wrap2','placesList2','pagination2'); return false;">
										<input type="hidden" id="viav" value="${carpoolDTO.viav}" name="viav"> <input
											type="text" value="${carpoolDTO.via}" name="via" id="via"
											size="30" maxlength="30"
											style="width: 80.5%; height: 35px; float: left">
										<button id="search2" type="submit"
											style="width: 12%; height: 40px; float: left; display: none">검색하기</button>
										<input type="button" id='choice' value="최종확정" 
										style="width: 90px;height: 40px;float: left;margin-left: 20px">	
									</form>
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
							<td>목적 :</td>
							<td><input type="text" name="purpose" value="${carpoolDTO.purpose}" size="15" maxlength="15"
								style="width: 100%; height: 35px"></td>
							<td>출발일시 :</td>
							<td>
							<input type="text" name='startdate' id='startdate' class='datetimepicker'
							value="${carpoolDTO.startdate}" 
							style="border: 1px solid #d8d8d8; width: 40%; height: 35px">
							</td>
						</tr>
						<tr>
							<td>인원 수 :</td>
							<td><input type="text" name="seat" value="${carpoolDTO.seat}" size="10" maxlength="10"
								style="width: 100%; height: 35px"></td>
							<td>금액(1인당)</td>
							<td><input type="text" name="price" value="${carpoolDTO.price}" size="10" maxlength="10"
								style="width: 90%; height: 35px">원</td>
						</tr>
						<tr>
							<td>차내흡연</td>
							<td colspan="3">
								<c:set var="smoke" value="${carpoolDTO.smoke}"/>
							<select name='smoke' id='smoke'
								style="border: none; border: 1px solid #a9a9a9; width: 81%; height: 35px; float: left;">
								<option value="" selected="selected">선택해주세요</option>
								<option id="흡연" value="흡연" 
								<c:if test="${smoke eq '흡연'}">selected="selected"</c:if>
								>흡연</option>
								<option id="비흡연" value="비흡연"
								<c:if test="${smoke eq '비흡연'}">selected="selected"</c:if>
								>비흡연</option>
							</select>
							</td>
						</tr>
					</table>
			<tr>
				<td colspan="4"><input type="button" id="roadfind"
					value="실제 경로찾기" onclick="find()">
					<div id='map'
						style="width: 800px; height: 400px; margin-left: 5%; margin-right: 5%"></div>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="border-top: 1px solid gray">
					<h3 align="left">추가내용</h3>
					<div style="border: 1px solid gray">
						<textarea name="c_comment" id="c_comment" rows="12" cols="61"
							size="1333" maxlength="1333">
				${carpoolDTO.c_comment}
				</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<input type="submit" id='update'
					value="수정완료" style="width: 80px; height: 35px"> 
				<input type="button" value="뒤로가기" style="width: 80px; height: 35px"
					onclick="history.back()"></td>
			</tr>
		</table>
	</form>
	<!-- Jquery -->
	<script type="text/javascript">
	function input(){
	$(".c_start").val($("#c_start").val())
	$(".c_startv").val($("#c_startv").val())
	$(".via").val($("#via").val())
	$(".viav").val($("#viav").val())
	$(".c_end").val($("#c_end").val())
	$(".c_endv").val($("#c_endv").val())
	}
	</script>
	
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/create1.js"></script>
		
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=5010e38594b50b718b45691e3f0c3609&libraries=services"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/create1_map.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/read_map.js"></script>
			
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script
		src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/css/create2.js"></script>
</body>
</body>
</html>