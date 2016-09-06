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

		else if (f.location.value == "") {
			alert("지역을 입력하세요");
			f.location.focus();
			return false;
		}

		else if (f.fnameMF.value == "") {
			alert("이미지를 올려주세요");
			f.fnameMF.focus();
			return false;
		}
		
		
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
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
	<DIV style="color: gray; text-align: center">등록</DIV>
	<br>
	<hr style="width: 60%">
<body>
	<form name="frm" method="post" action ='create' onsubmit="return input(this)" enctype="multipart/form-data">
		<br>
	<table class="table" align="center">
		<tr>
			<th><fieldset style="border-color: red; border-style: solid;">제목</fieldset></th>
			<td><input type="text" maxlength="20" name="title" style="margin: 0 auto"></td>
		</tr>
		<TR>
			<td>
				<hr style="width: 100%">
			</td>
		</TR>	
		<tr>
			<th><fieldset style="border-style: solid;">지역</fieldset></th>
			<td><input type="text" maxlength="20" name="location" style="margin: 0 auto"></td>
		</tr>
		<TR>
			<td>
				<hr style="width: 100%">
			</td>
		</TR>	
		<tr>
			<th><fieldset style="border-color: red; border-style: solid;">대표사진</fieldset></th>
			<td><input type="file" name= "fnameMF"></td>
		</tr>
		<TR>
			<td>
				<hr style="width: 100%">
			</td>
		</TR>	
		<tr>
			<th><fieldset style="border-style: solid;">내용</fieldset></th>
			<td><textarea name="content" rows="20" cols="40" placeholder="내용을 입력해주세요" value=""></textarea> </td>
		</tr>
	</table>
		<br>
	<div class="bottom" align="center">
		<input type="submit" value="등록">
		<input type="button" onclick="history.back()" value="목록으로">
	</div>
	</form>
</body>
</html>