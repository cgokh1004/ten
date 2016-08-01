<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
.map_wrap1, .map_wrap1 * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap1 a, .map_wrap1 a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap1 {display:none;position:relative;width:100%;height:300px;margin-top: 5px;margin-bottom: 10px}
#menu_wrap1 {width:99%;height:100%;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.map_wrap2, .map_wrap2 * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap2 a, .map_wrap2 a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap2 {display:none;position:relative;width:100%;height:300px;margin-top: 5px;margin-bottom: 10px}
#menu_wrap2 {width:99%;height:100%;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.map_wrap3, .map_wrap3 * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap3 a, .map_wrap3 a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap3 {display:none;position:relative;width:100%;height:300px;margin-top: 5px;margin-bottom: 10px}
#menu_wrap3 {width:99%;height:100%;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap1 .option{text-align: center;}
#menu_wrap1 .option button {margin-left:5px;}
#menu_wrap2 .option{text-align: center;}
#menu_wrap2 .option button {margin-left:5px;}
#menu_wrap3 .option{text-align: center;}
#menu_wrap3 .option button {margin-left:5px;}
#placesList1 li {list-style: none;}
#placesList1 .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList1 .item span {display: block;margin-top:4px;}
#placesList1 .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList1 .item .info{padding:10px 0 10px 55px;}
#placesList1 .info .gray {color:#8a8a8a;}
#placesList1 .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList1 .info .tel {color:#009900;}
#placesList1 .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList1 .item .marker_1 {background-position: 0 -10px;}
#placesList1 .item .marker_2 {background-position: 0 -56px;}
#placesList1 .item .marker_3 {background-position: 0 -102px}
#placesList1 .item .marker_4 {background-position: 0 -148px;}
#placesList1 .item .marker_5 {background-position: 0 -194px;}
#placesList1 .item .marker_6 {background-position: 0 -240px;}
#placesList1 .item .marker_7 {background-position: 0 -286px;}
#placesList1 .item .marker_8 {background-position: 0 -332px;}
#placesList1 .item .marker_9 {background-position: 0 -378px;}
#placesList1 .item .marker_10 {background-position: 0 -423px;}
#placesList1 .item .marker_11 {background-position: 0 -470px;}
#placesList1 .item .marker_12 {background-position: 0 -516px;}
#placesList1 .item .marker_13 {background-position: 0 -562px;}
#placesList1 .item .marker_14 {background-position: 0 -608px;}
#placesList1 .item .marker_15 {background-position: 0 -654px;}
#placesList2 li {list-style: none;}
#placesList2 .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList2 .item span {display: block;margin-top:4px;}
#placesList2 .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList2 .item .info{padding:10px 0 10px 55px;}
#placesList2 .info .gray {color:#8a8a8a;}
#placesList2 .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList2 .info .tel {color:#009900;}
#placesList2 .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList2 .item .marker_1 {background-position: 0 -10px;}
#placesList2 .item .marker_2 {background-position: 0 -56px;}
#placesList2 .item .marker_3 {background-position: 0 -102px}
#placesList2 .item .marker_4 {background-position: 0 -148px;}
#placesList2 .item .marker_5 {background-position: 0 -194px;}
#placesList2 .item .marker_6 {background-position: 0 -240px;}
#placesList2 .item .marker_7 {background-position: 0 -286px;}
#placesList2 .item .marker_8 {background-position: 0 -332px;}
#placesList2 .item .marker_9 {background-position: 0 -378px;}
#placesList2 .item .marker_10 {background-position: 0 -423px;}
#placesList2 .item .marker_11 {background-position: 0 -470px;}
#placesList2 .item .marker_12 {background-position: 0 -516px;}
#placesList2 .item .marker_13 {background-position: 0 -562px;}
#placesList2 .item .marker_14 {background-position: 0 -608px;}
#placesList2 .item .marker_15 {background-position: 0 -654px;}
#placesList3 li {list-style: none;}
#placesList3 .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList3 .item span {display: block;margin-top:4px;}
#placesList3 .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList3 .item .info{padding:10px 0 10px 55px;}
#placesList3 .info .gray {color:#8a8a8a;}
#placesList3 .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList3 .info .tel {color:#009900;}
#placesList3 .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList3 .item .marker_1 {background-position: 0 -10px;}
#placesList3 .item .marker_2 {background-position: 0 -56px;}
#placesList3 .item .marker_3 {background-position: 0 -102px}
#placesList3 .item .marker_4 {background-position: 0 -148px;}
#placesList3 .item .marker_5 {background-position: 0 -194px;}
#placesList3 .item .marker_6 {background-position: 0 -240px;}
#placesList3 .item .marker_7 {background-position: 0 -286px;}
#placesList3 .item .marker_8 {background-position: 0 -332px;}
#placesList3 .item .marker_9 {background-position: 0 -378px;}
#placesList3 .item .marker_10 {background-position: 0 -423px;}
#placesList3 .item .marker_11 {background-position: 0 -470px;}
#placesList3 .item .marker_12 {background-position: 0 -516px;}
#placesList3 .item .marker_13 {background-position: 0 -562px;}
#placesList3 .item .marker_14 {background-position: 0 -608px;}
#placesList3 .item .marker_15 {background-position: 0 -654px;}
#pagination1 {margin:10px auto;text-align: center;}
#pagination1 a {display:inline-block;margin-right:10px;}
#pagination1 .on {font-weight: bold; cursor: default;color:#777;}
#pagination2 {margin:10px auto;text-align: center;}
#pagination2 a {display:inline-block;margin-right:10px;}
#pagination2 .on {font-weight: bold; cursor: default;color:#777;}
#pagination3 {margin:10px auto;text-align: center;}
#pagination3 a {display:inline-block;margin-right:10px;}
#pagination3 .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
<h1>카풀 등록하기</h1>
	<table style="width: 100%;border:1px solid gray;">
	<tr>
	<td>유형 : </td>
	<td >
		<span id='타세요' style="float:left;border: 1px solid gray;width:49%;
		display: inline-block;text-align: center;padding: 25% 0px">타세요</span>
		<span id='태워주세요' style="float:left;border: 1px solid gray;width:49%;
		display: inline-block;text-align: center;padding: 25% 0px">태워주세요</span>
	</td>
	<td rowspan="5" width="40%" style="padding-left: 100px"><div id='map' style="width:300px;height:400px;"></div>
	</td>
	</tr>
	<tr>
	<td>목적 : </td>
	<td>
	<select name='kind1' id='kind1'
				style="border: none; border: 1px solid #d8d8d8; width: 100%; height: 35px">
				<option value="1">정기 카풀</option>
				<option value="2">단기 카풀</option>
				<option value="3">여성전용 카풀</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>출발지 : </td>
	<td>
        <div class="option">
            <div>
                <form name="frm1" onsubmit="searchPlaces('출발지','출발지값','.map_wrap1','menu_wrap1','placesList1','pagination1'); return false;">
                	 <input type="text" id="출발지값" name="출발지값">
                     <input type="text" value="" name="출발지" id="출발지" size="15" style="width: 88%;height: 35px"> 
                    <button id="search1" type="submit" style="width: 10%;height: 35px">검색하기</button> 
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
	<td>경유지 : </td>
	<td>
	<div class="option">
            <div>
                <form name="frm2" onsubmit="searchPlaces('경유지','경유지값','.map_wrap2','menu_wrap2','placesList2','pagination2'); return false;">
                	 <input type="text" id="경유지값" name="경유지값">
                     <input type="text" value="" name="경유지" id="경유지" size="15" style="width: 88%;height: 35px"> 
                    <button id="search2" type="submit" style="width: 10%;height: 35px">검색하기</button> 
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
	<td>목적지 : </td>
	<td>
	<div class="option">
            <div>
                <form name="frm3" onsubmit="searchPlaces('목적지','목적지값','.map_wrap3','menu_wrap3','placesList3','pagination3'); return false;">
                	 <input type="text" id="목적지값" name="목적지값">
                     <input type="text" value="" name="목적지" id="목적지" size="15" style="width: 88%;height: 35px"> 
                    <button id="search3" type="submit" style="width: 10%;height: 35px">검색하기</button> 
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
	        	<br><div align="center"><input type="button" value="이전" style="border:1px solid ;width: 200px;height: 35px"><input type="button" value="다음" style="border:1px solid ;width: 200px;height: 35px;margin-left: 60px"></div>
<!-- 여기 jquery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script> 
<script type="text/javascript">
$("#타세요").click(
		function(){$("#타세요").css("background-color","#d0d0ff"),$("#태워주세요").css("background-color","#ffffff")});
$("#태워주세요").click(
		function(){$("#태워주세요").css("background-color","#d0d0ff"),$("#타세요").css("background-color","#ffffff")});
$("#경유지").click(function(){$(".map_wrap1").slideUp()});
$("#목적지").click(function(){$(".map_wrap2").slideUp()});
</script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5010e38594b50b718b45691e3f0c3609&libraries=services"></script>
<script type="text/javascript">
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
				center: new daum.maps.LatLng(35.908323969850315, 127.35909732697293), // 지도의 중심좌표
    			level: 14 // 지도의 확대 레벨
    };  


// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});


var bounds2 = new daum.maps.LatLngBounds();

// 키워드로 장소를 검색합니다
//카운트 변수
var count1=0;
var count2=0;
var count3=0;
// 키워드 검색을 요청하는 함수입니다
var rplace;
var rgap;
var rmenu;
var rmap;
var rlist;
var rpage;
function searchPlaces(place,gap,map,menu,list,page) {
    	var keyword = document.getElementById(place).value;	
		rplace=place;
    	rgap=gap;
		rmap=map;
		rmenu=menu;
		rlist=list;
		rpage=page;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
	
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
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


// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
	
	//검색시 장소검색 리스트를 보여줍니다.
    $(rmap).slideDown();
    
    var listEl = document.getElementById(rlist), 
    menuEl = document.getElementById(rmenu),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i, places[i].title), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
            
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
            itemEl.onclick=function(){
            	if(count1!=0){
                	if(rplace=='출발지'){  
                		customOverlay1.setMap(null);
                		polyline.setMap(null);
                		path=polyline.getPath();
                		path.shift();
                		polyline.setPath(path);
                		}
                	}
            	if(count2!=0){
                	if(rplace=='경유지'){  
                		customOverlay2.setMap(null);
                		polyline.setMap(null);
                		path=polyline.getPath();
                		path.pop();
                		polyline.setPath(path);
                		}
            		}
            	if(count3!=0){
                	if(rplace=='목적지'){  
                		customOverlay3.setMap(null);
                		polyline.setMap(null);
                		path=polyline.getPath();
                		path.pop();
                		polyline.setPath(path);
                		}
            		}
            	ShareClick(marker, title);
            	
            }
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });


  
    daum.maps.event.addListener(marker,'click',function(){
    	if(count1!=0){
        	if(rplace=='출발지'){  
        		customOverlay1.setMap(null);
        		polyline.setMap(null);
        		path=polyline.getPath();
        		path.shift();
        		polyline.setPath(path);

        		}
        	}
    	if(count2!=0){
        	if(rplace=='경유지'){  
        		customOverlay2.setMap(null);
        		polyline.setMap(null);
        		path=polyline.getPath();
        		path.pop();
        		polyline.setPath(path);
        		}
    		}
    	if(count3!=0){
        	if(rplace=='목적지'){  
        		customOverlay3.setMap(null);
        		polyline.setMap(null);
        		path=polyline.getPath();
        		path.pop();
        		polyline.setPath(path);
        		}
    		}
     ShareClick(marker, title);


    });
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//리스너 공용
var customOverlay1;
var customOverlay2;
var customOverlay3;
var path
function ShareClick(marker, title){
	
	map.panTo(marker.getPosition());
	document.getElementById(rgap).value=marker.getPosition();
	document.getElementById(rplace).value=title;
    path=polyline.getPath();
	
 	bounds2.extend(marker.getPosition());
 	if(rplace=='출발지'){
	count1++;
		customOverlay1=new daum.maps.CustomOverlay({
    	position:marker.getPosition(),
    	content:'출발지'
    });
    customOverlay1.setMap(map);
    path.push(marker.getPosition());
    polyline.setPath(path);
 	};
 	if(rplace=='경유지'){
 		count2++;
	    customOverlay2=new daum.maps.CustomOverlay({
    	position:marker.getPosition(),
    	content:'경유지'
    });
    customOverlay2.setMap(map);
    path.push(marker.getPosition());
    polyline.setPath(path);
 	};

    if(rplace=='목적지'){
    	count3++;
    	    customOverlay3=new daum.maps.CustomOverlay({
        	position:marker.getPosition(),
        	content:'목적지'
        });
        customOverlay3.setMap(map);
        path.push(marker.getPosition());
        polyline.setPath(path);
        
    	removeMarker();
    	map.setBounds(bounds2)
    	polyline.setMap(map)
    	var distanceOverlay=new daum.maps.CustomOverlay({
        	position:(33.50441997495049, 126.95558225758215),
        	content:polyline.getLength()
        });
    	distanceOverlay.setMap(map);
    
    }
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById(rpage),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
	 var polyline = new daum.maps.Polyline({
		    strokeWeight: 10,
		    strokeColor: '#FF00FF',
		    strokeOpacity: 0.8,
		    strokeStyle: 'solid'
		});
		polyline.setMap(map)


</script>
</body>
</html>