<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="title">차량 정보 수정</div>
<form name="frm" method="POST" action="update">
	<input type="hidden" name="carno" value="${dto.carno }">
	<input type="hidden" name="col" value="${param.col }">
	<input type="hidden" name="word" value="${param.word }">
	<input type="hidden" name="nowPage" value="${param.nowPage }">
<TABLE align="center">
	<tr>
      <th>사진</th>
      <td><input type="file" name="filename" value="${dto.filename } "></td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>차종</th>
    	<td><input type="text" name="brand" value="${dto.brand }"></td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>차고지</th>
    	<td><select name="place">
    		<option value="서초구지점">서초구지점</option>
	      	<option value="강남구지점">강남구지점</option>
	      	<option value="동작구지점">동작구지점</option>
	      	<option value="양천구지점">양천구지점</option>
	      	<option value="관악구지점">관악구지점</option>
	      	<option value="노원구지점">노원구지점</option>
	      	<option value="도봉구지점">도봉구지점</option>
	      	<option value="영등포구지점">영등포구지점</option>
	      	<option value="송파구지점">송파구지점</option>
	      	<option value="중구지점">중구지점</option>
	      	<option value="종로구지점">종로구지점</option>
      </select>
    	</td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <TR>
      <TH>인승</TH>
      <TD><input type="text" name="howmany" value="${dto.howmany }"></TD>
    </TR>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>유종</th>
    	<td><select name="oil">
    		<option>디젤</option>
    		<option>경유</option>
    	</select>
    	</td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>기본요금</th>
    	<td><input type="text" name="dprice" value="${dto.dprice }"></td> 
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>예약가부</th>
    	<td><select name="state">
    		<option value=1>예약가능</option>
    		<option value=0>예약불가능</option>
    	</select>
    	</td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd"></td>
    </tr>
 </TABLE>
 
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
 </form>
</body>
</html>