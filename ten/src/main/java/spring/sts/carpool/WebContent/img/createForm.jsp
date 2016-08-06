<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function input(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}

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
		var file = frm.filename.value;
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
		switch(fileExt){
		case "jpg":
		break;
		case "png":
		break;
		case "gif":
		break;
		case"jpeg":
		break;
		case "bmp":
		break;
		
		default:
			alert("JPG,JPEG,GIF,PNG,BMP파일로 올려주세요");
		 return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
		
		f.submit(); 
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<form name="frm" action="createProc.jsp" method="post" 
	 	  enctype="multipart/form-data"
		  onsubmit="return input(this)">
		<div class="title">게시물 등록</div>
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" maxlength="6" name="wname"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" maxlength="16" name="title" size="50%">

				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="50" maxlength="33" name="content"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="filename">
			</tr>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd" placeholder="1234"
					maxlength="15"></TD>
			</TR>
		</table>

		<div class="bottom">
			<input type="submit" value="등록">&emsp;&emsp;<input
				type="button" value="목록" onclick="location.href='list.jsp'">
		</div>


	</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>