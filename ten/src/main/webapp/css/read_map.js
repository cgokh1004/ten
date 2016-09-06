	//다음 지도
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(38.22448620467488, 126.87515469340481), // 지도의 중심좌표
		level : 14
	// 지도의 확대 레벨
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	// 커스텀 오버레이가 표시될 위치입니다 

	var c_startv = document.getElementById("c_startv").value;
	var st1 = c_startv.substring(1, c_startv.indexOf(","));
	var st2 = c_startv.substring(c_startv.indexOf(",") + 1,
			c_startv.length - 1);
	var viav = document.getElementById("viav").value;
	var vi1 = viav.substring(1, viav.indexOf(","));
	var vi2 = viav.substring(viav.indexOf(",") + 1, viav.length - 1);
	var c_endv = document.getElementById("c_endv").value;
	var en1 = c_endv.substring(1, c_endv.indexOf(","));
	var en2 = c_endv.substring(c_endv.indexOf(",") + 1, c_endv.length - 1);

	// 커스텀 오버레이를 생성합니다
	var customOverlay1 = new daum.maps.CustomOverlay({
		position : new daum.maps.LatLng(st1, st2),
		content : "<div id='overlay'>출발지</div>"
	});
	var customOverlay2 = new daum.maps.CustomOverlay({
		position : new daum.maps.LatLng(vi1, vi2),
		content : "<div id='overlay'>경유지</div>"
	});
	var customOverlay3 = new daum.maps.CustomOverlay({
		position : new daum.maps.LatLng(en1, en2),
		content : "<div id='overlay'>목적지</div>"
	});

	// 커스텀 오버레이를 지도에 표시합니다
	customOverlay1.setMap(map);
	customOverlay2.setMap(map);
	customOverlay3.setMap(map);

	//선긋기
	var polyline = new daum.maps.Polyline({
		strokeWeight : 3,
		strokeColor : 'red',
		strokeOpacity : 0.8,
		strokeStyle : 'dash'
	});
	var path = polyline.getPath();
	path.push(customOverlay1.getPosition());
	if (viav != '') {
		path.push(customOverlay2.getPosition());
	}
	path.push(customOverlay3.getPosition());
	polyline.setPath(path);
	polyline.setMap(map)
	//총거리

	var distance = "<div id='overlay' style='margin-top: 60px;width:100px;box-shadow : 0 0 5px red'>총거리 : "
			+ Math.round(polyline.getLength() / 1000) + "km</div>";
	var distanceOverlay = new daum.maps.CustomOverlay({
		content : distance
	});
	distanceOverlay.setPosition(customOverlay3.getPosition());
	distanceOverlay.setMap(map);
	//지도 범위 재정렬
	var bounds = new daum.maps.LatLngBounds();
	bounds.extend(customOverlay1.getPosition());
	if (viav != '') {
		bounds.extend(customOverlay2.getPosition())
	};
	bounds.extend(customOverlay3.getPosition());
	map.setBounds(bounds);