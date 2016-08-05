<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#overlay{
background-color: white; border:0px solid;border-radius:5px;width: 50px;height: 20px;font-size: 12px;box-shadow : 0 0 5px gray;
}
</style>
</head>
<body>
<h1 style="color: #ff3c6c">여성전용 카풀</h1>

<input type="hidden" value="${carpoolDTO.c_startv}" id="c_startv">
<input type="hidden" value="${carpoolDTO.viav}" id="viav">
<input type="hidden" value="${carpoolDTO.c_endv}" id="c_endv">


	<h2>타세요</h2>
	<table style="width: 100%;">
		<tr>
			<td width="10%">출발 :</td>
			<td width="30%">${carpoolDTO.c_start}</td>
			<td width="10%">도착 :</td>
			<td width="30%">${carpoolDTO.c_end}</td>
			<td valign="top" rowspan="5" width="20%" style="padding-left: 100px">
				<table border="1" style="width: 200px; border-collapse: collapse;">
					<tr>
						<td align="center"><img alt="사진" src="../images/photo.jpg">
							<br>홍길동 <br>인증내역 1개 <br>-이메일</td>
					</tr>
					<tr>
						<td><a>프로필</a></td>
					</tr>
					<tr>
						<td><a>등록글 1개</a></td>
					</tr>
					<tr>
						<td><a>평가</a></td>
					</tr>
					<tr>
						<td><button style="width: 150px; height: 150px">태우기</button></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<table border="1" style="width: 100%;border-collapse: collapse;">
					<tr>
						<td>경유지</td>
						<td colspan="3">${carpoolDTO.via}</td>
					</tr>
					<tr>
						<td>목적 : </td>
						<td>${carpoolDTO.purpose}</td>
						<td>출발일시 : </td>
						<td>${carpoolDTO.startdate}</td>
					</tr>
					<tr>
						<td>인원 수 :</td>
						<td>${carpoolDTO.seat}</td>
						<td>비용(1인당)</td>
						<td>${carpoolDTO.price}원</td>
					</tr>
					<tr>
						<td>차내흡연</td>
						<td colspan="3">${carpoolDTO.smoke}</td>
					</tr>
				</table>
		<tr>
			<td colspan="4"><div id='map' style="width:800px;height:400px;margin-left: 5%;margin-right: 5%"></div></td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: 1px solid gray">
			<h3>추가내용</h3>
			<div style="border:1px solid gray">
	차종:<br>
	카풀운행주기:<br>
	연락처(전화번호,카톡):momossic<br>
	기타내용: 인턴으로 인해서 세종국책연구단지 까지 가야되는데 카풀 태워주실분 카톡주세요!</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: 1px solid gray">
			<h3>평가</h3>
			<div align="center" style="border:0px solid;background-color:gray;border-radius:5px"><br>상대방을 평가해 주세요. (예약을 하거나 메시지를 주고 받은 상대방을 평가 할 수 있습니다.)<br>
			<br>
			<img id="star1" alt="별" src="../images/별0.png">
			<img id="star2" alt="별" src="../images/별0.png">
			<img id="star3" alt="별" src="../images/별0.png">
			<img id="star4" alt="별" src="../images/별0.png">
			<img id="star5" alt="별" src="../images/별0.png">
			<br><br>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: 1px solid gray">
			<h3>댓글</h3>
			ktw3722 : 그날 가능합니다.
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<button>목록가기</button>
			</td>
		</tr>
	</table>
<!--     여기 Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$("#star1").click(function(){$("#star1,#star2,#star3,#star4,#star5").attr("src","../images/별0.png"),
		$(this).attr("src","../images/별1.png")})
	$("#star2").click(function(){$("#star1,#star2,#star3,#star4,#star5").attr("src","../images/별0.png"),
		$("#star1").trigger("click"),
		$(this).attr("src","../images/별1.png")})
	$("#star3").click(function(){$("#star1,#star2,#star3,#star4,#star5").attr("src","../images/별0.png"),
		$("#star1").trigger("click"),$("#star2").trigger("click"),
		$(this).attr("src","../images/별1.png")})
	$("#star4").click(function(){$("#star1,#star2,#star3,#star4,#star5").attr("src","../images/별0.png"),
		$("#star1").trigger("click"),$("#star2").trigger("click"),$("#star3").trigger("click"),
		$(this).attr("src","../images/별1.png")})
	$("#star5").click(function(){$("#star1,#star2,#star3,#star4,#star5").attr("src","../images/별0.png"),
		$("#star1").trigger("click"),$("#star2").trigger("click"),$("#star3").trigger("click"),$("#star4").trigger("click"),
		$(this).attr("src","../images/별1.png")})
    $("#star1,#star2,#star3,#star4,#star5").dblclick(function(){
        $("#star1,#star2,#star3,#star4,#star5").attr("src","../images/별0.png")
    });
	
</script>
	<!-- 다음 지도 -->
<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=dfb4b6ea4ce68e78f0cb653cf043d987&libraries=services"></script>
	<script type="text/javascript">
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
		var	st1=c_startv.substring(1,c_startv.indexOf(","));
		var	st2=c_startv.substring(c_startv.indexOf(",")+1,c_startv.length-1);
		var viav =  document.getElementById("viav").value;
		var	vi1=viav.substring(1,viav.indexOf(","));
		var	vi2=viav.substring(viav.indexOf(",")+1,viav.length-1);
		var c_endv = document.getElementById("c_endv").value;
		var	en1=c_endv.substring(1,c_endv.indexOf(","));
		var	en2=c_endv.substring(c_endv.indexOf(",")+1,c_endv.length-1);


		// 커스텀 오버레이를 생성합니다
		var customOverlay1 = new daum.maps.CustomOverlay({
		    position: new daum.maps.LatLng(st1,st2),
		    content: "<div id='overlay'>출발지</div>"  
		});
		var customOverlay2 = new daum.maps.CustomOverlay({
		    position: new daum.maps.LatLng(vi1,vi2),
		    content: "<div id='overlay'>경유지</div>"  
		});
		var customOverlay3 = new daum.maps.CustomOverlay({
		    position: new daum.maps.LatLng(en1,en2),
		    content: "<div id='overlay'>목적지</div>"  
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
		var path= polyline.getPath();
		path.push(customOverlay1.getPosition());
		if(viav!=''){path.push(customOverlay2.getPosition());}
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
		if(viav!=''){bounds.extend(customOverlay2.getPosition())};
		bounds.extend(customOverlay3.getPosition());
		map.setBounds(bounds);
	</script>
</body>
</html>