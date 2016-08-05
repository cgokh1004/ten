<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.th{
	border:1px
}
</style>
</head>
<body>
	<div id="back" style="width: 100%; height: 500px;">
		<fieldset style="border-top-width: 20%; position:fixed; z-index:10000; background-color: gainsboro;">
			<legend>예약가능차량검색</legend>
			<hr>
			<br> 대여일: <input type="date"><input type="time">
			<br> 반납일: <input type="date"><input type="time">
			<br>
			<hr>
			<br> 지역선택: 
			<select>
				<option value="도봉구">도봉지점</option> 
				<option value="강북구">강북지점</option>
				<option value="노원구">노원지점</option>
				<option value="은평구">은평지점</option>
				<option value="성북구">성북지점</option>
				<option value="종로구">종로지점</option>
				<option value="동대문구">동대문지점</option>
				<option value="중랑구">중랑구점</option>
				<option value="서대문구">서대문지점</option>
				<option value="중구">중구지점</option>
				<option value="성동구">성동지점</option>
				<option value="광진구">광진지점</option>
				<option value="용산구">용산지점</option>
				<option value="마포구">마포지점</option>
				<option value="강서구">강서지점</option>
				<option value="양천구">양천지점</option>
				<option value="구로구">구로지점</option>
				<option value="영등포구">영등포지점</option>
				<option value="금천구">금천지점</option>
				<option value="관악구">관악지점</option>
				<option value="동작구">동작지점</option>
				<option value="서초구">서초지점</option>
				<option value="강남구">강남지점</option>
				<option value="송파구">송파지점</option>
				<option value="강동구">강동지점</option>
			</select><br>
			<hr>
			
			<br> 차종: <select>
				<option value="volvo">Volvo</option>
				<option value="morgan">Morgan</option>
				<option value="mercedes">Mercedes</option>
				<option value="audi">Audi</option>
			</select>
		</fieldset>
		<div id="map" style="width: 100%; height: 85%;"></div>
	</div>
<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=74ba56bf3f9418761b72e5b3966b59fc&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.5666712004525, 126.97836975968286), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord('서울특별시 세종대로 110', function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재 서울시에서만 서비스 중입니다.</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	</script>
	<div align="right">
		<input type="button" value="관리자 페이지">
	</div>
<table style="width: 100%">
<tr>
<td colspan="8"><hr></td>
</tr>
	<tr align="center">
		<th>사진</th>
		<th>자동차번호</th>
		<th>차고지</th>
		<th>기본요금</th>
		<th>차종</th>
		<th>유종</th>
		<th>최대인원</th>
		<th>예약가부</th>
	</tr>
<c:choose>
<c:when test="${empty carlist}">
	<tr>
		<td colspan="8" align="center">동록된 글이 없습니다.</td>
	</tr>
</c:when>
<c:otherwise>
	<c:forEach items="${carlist }" var="dto">
	 <tr>
	 	<td><img style="width:150px; height: 150px;"  src="../storage/${dto.filename }"></td>
	 	<td>${dto.carno }</td>
	 	<td>${dto.place }</td>
	 	<td>${dto.dprice }</td>
	 	<td>${dto.brand }</td>
	 	<td>${dto.oil }</td>
	 	<td>${dto.howmany }</td>
	 	<c:choose>
	 		<c:when test="${dto.state ==1 }">
	 			<td>예약가능</td>
	 		</c:when>
	 		<c:otherwise>
	 			<td>예약불가</td>
	 		</c:otherwise>
	 	</c:choose>
	</tr>
	</c:forEach>
</c:otherwise>
</c:choose>
</table>


</body>
</html>