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
<script type="text/javascript">
	function read(noticeno){
		var url = "../notice/read";
		url += "?noticeno="+noticeno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
	
	function qqread(qqno){
		var url = "../qquestion/read";
		url += "?qqno="+qqno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
	
	function qread(qno){
		var url = "../question/read";
		url += "?qno="+qno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
	
	function aread(advno){
		var url = "../advise/read";
		url += "?advno="+advno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
</script>
</head>
<body>
<div class = "title">고객센터</div>
<table style = "margin : 0 auto">
	<tr>
		<td colspan="2"><hr></td>
	</tr>
	<tr>
		<th style = "width : 600px"><a href="../notice/list">공지게시판</a></th>
		<th style = "width : 600px"><a href="../qquestion/list">자주 묻는 질문</a></th>
	</tr>
	<tr>
		<td>
			<c:choose>
				<c:when test="${empty list}">
					공지 게시판에 글이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
						<a href="javascript:read('${dto.noticeno}')">${dto.title}</a> <br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${empty qqlist}">
					자주 묻는 질문에 글이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${qqlist}" var="qqdto">
						<a href="javascript:qqread('${qqdto.qqno}')">${qqdto.title}</a> <br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	
	<tr>
		<th style = "width : 600px"><a href="../question/list">문의게시판</a></th>
		<th style = "width : 600px"><a href="../advise/list">건의게시판</a></th>
	</tr>
	<tr>
		<td>
			<c:choose>
				<c:when test="${empty qlist}">
					문의 게시판에 글이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${qlist}" var="qdto">
						<a href="javascript:qread('${qdto.qno}')">${qdto.title}</a> <br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<c:choose>
				<c:when test="${empty alist}">
					건의 게시판에 글이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach items="${alist}" var="adto">
						<a href="javascript:aread('${adto.advno}')">${adto.title}</a> <br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			(株)김현과 아이들<br>
			대표이사 : 김현<br>
			사업자 등록번호 : 284<br>
			주소 : 서울시 종로구 관철동 코아빌딩 5층 3강의장 3-12<br>
			개인정보관리책임자 : GS&YJ <br>
			문의메일 : sola@nosora.com<br>
			업무시간 : 평일 오전 9시 40분~오후 6시 20분(주말,공휴일 휴무)<br>
			Copyright © 2016. All Rights Reserved.
		</td>
	</tr>
</table>
</body>
</html>