<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function input(f) {
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.filename.value == "") {
			alert("이미지를 올려주세요");
			f.filename.focus();
			return false;
		}
		
		if (f.location.value == "") {
			alert("지역을 입력하세요");
			f.wname.focus();
			return false;
		}
		
		var file = frm.filename.value;
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
		if(fileExt!=="jpg"&&"png"&&"gif"&&"jpeg"&&"bmp"){
			alert("JPG,JPEG,GIF,PNG,BMP파일로 올려주세요");
		 return false;
		}
		
		f.submit(); 
	}
</script>

	
	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	 <script type="text/JavaScript">
	   window.onload=function(){
	   CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
	   };
	 </script>

</head>
	<DIV class="title">등록</DIV>
<body>
	<form name="frm" method="post" action ='create' enctype="multipart/form-data">
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
		<input type="submit" value="등록">
	</div>
	</form>
</body>
</html>