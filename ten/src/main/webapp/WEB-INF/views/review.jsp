<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<style type="text/css">
#list{
box-shadow : 2px 2px 10px silver;
}
#reveiw {
background-color:  #afcae4;
}
table tr td{
border-top:1px solid gray;
}
</style>
<script type="text/javascript">
function read(no){
	var url = "carpool/read";
	url = url + "?carpoolno=" + no;
	url = url + "&nowPage=${nowPage}";
	url = url + "&kind1=${kind1}";
	url = url + "&kind2=${kind2}";
	url = url + "&word1=${word1}";
	url = url + "&word2=${word2}";

	location.href = url; //자바스크립트에서 -get 방식- 링크 보내기
}
</script>
</head> 
<body>
<div style="float: left; width: 80%">
	<form method="post" action="/ten/review">
		<div class="search_wrap">
			<select name='col'
				style="border: none; border: 1px solid #d8d8d8; width: 10%; height: 35px">
				<option value=""
				<c:if test="${col==''}">selected</c:if>
				>전체</option>
				<option value="name"
				<c:if test="${col=='name'}">selected</c:if>
				>평가자</option>
				<option value="id"
				<c:if test="${col=='id'}">selected</c:if>
				>아이디</option>
				<option value="score"
				<c:if test="${col=='score'}">selected</c:if>
				>점수</option>
				<option value="content"
				<c:if test="${col=='content'}">selected</c:if>
				>내용</option>
				
			</select>
					<input type="search" name="word"
					value="${word}"  size="10" maxlength="100" 
					style="border: none; border: 1px solid #d8d8d8; width: 55%; height: 35px">
		
			<input style="height: 35px;width: 50px" type="submit" name="" value="검색" title="검색">
		</div>
	</form>
	<br>
<table id="list" style="border: 1px solid gray;width: 70%;background-color: white;
	Border-collapse: collapse" align="center">
		<tr >
			<th style="width: 12%;border:1px solid gray">평가자</th>
			<th style="width: 12%;border:1px solid gray">아이디</th>
			<th style="width: 12%;border:1px solid gray">점수</th>
			<th style="width: 12%;border:1px solid gray">코멘트</th>
			<th style="width: 20%;border:1px solid gray">글 번호</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<TR>
					<TD colspan="8" align="center">등록된 글이 없습니다.</TD>
				</TR>
			</c:when>
			<c:otherwise>
		<c:forEach items="${list}" var="carpool_reviewDTO">
		<tr onclick="read('${carpool_reviewDTO.carpoolno}')" style="cursor: pointer;height: 80px">
			<td style="text-align: center">${carpool_reviewDTO.memberDTO.name}</td>
			<td style="text-align: center">${carpool_reviewDTO.id}</td>			
			<td style="text-align: center">${carpool_reviewDTO.score}</td>
			<td style="text-align: center">${carpool_reviewDTO.content}</td>
			<td style="text-align: center">${carpool_reviewDTO.carpoolno}</td>
		</tr>
		</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
    ${paging}
    </div>
</body>
</html>