<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name='frm' method='post' action='regist' enctype="multipart/form-data">
<TABLE align="center">
	<tr>
      <th>사진</th>
      <td><input type="file" name="filenameMF" value=""></td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>차종</th>
    	<td><input type="text" name="brand"></td>
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
      <TD><input type="text" name="howmany"></TD>
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
    	<th>차량등록번호</th>
    	<td><input type="text" name="carno"></td>
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    	<th>기본요금</th>
    	<td><input type="text" name="dprice"></td> 
    </tr>
    <tr><td colspan="4">
    <hr>
    </td>
    </tr>
    <tr>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd"></td>
 </TABLE>
 
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
 </form>
</body>
</html>