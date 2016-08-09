<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<script type="text/JavaScript">
	   window.onload=function(){
	   CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
	   };
	</script>
</head>
<body>
	<form name="frm" method="post" action ='update' enctype="multipart/form-data" onsubmit="return input(this)">
	<input type = "hidden" name = "tra_no" value="${param.tra_no}">
	<input type = "hidden" name = "oldfile" value="${param.tra_no}">
	<input type = "hidden" name = "col" value="${param.tra_no}">
	<input type = "hidden" name = "word" value="${param.tra_no}">
	<input type = "hidden" name = "nowPage" value="${param.tra_no}">
		<br>
	<table class="table" align="center">
		<tr>
			<th>제목</th>
			<td><input type="text" maxlength="20" name="title" style="margin: 0 auto"></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name= "fnameMF"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="20" cols="40" placeholder="내용을 입력해주세요"></textarea> </td>
		</tr>
		<tr>
			<th>지역</th>
			<td><input type="text" maxlength="20" name="location" style="margin: 0 auto"></td>
		</tr>	
	</table>
		<br>
	<div class="bottom" align="center">
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="history.back()">
	</div>
	</form>
</body>
</html>