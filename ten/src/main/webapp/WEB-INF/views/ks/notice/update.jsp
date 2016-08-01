<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td {
		text-align: left;
		padding-left: 15px;
		margin: 15px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	hr {
		border : solid 2px #4ABFD3;
	}
	th {
		font-size: 18px;
		text-align: left;
		padding-left: 15px;
		margin-bottom: 15px;
		margin-top: 15px;
	}
	.title {
		color : #4ABFD3;
		text-align: left;
		font-weight: bold;
		font-size: 21px;
		font-family: 굴림;
		padding-left: 250px;
		padding-top: 20px;
	}
	a:link{
		color : black;
		text-decoration: none;
	}
	a:VISITED {
		color : black;
		text-decoration: none;
	}
	a:HOVER {
		color : red;
		text-decoration: none;
	}
</style>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	$(document).ready(function() {
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function(e) {
					$('#original').attr('src', e.target.result); //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]);//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}

		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#imgname").change(function() {
			//alert(this.value); //선택한 이미지 경로 표시
			readURL(this);
		});
	});
</script>
</head>
<body>
<div class = "title">공지 게시판</div>
<FORM name='frm' method='POST' action='./update'
		enctype="multipart/form-data"
		onclick="return fileCheck()">
		<input type = "hidden" name = "noticeno" value = "${dto.noticeno}">
		<input type = "hidden" name = "oldfile" value = "${param.oldfile}">
<table style = "margin : 0 auto">
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<th style = "width : 50px">제목</th>
		<td style = "width : 900px"><input type = "text" size = "100%" name = "title" value = "${dto.title}"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea style = "width : 100%; height : 350px;" name = "content">${dto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input class="button1" type='file' name='imgnameMF'
				id="imgname" value='' onchange="imageChange(this)"> <br>
			<c:choose>
				<c:when test="${dto.imgname!='noimg'}">
			<br>
				<img onerror="this.src='../images/ks/${dto.imgname}'" id="original"
				src="#" width="100%" height="350" border="0"><br>
				</c:when>
				<c:otherwise>
					<img onerror="this.src='../images/ks/image.jpg'" id="original"
					src="#" width="100%" height="350" border="0"><br>
				</c:otherwise>
			</c:choose>
			<br> <font color="red">* 사진은 jpg, png로 올려주세요.</font>
		</td>
	</tr>
	<tr>
		<td colspan="2" style = "text-align: center">
			<input type = "submit" value = "등록" onclick="location.href='./create'">
			<input type = "button" value = "목록" onclick="location.href='./list'">
			<input type = "button" value = "취소" onclick="history.back()">
		</td>
	</tr>
</table>
</Form>
</body>
</html>