<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/ui.css" rel="Stylesheet" type="text/css">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
 $("#apply").click(function(){
	 var seat=$("#appli_seat1").val();
	 $("#appli_seat2").val(seat);
	 $.post("/ten/booked/create",$("#frm").serialize(),
				function(data){
			if(data>=0){
				alert("예약이 완료되었습니다");
				$("#appli_seat1").val("1")
				$(".yseat").empty()
				$(".yseat").append(data)
			}else{
				alert("예약을 실패하였습니다")
			}
			
		});
 })
})
function check(no){
	url="./delete";
	url= url + "?ktx_no=" +no;
	confirm("삭제하시겠습니까?");
	location.href=url;
}
</script>
</head>
<body>
		
<input type="hidden" name="ktx_no" value="${dto.ktx_no}">


<section>

		<header>
			<h1>
				<a>KTX카풀 상세정보</a>
			</h1>
		</header>
		
		<!-- 지도-->

							<div id="map" style="width: 500px; height: 400px; float: right; margin-right: 10px;"></div>

							<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=41d86ccb9402e0d73f8db0b0d300991d"></script>
							<script>
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new daum.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new daum.maps.Map(mapContainer,
										mapOption);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new daum.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								geocoder
										.addr2coord(
												'제주특별자치도 제주시 첨단로 242',
												function(status, result) {

													// 정상적으로 검색이 완료됐으면 
													if (status === daum.maps.services.Status.OK) {

														var coords = new daum.maps.LatLng(
																result.addr[0].lat,
																result.addr[0].lng);

														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new daum.maps.Marker(
																{
																	map : map,
																	position : coords
																});

														// 인포윈도우로 장소에 대한 설명을 표시합니다
														var infowindow = new daum.maps.InfoWindow(
																{
																	content : '<div style="width:150px;text-align:center;padding:6px 0;">출발역</div>'
																});
														infowindow.open(map,
																marker);

														// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
														map.setCenter(coords);
													}
												});
							</script>

							<!-- 지도 끝 -->
							<dl>
								
								<dt>
									<div>출발지</div>
								</dt>

								<dd>
									<p>출발역을 확인하세요</p>
									<p>출발 : ${dto.s_point}</p>

								</dd>
							</dl>
							<dl>
								<dt>
									<div>도착지</div>
								</dt>
								<!--
							-->
								<dd>
									<p>도착역을 확인하세요</p>
									<p>도착 : ${dto.r_point}</p>			
								</dd>
							</dl>


		<table>
			<tr>
			<th>목적</th>
			<td>${dto.purpose}</td>
			<th>출발일시</th>
			<td>${dto.s_date}</td>
			</tr>
			<tr>
			<th>신청가능좌석수</th>
			<td>${dto.seat}</td>
			<th>금액</th>
			<td>${dto.price}원/인당</td>
			</tr>
		</table>
		<br/><br/><br/>
		<dl>
			<dt>
				<div>신청좌석수</div>
			</dt>
			<dd>
			<select name="appli_seat" id="appli_seat1">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>/<span class="yseat">${yseat}</span>
			</dd>
		</dl>
		<br/><br/><br/>
		<dl>
			
			<dt>
				<div>추가내용</div>
			</dt>

			<dd>
				<p></p>
				<textarea cols="80" rows="10">
					${dto.content}
				</textarea>
			</dd>
		</dl>
		
</section>
	<div class="bottom">
	
		<input type="button" value="목록" onclick="location.href='list'">
		<form id='frm'>
		<input type="hidden" name="ktx_no" value="${dto.ktx_no }">
		<input type="hidden" name="appli_id" value="${sessionScope.id}">
		<input type="hidden" name="writer_id" value="${dto.id}">
		<input type="hidden" id="appli_seat2" name="appli_seat">
		<input type="button" value="신청하기" id="apply">
		</form>
		<input type="button" value="수정하기" onclick="location.href='update?ktx_no=${param.ktx_no}'">
		<input type="button" value="삭제하기" onclick="check(${param.ktx_no})">
		
	</div>
</body>
</html>