<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/ui.css" rel="Stylesheet" type="text/css">

		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
		  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
		  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
		 
		 
		 <script>
		  $(function() {
		    $( "#calendar" ).datepicker();
		   //옵션  : 매개변수값 2번째가 옵션의 타입이며 3번째 항목은 옵션에 대한 설정 값
		      $( "#calendar" ).datepicker( "option", "dateFormat", "yy년-mm월-dd일" ); //데이터 포맷으로 날짜의 반환 타입을 지정
		      $( "#calendar" ).datepicker( "option", "showAnim", "slideDown" );      //달력의 표시 형태
		  		});
		 </script>

		 <script language="javascript">
		 
// 		 출발지 설정
			window.onload = function() {
				document.getElementById("b_class").onchange = function() {getClass(this.form.b_class.options.selectedIndex); };
				document.getElementById("s_class").onchange = function(){ testtest(this.form.s_class.options[this.form.s_class.selectedIndex].value);}
				endplace();
			}

			var classG = new Array(new Array('지역을 선택하세요'),new Array('선택','서울역','영등포역','용산역'), new Array('선택','광명역','수원역','행신역'),
					new Array('선택','검암역','인천공항역'),new Array('선택','대전역','서대전역'),new Array('선택','동대구역'),
					new Array('선택','광주송정역'),new Array('선택','포항역'),new Array('선택','울산역'),
					new Array('선택','구포역','부산역'), new Array('선택','오송역'), new Array('선택','계룡역','공주역','논산역','천안아산역'),
					new Array('선택','남원역','익산역','전주역','정읍역'), new Array('선택','곡성역','구례구역','나주역','목포역','순천역','여수엑스포역','여천역'),
					new Array('선택','경산역','신경주역','김천구미역'), new Array('선택','마산역','밀양역','진영역','진주역','창원역','창원중앙역'));

			var temp, i=0, j=0;
			var cselect;

			function getClass(item) {
			temp = document.getElementById("s_class");
			subCnt = temp.options.length;
				for (i=(subCnt-1); i>0; i--) { temp.options[i] = null }
					for (var j=0; j<classG[item].length; j++) {
						cselect = classG[item][j];
						temp.options[j] = new Option(cselect, cselect)
					}
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
				 mapp.put("서울역", "서울특별시 용산구 한강대로 405 서울역");
				 mapp.put("영등포역", "서울특별시 영등포구 경인로102길 13 영등포역");
				 mapp.put("용산역","서울특별시 용산구 한강대로23길 55 용산민자역사");
				 mapp.put("광명역","경기도 광명시 광명역로 21 광명역");
				 mapp.put("수원역","경기도 수원시 팔달구 덕영대로 924 수원역");
				 mapp.put("행신역","경기도 고양시 덕양구 소원로 114");
				 mapp.put("검암역","인천광역시 서구 검바위로 26");
				 mapp.put("인천공항역","인천 중구 공항로 271 인천국제공항역");
				 mapp.put("대전역","대전 동구 중앙로 지하 218");
				 mapp.put("서대전역","대전광역시 중구 오류로 23 서대전역");
				 mapp.put("동대구역","대구광역시 동구 동대구로 550 동대구역");
				 mapp.put("광주송정역","광주광역시 광산구 상무대로 201 광주송정역");
				 mapp.put("포항역","경상북도 포항시 북구 흥해읍 포항역로 1");
				 mapp.put("울산역","울산광역시 울주군 삼남면 울산역로 177 울산역");
				 mapp.put("구포역","부산광역시 북구 구포만세길 82");
				 mapp.put("부산역","부산 동구 초량동 1187-21");
				 mapp.put("오송역","충청북도 청주시 흥덕구 오송읍 오송가락로 123 오송역");
				 mapp.put("계룡역","충청남도 계룡시 두마면 팥거리로 95");
				 mapp.put("공주역","충청남도 공주시 이인면 새빛로 100 공주역");
				 mapp.put("논산역","충청남도 논산시 해월로 236-13");
				 mapp.put("천안아산역","충청남도 아산시 배방읍 희망로 100 천안아산역");
				 mapp.put("남원역","전라북도 남원시 교룡로 71");
				 mapp.put("익산역","전라북도 익산시 익산대로 153 익산역");
				 mapp.put("전주역","전라북도 전주시 덕진구 동부대로 680 전주역");
				 mapp.put("정읍역","전라북도 정읍시 서부산업도로 305 정읍KTX역");
				 mapp.put("곡성역","전라남도 곡성군 곡성읍 곡성로 920");
				 mapp.put("구례구역","전라남도 순천시 황전면 섬진강로 217 역사");
				 mapp.put("나주역","전라남도 나주시 나주역길 56");
				 mapp.put("목포역","전라남도 목포시 영산로 98");
				 mapp.put("순천역","전라남도 순천시 팔마로 135 순천역");
				 mapp.put("여수엑스포역","전라남도 여수시 망양로 2 여수역");
				 mapp.put("여천역","전라남도 여수시 시청로 200 여천역");
				 mapp.put("경산역","경상북도 경산시 중앙로 1");
				 mapp.put("신경주역","경상북도 경주시 건천읍 신경주역로 80 신경주역");
				 mapp.put("김천구미역","경북 김천시 남면 혁신1로 51");
				 mapp.put("마산역","경상남도 창원시 마산회원구 마산역광장로 18 마산역");
				 mapp.put("밀양역","경상남도 밀양시 중앙로 62");
				 mapp.put("진영역","경상남도 김해시 진영읍 김해대로 809");
				 mapp.put("진주역","경상남도 진주시 개양로116번길 33 진주역");
				 mapp.put("창원역","경상남도 창원시 의창구 의창대로 67 창원역");
				 mapp.put("창원중앙역","경상남도 창원시 의창구 상남로 381 창원중앙역");
			 
				function testtest(address){
					geocoder.addr2coord(mapp.get(address),function(status, result) {
						
						document.frm.s_address.value = mapp.get(address);
						
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
										content : '<div style="width:150px;text-align:center;padding:6px 0;">출발지</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
					
				}

			</script>
		
		<script language="javascript">
		 
// 		 출발지 설정
			function endplace() {
				document.getElementById("godseul").onchange = function() {getDlass(this.form.godseul.options.selectedIndex); };
				document.getElementById("godjin").onchange = function(){ testTest(this.form.godjin.options[this.form.godjin.selectedIndex].value);}
			}

			var classG = [['지역을 선택하세요'],['선택', '서울역', '영등포역', '용산역'], ['선택','광명역','수원역','행신역'],
					['선택', '검암역', '인천공항역'],['선택','대전역','서대전역'],['선택','동대구역'],
					['선택','광주송정역'],['선택','포항역'],['선택','울산역'],
					['선택','구포역','부산역'], ['선택','오송역'], ['선택','계룡역','공주역','논산역','천안아산역'],
					['선택','남원역','익산역','전주역','정읍역'], ['선택','곡성역','구례구역','나주역','목포역','순천역','여수엑스포역','여천역'],
					['선택','경산역','신경주역','김천구미역'], ['선택','마산역','밀양역','진영역','진주역','창원역','창원중앙역']];
			var temp, i=0, j=0;
			var cselect;

			function getDlass(item) {
			temp = document.getElementById("godjin");
			subCnt = temp.options.length;
				for (i=(subCnt-1); i>0; i--) { temp.options[i] = null }
					for (var j=0; j<classG[item].length; j++) {
						cselect = classG[item][j];
						temp.options[j] = new Option(cselect, cselect)
					}
			}
			
				function testTest(address){
					geocoder.addr2coord(mapp.get(address),function(status, result) {

						document.frm.r_address.value = mapp.get(address);
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
										content : '<div style="width:150px;text-align:center;padding:6px 0;">목적지</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
					
				}

			</script>

<title>Insert title here</title>

</head>
<body>

<br/><br/>
<FORM name='frm' method='POST' action='./create'>
<input type="hidden" name="s_point">
<input type="hidden" name="r_point">
<input type="hidden" name="s_address" value="">
<input type="hidden" name="r_address" value="">
<input type="hidden" name="s_date" value = "">
<section>
		<div>
			<div>
					<header>
						<h1>
							<a>KTX카풀 등록하기</a>
						</h1>
					</header>
					<!-- KTX카풀등록 -->
					<div>

						<!-- 2단계 -->
						<div>

							<dl>
								<div>목적</div>

								<dd>
									<select name="purpose">
										<option value="출퇴근">출퇴근</option>
										<option value="통학">통학</option>
										<option value="출장">출장</option>
										<option value="명절">명절(추석,설)</option>
										<option value="고향">고향</option>
										<option value="여행">여행</option>
										<option value="페스티벌">페스티벌</option>
										<option value="스키">스키</option>
										<option value="레저">레저</option>
										<option value="기타">기타</option>
									</select>
								</dd>
							</dl>
							<!-- 지도-->

							<div id="map" style="width: 500px; height: 400px; float: right; margin-right: 10px;"></div>
							<script type="text/javascript"
								src="//apis.daum.net/maps/maps3.js?apikey=41d86ccb9402e0d73f8db0b0d300991d&libraries=services"></script>
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

								
							</script>

							<!-- 지도 끝 -->

							<dl>

								<dt>
									<div>출발지</div>
								</dt>

								<dd>
									<p>출발역을 선택해주세요.</p>
									<!-- 시, 도 선택 -->
									<select id="b_class">	
										<option value="">선택</option>								
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
										<option value="포항">포항</option>
										<option value="울산">울산</option>
										<option value="부산">부산</option>
										<option value="충북">충북</option>
										<option value="충남">충남</option>
										<option value="전북">전북</option>
										<option value="전남">전남</option>
										<option value="경북">경북</option>
										<option value="경남">경남</option>
									</select>

									<!-- 역 선택 -->
									<select name = s_point id="s_class">
										<option value="">--선택--</option>
									</select>
								</dd>
							</dl>
							<dl>
								<dt>
									<div>도착지</div>
								</dt>
								<!--
							-->
								<dd>
									<p>도착역을 선택해주세요.</p>
									<!-- 시, 도 선택 -->
									<select id="godseul">	
										<option value="">선택</option>								
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
										<option value="포항">포항</option>
										<option value="울산">울산</option>
										<option value="부산">부산</option>
										<option value="충북">충북</option>
										<option value="충남">충남</option>
										<option value="전북">전북</option>
										<option value="전남">전남</option>
										<option value="경북">경북</option>
										<option value="경남">경남</option>
									</select>


									<!-- 역 선택 -->
									<select name = r_point id="godjin">
										<option value="">--선택--</option>
									</select>
								</dd>
							</dl>
						</div>
					</div>



					<dl>
						<dt>
							<div>출발일시</div>
						</dt>
						<!--
							-->
						<dd>
							<p>출발날짜와 시간을 선택해주세요.</p>
							<div id="calenderS" class="calShadow">
								<img src="../images/cld.png" alt="날짜" width="25px"
									height="30px">
									<input name ="start_date" type="text" id="calendar">		
							</div>


							
							<br/>
							<!--시간 -->
							<select name="start_hour" title="출발 시간 선택" id="selKtxRegHour">
								<option value="01">1시</option>
								<option value="02">2시</option>
								<option value="03">3시</option>
								<option value="04">4시</option>
								<option value="05">5시</option>
								<option value="06">6시</option>
								<option value="07">7시</option>
								<option value="08">8시</option>
								<option value="09">9시</option>
								<option value="10">10시</option>
								<option value="11">11시</option>
								<option value="12">12시</option>
								<option value="13">13시</option>
								<option value="14">14시</option>
								<option value="15">15시</option>
								<option value="16">16시</option>
								<option value="17">17시</option>
								<option value="18">18시</option>
								<option value="19">19시</option>
								<option value="20">20시</option>
								<option value="21">21시</option>
								<option value="22">22시</option>
								<option value="23">23시</option>
								<option value="24">24시</option>
								
							</select>
						</dd>
					</dl>
					<dl>
						<dt>
							<div>인원</div>
						</dt>
						<!--
							-->
						<dd>
							<p>KTX풀을 함께 이용할 인원을 선택해주세요.</p>
							<!-- 인원 -->
							<!-- 하단 직접입력 선택시 활성화 -->
							<select name="seat">
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>			
							</select>
						
							
						</dd>
					</dl>
					<dl>
						<dt>
							<div>금액</div>
						</dt>
						<!--
							-->
						<dd>
							<div>
								<div>
									<input type="text" name="price" value="" title="1인당 금액 입력"
										size="10" maxlength="7" > 원/ 인당
								</div>
								<p class="txt_add">
									<span>●</span>1인당 이용금액을 입력해주세요.
								</p>
							</div>
						</dd>
					</dl>
					<dl>
						<dt>
							<div>추가내용</div>
						</dt>
						<!--
							-->
						<dd>
							<p>추가적으로 더할 내용을 입력해주세요.</p>
							<textarea name = "content" cols="70" rows="20">
인사말 : 
결제여부 : 
연락처(전화번호,카톡):
기타내용 : 
								</textarea>
						</dd>
					</dl>
			</div>
	
		</div>
</section>
<br/>
		<div class="bottom">
			<input type='submit' value='등록'>
   			<input type='button' value='취소' onclick="history.back()">
		</div>

</form>

</body>
</html>