<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건의 게시판</title>
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
		padding-left: 350px;
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
</head>
<body>
<div class = "title">건의 게시판</div>
<Form name='frm' method='POST' action='./create'>
<input type = "hidden" name = "id" value = "user1">
<table style = "margin : 0 auto">
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<th style = "width : 50px">제목</th>
		<td style = "width : 900px"><input type = "text" name = "title" size = "100%"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea style = "width : 100%; height : 300px;" name = "content"></textarea></td>
	</tr>
	<tr>
	<tr>
		<td colspan="2" style = "text-align: center">
			<input type = "submit" value = "등록">
			<input type = "button" value = "목록" onclick="location.href='./list'">
			<input type = "button" value = "취소" onclick="history.back()">
		</td>
	</tr>
</table>
</Form>
</body>
</html>