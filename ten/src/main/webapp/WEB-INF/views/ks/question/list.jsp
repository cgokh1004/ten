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
	function read(qno){
		var url = "read";
		url += "?qno="+qno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
</script>
</head>
<body>
<div class = "title">문의 게시판</div>
<table style = "margin : 0 auto">
	<tr>
		<td colspan="5" style = "padding-top: 20px; padding-bottom: 20px;"><hr></td>
	</tr>
	<tr>
		<th style = "width : 150px;">번호</th>
		<th style = "width : 550px;">제목</th>
		<th style = "width : 200px;">닉네임</th>
		<th style = "width : 150px;">작성일</th>
		<th style = "width : 150px;">조회수</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<TR>
				<TD colspan='8' align='center'>문의 게시판에 글이 없습니다.</TD>
			</TR>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.qno}</td>
					<td><a href="javascript:read('${dto.qno}')">${dto.title}</a></td>
					<c:choose>
						<c:when test="${empty dto.id}">
							<td>관리자</td>
						</c:when>
						<c:otherwise>
							<td>${dto.id}</td>
						</c:otherwise>
					</c:choose>
					<td>${fn:substring(dto.qdate,0,10)}</td>
					<td>${dto.viewcnt}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
<br>
<div class="search">
		<form action="./list" method="post">
			<select name="col">
				<option value="title"
				${col=='title'} selected
				>제목</option>
				<option value="content"
				${col=='content'} selected
				>내용</option>
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
	<input type = "button" value = "목록" onclick="location.href='../customer/list'">
	<input type = "button" value = "등록" onclick="location.href='./create'">
</div>
</body>
</html>