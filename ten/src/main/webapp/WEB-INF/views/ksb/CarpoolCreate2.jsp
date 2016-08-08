<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>
$(function(){
  $('.datetimepicker').appendDtpicker({'locale':'ko',defalutDate : new Date() });
});

function InputCheck(){
	if($("#startdate").val()==''){
		alert("출발일시를 입력해주세요")
		$("#startdate").focus()
		return false;
	}
	if($("#seat").val()==''){
		alert("인원수를 입력해주세요")
		$("#seat").focus()
		return false;
	}
	if($.isNumeric($("#seat").val())==false){
		alert("숫자를 입력해주세요")
		$("#seat").focus()
		return false;
	}
	if($("#price").val()==''){
		alert("1인당 금액을 입력해주세요")
		$("#price").focus()
		return false;
	}
	if($.isNumeric($("#price").val())==false){
		alert("숫자를 입력해주세요")
		$("#price").focus()
		return false;
	}
}
</script>
</head>
<body>
<form name="frm" method="post" action="/ten/carpool/create3" onsubmit="return InputCheck()">
	<input type="hidden" name="c_start" value="${carpoolDTO.c_start}">
	<input type="hidden" name="c_startv" value="${carpoolDTO.c_startv}">
	<input type="hidden" name="via" value="${carpoolDTO.via}">
	<input type="hidden" name="viav" value="${carpoolDTO.viav}">
	<input type="hidden" name="c_end" value="${carpoolDTO.c_end}">
	<input type="hidden" name="c_endv" value="${carpoolDTO.c_endv}">
	<input type="hidden" name="c_type" value="${carpoolDTO.c_type}">
	<input type="hidden" name="purpose" value="${carpoolDTO.purpose}">
	<input type="hidden" name="kind" value="${carpoolDTO.kind}">
	<h1>카풀 등록하기</h1>
	<table style="width: 100%;border:1px solid gray;">
	<tr>
	<td>출발일시 : </td>
	<td >
		<input type="text" name='startdate' id='startdate' class='datetimepicker' style="border: 1px solid #d8d8d8; width: 40%; height: 35px">
	</td>
	<td rowspan="5" width="40%" style="padding-left: 100px">
	<div id='map' style="width:300px;height:400px;"></div>
	</td>
	</tr>
	<tr>
	
	<td>
	인원수 : </td>
	<td>
	인원수를 입력해주세요<br><br>
	<input name="seat" id="seat" type="text" size="10" maxlength="10"
	style="border: none; border: 1px solid #d8d8d8; width: 15%; height: 35px">명
	</td>
	</tr>
	<tr>
	<td>금액 : </td>
	<td>
	1인당 편도 금액을 입력해주세요<br><br>
	<input name="price" id="price" type="text" size="10" maxlength="10"
	style="border: none; border: 1px solid #d8d8d8; width: 15%; height: 35px">원/인당
	</td>
	</tr>
	</table>
	<br><div align="center"><input type="button" value="이전" onclick="javascript:history.back()" style="border:1px solid ;width: 200px;height: 35px">
	<input type="submit" value="다음" style="border:1px solid ;width: 200px;height: 35px;margin-left: 60px"></div>
	</form>
</body>
</html>