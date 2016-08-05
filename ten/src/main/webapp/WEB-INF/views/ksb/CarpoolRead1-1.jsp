<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="color: #0099ff">정기 카풀</h1>
	<h2>타세요</h2>
	<table style="width: 100%;">
		<tr>
			<td width="10%">출발 :</td>
			<td width="30%">대전광역시 서구 갈마1동 갈마아파트</td>
			<td width="10%">도착 :</td>
			<td width="30%">충청남도 연기군 금남면 반곡리 세종국책연구단지</td>
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
						<td colspan="3"></td>
					</tr>
					<tr>
						<td>목적 : </td>
						<td>출퇴근</td>
						<td>출발일시 : </td>
						<td>2016.07.18 오전 7시 0분</td>
					</tr>
					<tr>
						<td>좌석수 :</td>
						<td>1/1</td>
						<td>비용(1인당)</td>
						<td>5000원</td>
					</tr>
					<tr>
						<td>차내흡연</td>
						<td colspan="3">비흡연</td>
					</tr>
				</table>
		<tr>
			<td colspan="4"><div id='map' style="width:800px;height:400px;"></div></td>
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
		src="//apis.daum.net/maps/maps3.js?apikey=0f292ae68136f93ccfb794979c80117b"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(35.908323969850315,
					127.35909732697293), // 지도의 중심좌표
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
	</script>
</body>
</html>