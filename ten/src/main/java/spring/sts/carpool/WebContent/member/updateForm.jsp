<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="member.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
if(id==null){
	id=(String)session.getAttribute("id");
}
MemberDTO dto=dao.read(id);

if(id==null){
	id=(String)session.getAttribute("id");
}
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 20px; 
} 
</style>  
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript"> 
  // 입력 값 검사후 서버로 전송 
  
	function input(f) {
		var f = document.frm; // <FORM>태그 객체 
		if (f.email.value == "") {
			return true;
		} else {
			if (f.eclick.value == 0) {
				alert("이메일 중복체크를 해주세요");
				f.emailclick.focus();
				return false;
			}
		}

		function emailCheck(email) {
			if (email == "") {
				window.alert("이메일을 입력해 주세요.");
				f.email.focus();
			} else {
				url = "./email_proc.jsp?email=" + email; // GET 
				wr = window.open(url, "이메일검색", "width=500,height=400");
				wr.moveTo((window.screen.width - 500) / 2,
						(window.screen.height - 400) / 2);// x, y 
			}
		}
		// Form onsubmit 이벤트일경우 
		// return false; 

		f.submit();
	}

	//중복 이메일을 검사합니다.
</script> 
 
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" />
<!-- *********************************************** -->
 
<DIV class="title">회원 정보 수정</DIV>
 
<FORM name='frm' 
      method='POST' 
      action='./updateProc.jsp'
      onsubmit="return input(this)"> 
      <input type="hidden" name="id" value="<%=dto.getId()%>"> 
  <TABLE class='table' width="80%">
     <tr>  
       <th>*아이디</th> 
       <td> 
           <%=dto.getId() %>
          
               
       </td> 
       <td>아이디입니다.</td> 
     </tr> 

     <tr>  
       <th>*이름</th> 
       <td><%=dto.getMname() %>  </td> 
       <td>회원명입니다.</td> 
     </tr> 
     <tr>  
       <th>전화번호</th> 
       <td><input type="text" name="tel" value="<%=dto.getTel()%>"></td> 
       <td> </td> 
     </tr>           
     <tr>  
       <th>이메일</th> 
       <td> 
           <input type="text" name="email" size="27"  value="<%=dto.getEmail()%>"> 
           <input type="button" name="emailclick" value="Email 중복확인"  
                   onclick="javascript:emailCheck(document.frm.email.value)"> 
        
       </td> 
       <td>이메일을 적어주세요.</td> 
     </tr> 
     <tr>   
       <th>우편번호</th> 
       <td> <input type="text" id="sample6_postcode" name="zipcode" size="10" value="<%=dto.getZipcode()%>"> 
            <input type="button" name="btnPost" value="우편번호찾기"  
                  onclick="sample5_execDaumPostcode()"></td> 
       <td>우편번호를 검색 하세요.</td> 
     </tr> 
     <tr>   
       <th>주소</th> 
       <td> 
       <input type="text" name="address1" size="45" id="sample5_address" value="<%=dto.getAddress1()%>"><br/> 
       <input type="text" name="address2" size="45" id="sample6_address2" value="<%=Utility.nullCheck(dto.getAddress2())%>"> 
<div id="map" name="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script src="//apis.daum.net/maps/maps3.js?apikey=b9b392452680977c474f8d914963d551&libraries=services"></script>
				<script>
				    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				        mapOption = {
				            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
				            level: 5 // 지도의 확대 레벨
				        };
				
				    //지도를 미리 생성
				    var map = new daum.maps.Map(mapContainer, mapOption);
				    //주소-좌표 변환 객체를 생성
				    var geocoder = new daum.maps.services.Geocoder();
				    //마커를 미리 생성
				    var marker = new daum.maps.Marker({
				        position: new daum.maps.LatLng(37.537187, 127.005476),
				        map: map
				    });
				
				    function sample5_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = data.address; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수
				                
				                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    fullAddr = data.roadAddress;
				
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    fullAddr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				                if(data.userSelectedType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }
				                  // 우편번호 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
				             // 커서를 상세주소 필드로 이동한다.
				                document.getElementById('sample6_address2').focus();
				                // 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("sample5_address").value = fullAddr;
				                // 주소로 좌표를 검색
				                geocoder.addr2coord(data.address, function(status, result) {
				                    // 정상적으로 검색이 완료됐으면
				                    if (status === daum.maps.services.Status.OK) {
				                        // 해당 주소에 대한 좌표를 받아서
				                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
				                        // 지도를 보여준다.
				                        mapContainer.style.display = "block";
				                        map.relayout();
				                        // 지도 중심을 변경한다.
				                        map.setCenter(coords);
				                        // 마커를 결과값으로 받은 위치로 옮긴다.
				                        marker.setPosition(coords)
				                    }
				                });
				            }
				        }).open();
				    }
</script>
       </td> 
       <td>주소를 적어 주세요.</td> 
     </tr> 
     <tr>   
       <th>직업</th> 
       <td> 
           <select name='job'> 
               <option value="0"selected>선택하세요.</option> 
               <option value="A01">회사원</option> 
               <option value="A03">전산관련직</option> 
               <option value="A05">연구전문직</option> 
               <option value="A07">각종학교학생</option> 
               <option value="A09">일반자영업</option> 
               <option value="A11">공무원</option> 
               <option value="A13">의료인</option> 
               <option value="A15">법조인</option> 
               <option value="A17">종교.언론/예술인</option> 
               <option value="A19">농업</option> 
               <option value="A23">축산업</option> 
               <option value="A25">수산업</option> 
               <option value="A27">광업</option> 
               <option value="A30">주부</option> 
               <option value="A32">무직</option> 
               <option value="A99">기타</option> 
             </select>
             <script type="text/javascript">
             document.frm.job.value='<%=dto.getJob()%>';
             </script> 
         </td> 
       <td>직업을 선택 하세요.</td> 
     </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원수정'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 