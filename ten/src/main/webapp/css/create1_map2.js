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
								polyline.setMap(null);
								path = polyline.getPath();
								path.shift();
								polyline.setPath(path);

							}
						}
						if (count2 != 0) {
							if (rplace == 'via') {
								customOverlay2.setMap(null);
								polyline.setMap(null);
								path = polyline.getPath();
								path.pop();
								polyline.setPath(path);
							}
						}
						if (count3 != 0) {
							if (rplace == 'c_end') {
								customOverlay3.setMap(null);
								polyline.setMap(null);
								path = polyline.getPath();
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
		
		var start=document.getElementById("c_startv").value;
		var	st1=start.substring(1,start.indexOf(","));
		var	st2=start.substring(start.indexOf(",")+1,start.length-1);
		var via=document.getElementById("viav").value;
		var	vi1=via.substring(1,via.indexOf(","));
		var	vi2=via.substring(via.indexOf(",")+1,via.length-1);
		var end=document.getElementById("c_endv").value;
		var	en1=end.substring(1,end.indexOf(","));
		var	en2=end.substring(end.indexOf(",")+1,end.length-1);
		
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
            $("#choice").click(function(){
            	removeMarker();
            	var bounds2 = new daum.maps.LatLngBounds();
            	bounds2.extend(customOverlay1.getPosition());
        		if(via!=''){bounds2.extend(customOverlay2.getPosition())};
        		bounds2.extend(customOverlay3.getPosition());
        		alert(bounds2)
				map.setBounds(bounds2)
        		var polyline = new daum.maps.Polyline({
        			strokeWeight : 3,
        			strokeColor : 'red',
        			strokeOpacity : 0.8,
        			strokeStyle : 'dash'
        		});
        		var path= polyline.getPath();
        		path.push(customOverlay1.getPosition());
        		if(viav!=''){path.push(customOverlay2.getPosition());}
        		path.push(customOverlay3.getPosition());
        		polyline.setPath(path);
        		polyline.setMap(map)
				var distance = "<div id='overlay' style='margin-top: 60px;width:100px;box-shadow : 0 0 5px red'>총거리 : "
						+ Math.round(polyline.getLength() / 1000) + "km</div>";
        		var distanceOverlay = new daum.maps.CustomOverlay({
        			content : distance
        		});
        		distanceOverlay.setPosition(customOverlay3.getPosition());
        		distanceOverlay.setMap(map);
				$(".map_wrap3").slideUp()
				$("#search3").hide("blind", { direction: "left" }, 700),
				$("#c_end").animate({width : '80.5%'}, 700)
            })
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
