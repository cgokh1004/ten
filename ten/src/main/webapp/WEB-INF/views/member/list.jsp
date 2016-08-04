<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		padding-bottom: 15px;
	}
	.search {
		text-align: center;
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
<script type="text/javascript">
	function read(id){
		var url = "read";
		url += "?id="+id;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
</script>
</head>
<body>
<div class = "title">회원 리스트</div>
<table style = "margin : 0 auto">
	<tr>
		<td colspan="5" style = "padding-top: 20px; padding-bottom: 20px;"><hr></td>
	</tr>
	<tr>
		<th style = "width : 150px;">아이디</th>
		<th style = "width : 550px;">이름</th>
		<th style = "width : 150px;">회원종류</th>
		<th style = "width : 150px;">인증갯수</th>
		<th style = "width : 150px;">사진</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<TR>
				<TD colspan='8' align='center'>가입된 회원 정보가 없습니다.</TD>
			</TR>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.id}</td>
					<td><a href="javascript:read('${dto.id}')">${dto.name}</a></td>
					<td>${dto.mem_type}</td>
					<td>${dto.certi_num}</td>
					<td>${dto.mfile}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<br>
<div class="search">
		<form action="./list" method="post">
			<select name="col">
				<option value="id"
				${col=='id'} selected
				>아이디</option>
				<option value="total"
				${col=='total'} selected
				>전체출력</option>
			</select>
			<input type="text" name="word" value="${word}">
			<input type="submit" value="검색">
		</form>
	</div> <br>
<div style = "text-align: center;">${paging}</div><br>
<div style="text-align: center;">
	<input type = "button" value = "목록" onclick="location.href='./member/list'">
</div>
</body>
</html>