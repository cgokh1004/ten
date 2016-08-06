<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
function InputCheck(){
	if($("#smoke").val()==''){
		alert("차내 흡연 여부를 선택해주세요")
		$("#smoke").focus()
		return false;
	}
}
</script>
</head>
<body>
<form action="/ten/carpool/create" method="post" onsubmit="return InputCheck()">
<input type="hidden" name="c_start" value="${carpoolDTO.c_start}">
	<input type="hidden" name="c_startv" value="${carpoolDTO.c_startv}">
	<input type="hidden" name="via" value="${carpoolDTO.via}">
	<input type="hidden" name="viav" value="${carpoolDTO.viav}">
	<input type="hidden" name="c_end" value="${carpoolDTO.c_end}">
	<input type="hidden" name="c_endv" value="${carpoolDTO.c_endv}">
	<input type="hidden" name="c_type" value="${carpoolDTO.c_type}">
	<input type="hidden" name="purpose" value="${carpoolDTO.purpose}">
	<input type="hidden" name="kind" value="${carpoolDTO.kind}">
	<input type="hidden" name="startdate" value="${carpoolDTO.startdate}">
	<input type="hidden" name="seat" value="${carpoolDTO.seat}">
	<input type="hidden" name="price" value="${carpoolDTO.price}">
<h1>카풀 등록하기</h1>
	<table style="width: 100%;border:1px solid gray;">
	<tr>
	<td>차내흡연여부: </td>
	<td >
	<input name="smoke" id="smoke" type="hidden"> 
		<span id='차내흡연' style="float:left;border: 1px solid gray;width:30%;
		display: inline-block;text-align: center;padding: 5%">
		<img width="200px" alt="흡연" src="${pageContext.request.contextPath}/images/흡연.png"><br><br>차내흡연</span>
		<span id='차내금연' style="float:left;border: 1px solid gray;width:30%;
		display: inline-block;text-align: center;padding: 5%">
		<img width="200px" alt="금연" src="${pageContext.request.contextPath}/images/금연.png"><br><br>차내금연</span>
	</td>
	<td rowspan="5" width="40%" style="padding-left: 100px"><div id='map' style="width:300px;height:400px;"></div>
	</td>
	</tr>
	<tr>
	<td>추가내용 : </td>
	<td>
	<textarea name="c_comment" id="c_comment" rows="12" cols="61" size="1333" maxlength="1333">
	(입력하실 분만 입력해주시면 됩니다.)
차종:

카풀운행주기:

연락처(전화번호,카톡):

기타내용:

	</textarea>
	</td>
	</tr>
	</table>
	<br><div align="center"><input type="button" value="이전" onclick="javascript:history.back()" style="border:1px solid ;width: 200px;height: 35px">
	<input type="submit" value="완료" style="border:1px solid ;width: 200px;height: 35px;margin-left: 60px"></div>
</form>
<!-- 여기 jquery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script> 
<script type="text/javascript">
$("#차내흡연").click(
		function(){$("#차내흡연").css("background-color","#d0d0ff"),$("#차내금연").css("background-color","#eeeeee"),$("#smoke").val("흡연")});
$("#차내금연").click(
		function(){$("#차내금연").css("background-color","#d0d0ff"),$("#차내흡연").css("background-color","#eeeeee"),$("#smoke").val("비흡연")}
		);
</script>
</body>
</html>