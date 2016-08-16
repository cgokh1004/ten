<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript"> 
	// 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
	var f = document.frm;
    if(f.email.value==""){ 
      alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
      return false; 
    } 
 
    if(f.job.value == "0"){ 
      alert("직업을 선택해 주세요."); 
      f.job.focus(); 
      return false; 
    }
    if(f.email.value=='${dto.email}'){
    	f.eclick.value==1
    }else if(f.eclick.value==0){
  	    	alert("이메일 중복체크를 해주세요"); 
  	        f.emailclick.focus();  
  	        return false;
  				}
  	      } 
 
  // 중복 아이디를 검사합니다. 
  function idCheck(idv){ 
    if(idv == ""){ 
      window.alert("아이디를 입력해 주세요."); 
      document.frm.id.focus(); // 커서 이동 
    }else{ 
      url="./id_proc.do?id=" + idv;  // GET 
      wr = window.open(url,"아이디검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
      //window.open객체를 wr이라는 것으로 참조한 다음에
      //wr이라는 애를 저 x y 좌표로 이동하겠다는 얘기인가 봄
      
    } 
  } 
 
  //중복 이메일을 검사합니다. 
  function emailCheck(email){ 
    if(email == ""){ 
      window.alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
    }else{
      url="./email_proc.do?email=" + email;  // GET 
      wr = window.open(url,"이메일검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    } 
  } 
  
  
	

 
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">회원 수정 (* 필수 입력)</DIV>

	<FORM name='frm' method='POST' action='update'
		onsubmit="return inputCheck()">

		<input type="hidden" name="id" value="${dto.id}">
		<input type="hidden" name="eclick" value=0> 
		<TABLE class='table' width="80%">

			<tr>
				<th>*아이디</th>
				<td>${dto.id }</td>
				<td>아이디 입니다.</td>
			</tr>
			<tr>
				<th>*이름</th>
				<td>${dto.mname}</td>
				<td>고객 이름입니다.</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="${dto.tel}"></td>
				<td></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" size="27"
					value='${dto.email}' onchange="document.frm.eclick.value='0'"> 
					
					
					<input type="button" name="emailclick" value="Email 중복확인"
					onclick="javascript:emailCheck(document.frm.email.value)">

				</td>
				<td>이메일을 적어주세요.</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode" id="sample6_postcode"
					placeholder="${dto.zipcode}"> <input type="button"
					name="btnPost" value="우편번호" onclick="sample6_execDaumPostcode()"></td>
				<td>우편번호를 검색 하세요.</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address1" size="45"
					id="sample6_address" placeholder="${dto.address1}"><br />
					<input type="text" name="address2" size="45" id="sample6_address2"
					placeholder="${dto.address2}"></td>
				<td>주소를 적어 주세요.</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><select name='job'>
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
				</select> <script>
       			document.frm.job.value = '${dto.job}'; 
       			//이렇게 하면 현재 document의 frm form의 job의 값이 선택됨
       		</script></td>
				<td>직업을 선택 하세요.</td>
			</tr>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='회원수정'> <input type='reset'
				value='취소'>
		</DIV>
	</FORM>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>