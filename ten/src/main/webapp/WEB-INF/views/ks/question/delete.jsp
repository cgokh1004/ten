<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div class = "title">문의 게시판</div>
<Form name='frm' method='POST' action='./delete'>
<input type = "hidden" name = "qno" value = "${param.qno}">
<table style = "margin : 0 auto">
	<tr>
		<td>확인을 누르면 복구할 수 없습니다.</td>
	</tr>
	<tr>
	<tr>
		<td style = "text-align: center">
			<input type = "submit" value = "확인">
			<input type = "button" value = "목록" onclick="location.href='./list">
			<input type = "button" value = "취소" onclick="history.back()">
		</td>
	</tr>
</table>
</Form>
</body>
</html>