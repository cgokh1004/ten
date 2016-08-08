<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#overlay {
	background-color: white;
	border: 0px solid;
	border-radius: 5px;
	width: 50px;
	height: 20px;
	font-size: 12px;
	box-shadow: 0 0 5px gray;
}
.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
.rlist{
  line-height:1.2em;
  font-size: 15px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
 
 
</style>  

</head>
<body>
	<h1 style="color: #ff3c6c">여성전용 카풀</h1>

	<input type="hidden" value="${carpoolDTO.c_startv}" id="c_startv">
	<input type="hidden" value="${carpoolDTO.viav}" id="viav">
	<input type="hidden" value="${carpoolDTO.c_endv}" id="c_endv">


	<h2 align="left">타세요</h2>
	<table style="width: 100%;">
		<tr>
			<td width="10%">출발 :</td>
			<td width="30%" id="c_start" >${carpoolDTO.c_start}</td>
			<td width="10%">도착 :</td>
			<td width="30%" id="c_end">${carpoolDTO.c_end}</td>
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
				<table border="1" style="width: 100%; border-collapse: collapse;">
					<tr>
						<td>경유지</td>
						<td colspan="3" id="via">${carpoolDTO.via}</td>
					</tr>
					<tr>
						<td>목적 :</td>
						<td>${carpoolDTO.purpose}</td>
						<td>출발일시 :</td>
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

			<td colspan="4">
			<input type="button" id="roadfind"
				value="실제 경로찾기" onclick="find()">
				<div id='map'
					style="width: 800px; height: 400px; margin-left: 5%; margin-right: 5%"></div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: 1px solid gray">
				<h3 align="left">추가내용</h3>
				<div style="border: 1px solid gray">
					${carpoolDTO.c_comment}
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: 1px solid gray">
				<h3 align="left">평가</h3>
				<div align="center"
					style="border: 0px solid; background-color: gray; border-radius: 5px">
					<br>상대방을 평가해 주세요. (예약을 하거나 메시지를 주고 받은 상대방을 평가 할 수 있습니다.)<br>
					<br> <img id="star1" alt="별" src="../images/별0.png"> 
						 <img id="star2" alt="별" src="../images/별0.png">
						 <img id="star3" alt="별" src="../images/별0.png">
						 <img id="star4" alt="별" src="../images/별0.png">
						 <img id="star5" alt="별" src="../images/별0.png">
				    <br>
					<br>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button>목록가기</button>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="border-top: 1px solid gray">
				<h3 align="left">댓글</h3>
				  <c:forEach var="carpool_replyDTO" items="${rlist}">
				  <div class="rlist">
				   ${carpool_replyDTO.id}<br/>
				   <p>${carpool_replyDTO.content}</p>
				   ${carpool_replyDTO.crep_date}
				   <c:if test="${sessionScope.id==carpool_replyDTO.id }">
				   <span style="float: right;">
				   <a href="javascript:rupdate('${carpool_replyDTO.crep_no}','${carpool_replyDTO.content }')">
				   수정</a>|<a href="javascript:rdelete('${carpool_replyDTO.crep_no}')">삭제</a>
				   </span>
				   </c:if>
				  </div>
				  </c:forEach>
				  <div class="rcreate">
				  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
				  <textarea rows="3" cols="28" name="content" onclick="rcheck(this)"></textarea>
				  <input type="submit" name="rsubmit" value="등록">
				  <input type="hidden" name="carpoolno" value="${carpoolDTO.carpoolno}">
				  <input type="hidden" name="id" value="${sessionScope.id}">
				  <input type="hidden" name="nowPage" value="${param.nowPage}">
				  <input type="hidden" name="nPage" value="${nPage}">
				  <input type="hidden" name="kind1" value="${param.kind1}">
				  <input type="hidden" name="kind2" value="${param.kind2}">
				  <input type="hidden" name="word1" value="${param.word1}">
				  <input type="hidden" name="word2" value="${param.word2}">
				  <input type="hidden" name="crep_no" value="0">
				  
				  
				  </form>
				  </div>
				  <div class="bottom">
				  ${paging}
				  </div>
			</td>
		</tr>
	</table>
	<!--     여기 Jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
	//댓글관련 시작
	function rcheck(tarea){
		if('${sessionScope.id}'==""){
		if(confirm("로그인후 댓글를 쓰세요")){
		var url = "../member/login";
		url = url + "?carpoolno=${carpoolDTO.carpoolno}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&nPage=${nPage}";
		url = url + "&kind1=${param.kind1}";
		url = url + "&kind2=${param.kind2}";
		url = url + "&word1=${param.word1}";
		url = url + "&word2=${param.word2}";
		url = url + "&flag=../carpool/read";
		location.href=url;
		}else{
		tarea.blur();
		}
		}
		}
		 
		function input(f){
		if('${sessionScope.id}'==""){
		if(confirm("로그인후 댓글를 쓰세요")){
		var url = "../member/login";
		url = url + "?carpoolno=${carpoolDTO.carpoolno}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&nPage=${nPage}";
		url = url + "&kind1=${param.kind1}";
		url = url + "&kind2=${param.kind2}";
		url = url + "&word1=${param.word1}";
		url = url + "&word2=${param.word2}";
		url = url + "&flag=../carpool/read";
		location.href=url;
		return false;
		}else{
		 
		return false;
		}
		}else if(f.content.value==""){
		alert("댓글 내용을 입력하세요.");
		f.content.focus();
		return false;
		}
		}
		function rupdate(crep_no,rcontent){
		var f = document.rform;
		f.content.value = rcontent;
		f.crep_no.value = crep_no;
		f.rsubmit.value="수정";
		f.action="./rupdate"
		}
		function rdelete(crep_no){
		if(confirm("정말삭제 하겠습니까?")){ 
		var url = "./rdelete";
		url = url + "?crep_no="+crep_no;
		url = url + "&carpoolno=${carpoolDTO.carpoolno}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&nPage=${nPage}";
		url = url + "&kind1=${param.kind1}";
		url = url + "&kind2=${param.kind2}";
		url = url + "&word1=${param.word1}";
		url = url + "&word2=${param.word2}";
		location.href=url; 
		}
		}
	//댓글관련 끝
	
	function find(){
		var url = "http://map.daum.net/"
		var start=$("#c_start").text()
		var end=$("#c_end").text()
		
		url=url+"?sName="+start
		url=url+"&eName="+end
		window.open(url,"실제경로검색");
	}
	
	function score(score){
		alert("1")
		var url = "../carpool_review/create"
			url = url+"?score="+score
			url = url+"&carpoolno="+${carpoolDTO.carpoolno}
		
		window.open(url,"별점 평가","width=500, height=360, left=500, top=200,menubar=no");
	}
	
		$("#star1").click(
				function() {
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별0.png"), 
					$(this).attr("src","../images/별1.png"),
					score(1);
				})
		$("#star2").click(
				function() {
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별0.png"),
					$("#star1,#star2").attr("src", "../images/별1.png"),
					score(2);
				})
		$("#star3").click(
				function() {
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별0.png"), 
					$("#star1,#star2,#star3").attr("src","../images/별1.png"),
					score(3);
				})
		$("#star4").click(
				function() {
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별0.png"),
					$("#star1,#star2,#star3,#star4").attr("src","../images/별1.png"),
					score(4);
				})
		$("#star5").click(
				function() {
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별0.png"),
					$("#star1,#star2,#star3,#star4,#star5").attr("src", "../images/별1.png"),
					score(5);
				})
		$("#star1,#star2,#star3,#star4,#star5").dblclick(
				function() {
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별0.png"),
					score(0);
				});
	</script>
	<!-- 다음 지도 -->
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=dfb4b6ea4ce68e78f0cb653cf043d987
		&libraries=services"></script>
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
	</script>
</body>
</html>