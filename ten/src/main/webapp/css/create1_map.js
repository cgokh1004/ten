
//마커를 담을 배열입니다
		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(38.22448620467488, 126.87515469340481), // 지도의 중심좌표
			level : 14
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		

		// 키워드로 장소를 검색합니다
		//카운트 변수
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		// 키워드 검색을 요청하는 함수입니다
		var rplace;
		var rgap;
		var rmenu;
		var rmap;
		var rlist;
		var rpage;
		function searchPlaces(place, gap, map, menu, list, page) {
			var keyword = document.getElementById(place).value;
			rplace = place;
			rgap = gap;
			rmap = map;
			rmenu = menu;
			rlist = list;
			rpage = page;
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

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			//검색시 장소검색 리스트를 보여줍니다.
			$(rmap).slideDown();

			var listEl = document.getElementById(rlist), menuEl = document
					.getElementById(rmenu), fragment = document
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

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};

					itemEl.onclick = function() {
						if (count1 != 0) {
							if (rplace == 'c_start') {
								customOverlay1.setMap(null);
							}
						}
						if (count2 != 0) {
							if (rplace == 'via') {
								customOverlay2.setMap(null);
							}
						}
						if (count3 != 0) {
							if (rplace == 'c_end') {
								customOverlay3.setMap(null);
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

			daum.maps.event.addListener(marker, 'click', function() {
				if (count1 != 0) {
					if (rplace == 'c_start') {
						customOverlay1.setMap(null);
					}
				}
				if (count2 != 0) {
					if (rplace == 'via') {
						customOverlay2.setMap(null);
					}
				}
				if (count3 != 0) {
					if (rplace == 'c_end') {
						customOverlay3.setMap(null);
					}
				}
				ShareClick(marker, title);

			});
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}
		//리스너 공용
		var distance;
		var customOverlay1 = new daum.maps.CustomOverlay({
			content : "<div id='overlay'>출발지</div>"
		});
		var customOverlay2 = new daum.maps.CustomOverlay({
			content : "<div id='overlay'>경유지</div>"
		});
		var customOverlay3 = new daum.maps.CustomOverlay({
			content : "<div id='overlay'>목적지</div>"
		});
		var distanceOverlay = new daum.maps.CustomOverlay({
			content : distance,
		});
		
		function ShareClick(marker, title) {
			map.panTo(marker.getPosition());
			document.getElementById(rgap).value = marker.getPosition();
			document.getElementById(rplace).value = title;

			if (rplace == 'c_start') {
				count1++;
				customOverlay1.setPosition(marker.getPosition());
				customOverlay1.setMap(map);
			}
			;
			if (rplace == 'via') {
				count2++;
				customOverlay2.setPosition(marker.getPosition());
				customOverlay2.setMap(map);
			}
			;

			if (rplace == 'c_end') {
				count3++;
				customOverlay3.setPosition(marker.getPosition());
				customOverlay3.setMap(map);
			}
		}
		
		var polyline = new daum.maps.Polyline({
			strokeWeight : 3,
			strokeColor : 'red',
			strokeOpacity : 0.8,
			strokeStyle : 'dash'
		});
		jQuery(document).ready(function($) {
			// 이 함수 안에서는 $를 jQuery가 사용
            $("#choice").click(function(){
            	var bounds2 = new daum.maps.LatLngBounds();
            	var via=$("#viav").val()
            	if($("#c_start").val()==''){
            		alert("출발지를 검색해 주세요")
            		$("#c_start").focus()
            		return false;
            	}
            	if($("#c_startv").val()==''){
            		alert("출발지를 검색하시고 검색된 목록에서 출발지를 선택해주세요")
            		$("#search1").focus()
            		return false;
            	}
            	if($("#via").val()==''){
            		customOverlay2.setMap(null)
            	}
            	if($("#via").val()!=''&&$("#viav").val()==''){
            		alert("경유지를 검색하시고 검색된 목록에서 경유지를 선택해주세요")
            		$("#search2").focus()
            		return false;
            	}
            	if($("#c_end").val()==''){
            		alert("목적지를 검색해 주세요")
            		$("#c_end").focus()
            		return false;
            	}
            	if($("#c_endv").val()==''){
            		alert("목적지를 검색하시고 검색된 목록에서 목적지를 선택해주세요")
            		$("#search3").focus()
            		return false;
            	}
            	removeMarker();
            	//지도 재정렬
            	bounds2.extend(customOverlay1.getPosition());
        		if(via!=''){bounds2.extend(customOverlay2.getPosition())};
        		bounds2.extend(customOverlay3.getPosition());
				map.setBounds(bounds2);
				
				//선긋기
				var path= polyline.getPath();
				path.splice(0,path.length)
				path.push(customOverlay1.getPosition());
				if(via!=''){path.push(customOverlay2.getPosition());}
				path.push(customOverlay3.getPosition());
				polyline.setPath(path);
				polyline.setMap(map)
				path.splice(0,path.length)
				
				//총거리
				distance = "<div id='overlay' style='margin-top: 60px;width:100px;box-shadow : 0 0 5px red'>총거리 : "
						+ Math.round(polyline.getLength() / 1000) + "km</div>";
				distanceOverlay.setPosition(customOverlay3.getPosition());
				distanceOverlay.setContent(distance);
				distanceOverlay.setMap(map);
				//검색창 애니매이션
				$(".map_wrap1").slideUp()
				$(".map_wrap2").slideUp()
				$(".map_wrap3").slideUp()
				$("#search1").hide("blind", { direction: "left" }, 700),
				$("#c_start").animate({width : '80.5%'}, 700),
				$("#search2").hide("blind", { direction: "left" }, 700),
				$("#via").animate({width : '80.5%'}, 700);
				$("#search3").hide("blind", { direction: "left" }, 700),
				$("#c_end").animate({width : '80.5%'}, 700)
            })
		});
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById(rpage), fragment = document
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

		var polyline = new daum.maps.Polyline({
			strokeWeight : 3,
			strokeColor : 'red',
			strokeOpacity : 0.8,
			strokeStyle : 'dash'
		});
		polyline.setMap(map)