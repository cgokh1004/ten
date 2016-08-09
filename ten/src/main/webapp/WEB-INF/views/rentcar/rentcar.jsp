<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
var addr = ""; 
function checkadd(s){
	
	//alert(s)
	
	addr=s;
	
}


//맵에 담기~.~
Mapp = function(){
	 this.mapp = new Object();
	};   
	Mapp.prototype = {   
	    put : function(key, value){   
	        this.mapp[key] = value;
	    },   
	    get : function(key){   
	        return this.mapp[key];
	    },
	    containsKey : function(key){    
	     return key in this.mapp;
	    },
	    containsValue : function(value){    
	     for(var prop in this.mapp){
	      if(this.mapp[prop] == value) return true;
	     }
	     return false;
	    },
	    isEmpty : function(key){    
	     return (this.size() == 0);
	    },
	    clear : function(){   
	     for(var prop in this.mapp){
	      delete this.mapp[prop];
	     }
	    },
	    remove : function(key){    
	     delete this.mapp[key];
	    },
	    keys : function(){   
	        var keys = new Array();   
	        for(var prop in this.mapp){   
	            keys.push(prop);
	        }   
	        return keys;
	    },
	    values : function(){   
	     var values = new Array();   
	        for(var prop in this.mapp){   
	         values.push(this.mapp[prop]);
	        }   
	        return values;
	    },
	    size : function(){
	      var count = 0;
	      for (var prop in this.mapp) {
	        count++;
	      }
	      return count;
	    }
	};
	var mapp = new Mapp();
	 mapp.put("도봉구", "도봉구 방학동 720");
	 mapp.put("강북구", "강북구 수유동 192-59");
	 mapp.put("노원구", "노원구 상계동 701-1");
	 mapp.put("은평구", "은평구 녹번동 84");
	 mapp.put("성북구", "성북구 삼선동5가 411");
	 mapp.put("종로구", "종로구 수송동 146-2");
	 mapp.put("동대문구", "동대문구 용두동 39-9");
	 mapp.put("중랑구", "중랑구 신내동 662");
	 mapp.put("서대문구", "서대문구 연희동 168-6");
	 mapp.put("중구구", "중구 예관동 120-1");
	 mapp.put("성동구", "성동구 행당동 7");
	 mapp.put("광진구", "광진구 자양동 777");
	 mapp.put("용산구", "용산구 이태원동 34-87");
	 mapp.put("마포구", "마포구 성산동 370");
	 mapp.put("강서구", "강서구 화곡동 980-16");
	 mapp.put("양천구", "양천구 신정동 321-4");
	 mapp.put("구로구", "구로구 구로동 435");
	 mapp.put("영등포구", "영등포구 당산동3가 385-1");
	 mapp.put("금천구", "금천구 시흥동 1020");
	 mapp.put("관악구", "관악구 봉천동 1570-1");
	 mapp.put("동작구", "동작구 노량진2동 47-2");
	 mapp.put("서초구", "서초구 서초동 1376-3");
	 mapp.put("강남구", "강남구 삼성동 16-1");
	 mapp.put("송파구", "송파구 신천동 29-5");
	 mapp.put("강동구", "강동구 성내동 540");
	 
	 
</script>

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
			<select onchange="checkadd(this.options[this.selectedIndex].value)">
				<option value="도봉구 방학동 720">도봉구</option> 
				<option value="강북구 수유동 192-59">강북구</option>
				<option value="노원구">노원구</option>
				<option value="은평구">은평구</option>
				<option value="성북구">성북구</option>
				<option value="종로구">종로구</option>
				<option value="동대문구">동대문구</option>
				<option value="중랑구">중랑구점</option>
				<option value="서대문구">서대문구</option>
				<option value="중구">중구구</option>
				<option value="성동구">성동구</option>
				<option value="광진구">광진구</option>
				<option value="용산구">용산구</option>
				<option value="마포구">마포구</option>
				<option value="강서구">강서구</option>
				<option value="양천구">양천구</option>
				<option value="구로구">구로구</option>
				<option value="영등포구">영등포구</option>
				<option value="금천구">금천구</option>
				<option value="관악구">관악구</option>
				<option value="동작구">동작구</option>
				<option value="서초구">서초구</option>
				<option value="강남구">강남구</option>
				<option value="송파구">송파구</option>
				<option value="강동구">강동구</option>
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
geocoder.addr2coord('도봉구 방학동 720' , function(status, result) {

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