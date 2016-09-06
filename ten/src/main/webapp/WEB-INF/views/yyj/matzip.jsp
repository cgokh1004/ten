<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>맛집</title>
<style>
body{
text-align: left;
}
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	height: 550px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

#info_wrap {
	position: absolute;
	top: 55px;
	right: 180px;
	bottom: 0;
	width: 400px;
	height: 430px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: white;
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
	word-break: break-all;
}

#name_wrap {
	position: absolute;
	top: 0;
	right: 180px;
	bottom: 0;
	width: 400px;
	height: 35px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: white;
	z-index: 1;
	font-weight: bold;
	font-size: 22px;
	text-align: center;
	vertical-align: middle;
	border-radius: 10px;
	
}



#create_wrap {
	position: absolute;
	top: 510px;
	right: 180px;
	bottom: 0;
	width: 400px;
	height: 60px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: white;
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
</head>
<body>
	<div class="map_wrap">
		<div id="map" style="width: 90%; height: 120%; position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input class="keywordin" type="text" value="종각역 맛집" id="keyword" size="15" onClick="{this.value='';}">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
		
		<!-- 뷰의 디스플레이는 기본적으로 숨김상태 -->
		<div id="name_wrap" class="bg_white" style="display: none;"></div>
		<div id="info_wrap" class="bg_white" style="display: none;"></div>
		<div id="create_wrap" class="bg_white" style="display: none;">
			<Form name='frm' method='POST' onsubmit="asycreate(); return false;" style="text-align: center;">
				<textarea name="content" rows="2" cols="60" placeholder="평가해주세요."></textarea>
				<input type="hidden" name="score" value="0">
				<input type="hidden" name="faddress">
				<input type="hidden" name="id" value="${sessionScope.id}">
				<input type="hidden" name="nowPage">
				<input type="hidden" name="frev_no">
				<br>
				<div id='updatestatus' style="float: left; margin-left: 100px; display: none;">
				글 수정중 입니다. <a href='javascript:updatecancel()' style="color: blue;">취소</a>
				</div>				
				<div style="float: right; margin-right: 15px;">
				<img id="star1" src="${pageContext.request.contextPath}/images/star0.png" width="15px" height="15px">
				<img id="star2" src="${pageContext.request.contextPath}/images/star0.png" width="15px" height="15px">
				<img id="star3" src="${pageContext.request.contextPath}/images/star0.png" width="15px" height="15px">
				<img id="star4" src="${pageContext.request.contextPath}/images/star0.png" width="15px" height="15px">
				<img id="star5" src="${pageContext.request.contextPath}/images/star0.png" width="15px" height="15px">
				 <input name="submitbutton" type="submit" value="리뷰 등록"></div>		
			</Form>
		</div>
	</div>
	
	<br> <br> <br> <br> <br>
	<p id="result">현위치: 서울특별시 중구 명동</p>


	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c980d3ec52eae6d4b2770029ff87d5da&libraries=services"></script>

	<script>
	
	//글쓰기 비동기 방식
	function asycreate(){
		
		//별점을 체크 해야지 기록하기
		if(document.frm.content.value==0){
			alert("내용을 입력해 주세요^^");
			document.frm.content.focus();
		}
		else if(document.frm.score.value==0){
			alert("별점을 선택해 주세요^^");
		}
		else{
			//비동기로 리스트 결과 불러오기.
			var changedurl = document.frm.content.value.replace(/\n/gi, "<br>");
			//alert(changedurl);
			var getwaycreate = "create?content=" + changedurl + "&id=" + document.frm.id.value + "&score=" + document.frm.score.value + "&faddress=" + document.frm.faddress.value;
			
			//비동기통신
			async(getwaycreate, "create");
		}
		return false;
	}
	
	// 글쓰기 비동기방식 변수에 담아주기
	var asycreatevar = asycreate;
	
	// 우측 div view 받아오기.
		var nameview = document.getElementById('name_wrap');
		var infoview = document.getElementById('info_wrap');
		var createview = document.getElementById('create_wrap');
		var updatestatusview = document.getElementById('updatestatus');

	// 하단 div view 받아오기.
		var resultDiv = document.getElementById('result');
		
	
	//검색체크
		var searchcheck = false;
		var keywordtext = document.getElementById('keyword')

		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			searchcheck = true;

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
			if (status === daum.maps.services.Status.OK) {
				
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data.places);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === daum.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === daum.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}
		
		
		
		function shareclick(position, title){
			// 뷰의 디스플레이를 보여줌				
			nameview.style.display="";
			infoview.style.display="";
			
			if("${sessionScope.id}" != ""){
				createview.style.display="";
				}
			
			//컨텐트 입력박스의 글, 별의 점수, 선택된 별의 갯수도 초기화해줌
			document.frm.content.value = "";
			document.frm.content.score = 0;
			starzero();
			
			nameview.innerHTML = title;
			document.frm.faddress.value = position;
			
			// 클릭한 좌표를 맵의 정중앙으로 이동
			map.setCenter(position);
			
			//비동기로 리스트 결과 불러오기.
			var getwayajaxlist = "ajaxlist?faddress=" + position + "&foodname=" + title;
			async(getwayajaxlist);
		}
		

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			
			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].latitude,
						places[i].longitude), marker = addMarker(placePosition,
						i, places[i].title), itemEl = getListItem(i, places[i],
						marker); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					daum.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					daum.maps.event.addListener(marker, 'mouseout', function() {
						infowindow.close();
					});

					//리스트를 마우스 클릭했을때
					itemEl.onclick = function() {	
						shareclick(marker.getPosition(), title);
					};

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].title);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			// 검색버튼을 누른거면 위치 재지정.
			if (searchcheck) {
				map.setBounds(bounds);
			}
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.title + '</h5>';

			if (places.newAddress) {
				itemStr += '    <span>' + places.newAddress + '</span>'
						+ '   <span class="jibun gray">' + places.address
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		
		
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new daum.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭했을 때,
				shareclick(position, title);
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		//마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'dragend', function() {
			var latlng = map.getCenter();
			
			
			// 뷰의 디스플레이를 숨김				
			nameview.style.display="none";
			infoview.style.display="none";
			createview.style.display="none";
			
			// 맵이 드래그로 이동되면 호출되는 함수
			getloc(latlng);
		});

		

		// 맵이 드래그로 이동되면, 현재 맵의 정중앙 좌표의 주소를 받아오고, 받아온 주소에 맛집 단어를 추가하여 재검색
		// 테스트 위치 출력해보기
		function getloc(latlng) {
			var geocoder = new daum.maps.services.Geocoder();

			var address;
			var callback = function(status, result) {
				if (status === daum.maps.services.Status.OK) {
					resultDiv.innerHTML = "현위치: " + result[0].fullName;
					address = result[0].fullName;
					
					//드래그 하면 이름으로 재검색
					autoSearchPlaces(address);
				}
			};
			geocoder.coord2addr(latlng, callback);
		}

		//드래그 하면 이름으로 재검색
		function autoSearchPlaces(address) {
			//alert(address)

			var revisionkeyword = address + " 맛집";

			//검색어에 자동으로 마지막 동의 주소만 찍어주고, 블러처리
			$(function() {
				$('#keyword').val(address.substr(address.lastIndexOf(" ") + 1));
				$('#keyword').blur();
			})

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			searchcheck = false;
			ps.keywordSearch(revisionkeyword, placesSearchCB);

		}
		
		
		//비동기통신
		function async(url, kind){
			//페이징 여부인지 확인
			//자바스크립트에서는 띄어쓰기가 안먹기때문, 띄어쓰기를 붙여서 파라미터로 보냄. 그래서 다시 띄어쓰기를 만들어줌.
			//DB에 기본키는 띄어쓰기가 들어있으므로.
			if(url.indexOf(" ") == -1){
				url = url.substring(0, url.indexOf(",")) + ", " + url.substring(url.indexOf(",")+1, url.length);
				//alert(url);
			}
			
			//alert(url);
			
			//페이징에서 삭제, 수정시에 나우페이지가 필요하므로 나우페이지가 있다면 히든의 나우페이지 바꿔주기
			if(url.indexOf("&nowPage=") != -1){
				document.frm.nowPage.value = url.substring(url.indexOf("&nowPage=")+9, url.length);
			}
			
			//비동기로 리스트 결과 불러오기.
			var xhttp;
			if (window.XMLHttpRequest) {
			    // code for modern browsers
			    xhttp = new XMLHttpRequest();
			    } else {
			    // code for IE6, IE5
			    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			  }
			  xhttp.onreadystatechange = function() {
			    if (xhttp.readyState == 4 && xhttp.status == 200) {
			    	//alert(xhttp.responseText);
				      
				   	  // JSON 표기법 문자열로 인식
				      var resulttext = eval("(" + xhttp.responseText + ")");
				      var jsontext = resulttext.data.member;
				      //infoview.innerHTML = "";
				      
				      //글쓰기 요청시에
				      if(kind == 'create'){
				    	  if(resulttext.result == 'success'){
					    	  alert("리뷰를 남겨주셔서 감사합니다.");
					    	  //입력창 초기화
					    	  document.frm.content.value = "";
					    	  document.frm.score.value = 0;
					    	  starzero();
					      }
				    	  else{
				    		  alert("리뷰를 등록하지 못하였습니다. 다시 시도해 주세요.");
				    	  }
				      }
				      
				      //삭제 요청시에
				      if(kind == 'delete'){
				    	  //!!수정을 눌른상태에서 수정을 완료안하고 삭제를 요청할수도있으므로, 삭제가되면 글쓰기 모드로 초기화
				    	  //요청을 받으면 입력폼의 제출경로를 업데이트로 바꿔주고,
						  document.frm.onsubmit=asycreatevar;
				    	  
				    	  //수정상태 보여주는걸 지워주고
				    	  updatestatusview.style.display = "none";
							
						  //폼 양식을 맞게 수정해줌
						  document.frm.content.value = "";
					      document.frm.score.value = 0;
					      document.frm.content.focus();
					      starzero();
						  document.frm.content.placeholder="등록해주세요";
						  document.frm.submitbutton.value="리뷰 등록";
				    	  if(resulttext.result == 'success'){
					    	  //입력창 초기화
					    	  document.frm.content.value = "";
					    	  document.frm.score.value = 0;
					    	  starzero();
					      }
				    	  else{
				    		  alert("삭제를 하지 못하였습니다. 다시 시도해 주세요.");
				    	  }
				      }
				      
				      
				      //수정 요청시에
				      if(kind == 'update'){
				    	  //요청을 받으면 입력폼의 제출경로를 업데이트로 바꿔주고,
						  document.frm.onsubmit=asycreatevar;
				    	  
				    	  //수정상태 보여주는걸 지워주고
				    	  updatestatusview.style.display = "none";
							
						  //폼 양식을 맞게 수정해줌
						  document.frm.content.value = "";
					      document.frm.score.value = 0;
					      document.frm.content.focus();
					      starzero();
						  document.frm.content.placeholder="등록해주세요";
						  document.frm.submitbutton.value="리뷰 등록";
						  
				    	  if(resulttext.result == 'success'){
					    	  alert("수정이 완료되었습니다.");
					      }
				    	  else{
				    		  alert("수정을 하지 못하였습니다. 다시 시도해 주세요.");
				    	  }
				      }
				      
				      
				      
				      //리스트 만들기
				      var resultmix;
				      if(jsontext.length > 0){
				    	  resultmix = "<table style='width:380px;'>"; 
					      for(i=0; i< jsontext.length; i++){
		                      resultmix = resultmix + "<tr><td style='width: 40%;'><font style='font-style: italic;'>"
							  + jsontext[i].id + "</font> 님의 글</td><td style='width: 20%; text-align: left;'>";
							 
		                      for(j=0; j<jsontext[i].score; j++){
									 resultmix = resultmix + "<img src='${pageContext.request.contextPath}/images/star1.png' width='10px' height='10px'>"; 
								  }
							  resultmix = resultmix + "</td><td style='width: 40%; text-align: center;'>"
		                      + jsontext[i].fooddate + "</td></tr><td colspan='3' style='border-bottom: 1px dotted; font-size: 14px;'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		                      + jsontext[i].content; 
		                      if(jsontext[i].id == "${sessionScope.id}"){
		                    	  resultmix = resultmix + "<br><div style='text-align: right;'><a href=javascript:reviewupdate('" + jsontext[i].frev_no + "')>수정</a> / <a href=javascript:reviewdelete('" + jsontext[i].frev_no + "')>삭제</a></div></td></tr>";
		                      }
		                      else{
		                    	  resultmix = resultmix + "</td></tr>";
		                      }
		                    }			      
					      
					      resultmix = resultmix + "</table>" + resulttext.paging;
					      
					      
					      // 평균점수를 문자열로 담아주고, 총 길이가 5글자가 넘어가면 4글자로 짜르기.
					      var avgscore = "" + resulttext.avgscore;
					      if(avgscore.length>4){
					    	  avgscore = avgscore.substring(0, 4);
					      }
					      
					      resultmix = "<div style='font-size: 15px; text-align: center; font-weight: bold; color: blue;'>총 평균 평점 : " + avgscore + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 리뷰 갯수: " + resulttext.total + "</div><br><br>" + resultmix;
					      }
				      
				      else{
				    	  resultmix = "<div style='font-size: 25px; text-align: center; font-weight: bold; color: red;'>등록된 리뷰가 없습니다.<br>첫 리뷰를 등록해주세요 ^^</div>";
				    	  }
				      
				      infoview.innerHTML = resultmix;
				      //alert(resultmix);
			    }
			  };
			  xhttp.open("GET", url, true);
			  xhttp.send();
		}
		
		//비동기 수정 요청
		function reviewupdate(frev_no){
			//수정상태라고 보여주고
			updatestatusview.style.display = "";
	
			//요청을 받으면 입력폼의 제출경로를 업데이트로 바꿔주고,
			document.frm.onsubmit=asyupdatevar;
			
			//현재 글번호를 히든에 담아주고
			document.frm.frev_no.value = frev_no;
			
			//폼 양식을 맞게 수정해줌
			document.frm.content.value = "";
			document.frm.content.focus();
			document.frm.content.placeholder="수정해주세요";
			document.frm.submitbutton.value="리뷰 수정";
		}
		
		//수정 비동기 방식(수정 폼 제출의 경로)
		var asyupdatevar = function asyupdate(){
			//별점을 체크 해야지 기록하기
			if(document.frm.content.value==0){
				alert("내용을 입력해 주세요^^");
				document.frm.content.focus();
			}
			else if(document.frm.score.value==0){
				alert("별점을 선택해 주세요^^");
			}
			else{
	 			//비동기로 수정 요청하기.
	 			var getwayupdate = "update?frev_no=" + document.frm.frev_no.value + "&faddress=" + document.frm.faddress.value + "&content=" + document.frm.content.value + "&score=" + document.frm.score.value + "&nowPage=" + document.frm.nowPage.value;
	 			//비동기통신
	 			async(getwayupdate, "update");
			}
			return false;
		}	
		
		//비동기 삭제요청 및 실행
		function reviewdelete(frev_no){
			if(confirm("정말 삭제하실 겁니까?")){
				//비동기로 삭제 요청하기.
				var getwaydelete = "delete?frev_no=" + frev_no + "&faddress=" + document.frm.faddress.value + "&nowPage=" + document.frm.nowPage.value;
				//비동기통신
				async(getwaydelete, "delete");
			}		
		}
		
		function starzero(){
			$("#star1,#star2,#star3,#star4,#star5").attr("src","${pageContext.request.contextPath}/images/star0.png");
		}
		
		//수정취소 버튼시, 원래대로 초기화
		function updatecancel(){
	    	  //요청을 받으면 입력폼의 제출경로를 업데이트로 바꿔주고,
			  document.frm.onsubmit=asycreatevar;
	    	  
	    	  //수정상태 보여주는걸 지워주고
	    	  updatestatusview.style.display = "none";
				
			  //폼 양식을 맞게 수정해줌
			  document.frm.content.value = "";
		      document.frm.score.value = 0;
		      document.frm.content.focus();
		      starzero();
			  document.frm.content.placeholder="등록해주세요";
			  document.frm.submitbutton.value="리뷰 등록";
		}
		
		
		// 별 눌렀을때 보여줄 JQuery

			$("#star1").click(function(){
				document.frm.score.value = 1;
				starzero();
				$(this).attr("src","${pageContext.request.contextPath}/images/star1.png")})
				
			$("#star2").click(function(){
				document.frm.score.value = 2;
				starzero();
				$("#star1").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$(this).attr("src","${pageContext.request.contextPath}/images/star1.png")})
				
			$("#star3").click(function(){
				document.frm.score.value = 3;
				starzero();
				$("#star1").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$("#star2").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$(this).attr("src","${pageContext.request.contextPath}/images/star1.png")})
			$("#star4").click(function(){
				document.frm.score.value = 4;
				starzero();
				$("#star1").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$("#star2").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$("#star3").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$(this).attr("src","${pageContext.request.contextPath}/images/star1.png")})
			$("#star5").click(function(){
				document.frm.score.value = 5;
				starzero();
				$("#star1").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$("#star2").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$("#star3").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$("#star4").attr("src","${pageContext.request.contextPath}/images/star1.png"),
				$(this).attr("src","${pageContext.request.contextPath}/images/star1.png")})
		    
			$("#star1,#star2,#star3,#star4,#star5").dblclick(function(){
				document.frm.score.value = 0;
				starzero();
		    });
	</script>
</body>
</html>