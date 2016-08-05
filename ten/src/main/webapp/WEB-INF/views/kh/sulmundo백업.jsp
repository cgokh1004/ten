<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문하기</title>
<script type="text/javascript">

	// function save(f) {
	// 	alert("클릭하시면 제출이 됩니다?");
	// 	f.document.focus();
	// 	return false;
	// }
   function save(f){
	  /* confirm(문자열, 초기값) */
	  var check = confirm("확인 버튼을 누르면 제출이 됩니다. 제출취소는 취소 버튼을 누르세요");
	  /* if(check == true) else false */
	  if(check) alert("제출했습니다. 확인 버튼을 누르시고, 하단 돌아가기 버튼을 누르세요");
	  else alert("제출 취소되었습니다. ");
	}

</script>
</head>
<body> 
            <h1 >리서치 작성이 시작됩니다.</h1>
			<h2>
				<p>본 리서치는 저희 회사에 대한 것이며, 본 리서치결과는 상업적인 목적으로 사용하지 않으며</p>
				<p>기업 마케팅에만 적용되어 고객들에게 더 나은 서비스를 위해 시행하는 것입니다.</p>
			</h2>
                  
            <TR>
      
      <TD >설문제목: &nbsp;
			      <select name="sulgroupname" style="width: 10%"  >
					<option value="0"	>=선택=</option>
					<option value="1"	>친목</option>
					<option value="2"	>독서</option>
					<option value="3"	>건강</option>
					<option value="4"	>가정</option>
					<option value="5"	>직장</option>
			    </select>
      
      
      </TD></TR> 
    
      <TR>
      
      <TR>
     
      <TD >진행상태: &nbsp;
                 <select name="sulstate" style="width: 10%"  >
					<option value="0"	>=선택=</option>
					<option value="1"	>진행</option>
					<option value="2"	>완료</option>
				</select>	
            
      </TD></TR> 
      

</body>
</html>