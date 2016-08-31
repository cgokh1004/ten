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
#reserving {
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
	<form method="post" action="/ten/reserving">
		<div class="search_wrap">
			<select name='col'
				style="border: none; border: 1px solid #d8d8d8; width: 10%; height: 35px">
				<option value=""
				<c:if test="${col==''}">selected</c:if>
				>전체</option>
				<option value="name"
				<c:if test="${col=='name'}">selected</c:if>
				>글쓴이 이름</option>
				<option value="c_start"
				<c:if test="${col=='c_start'}">selected</c:if>
				>출발지</option>
				<option value="c_end"
				<c:if test="${col=='c_end'}">selected</c:if>
				>목적지</option>
				<option value="type"
				<c:if test="${col=='type'}">selected</c:if>
				>유형</option>
				<option value="kind"
				<c:if test="${col=='kind'}">selected</c:if>
				>종류</option>
				<option value="writer_id"
				<c:if test="${col=='writer_id'}">selected</c:if>
				>글쓴이 아이디</option>
			</select>
					<input type="search" name="word"
					value="${word}"  size="10" maxlength="100" 
					style="border: none; border: 1px solid #d8d8d8; width: 20%; height: 35px">
		
			<input style="height: 35px;width: 50px" type="submit" name="" value="검색" title="검색">
		</div>
	</form>
	<br>
<table id="list" style="border: 1px solid gray;width: 70%;background-color: white;
	Border-collapse: collapse" align="center">
		<tr >
			<th style="width: 12%;border:1px solid gray">글쓴이</th>
			<th style="width: 12%;border:1px solid gray">아이디</th>
			<th style="width: 12%;border:1px solid gray">유형</th>
			<th style="width: 12%;border:1px solid gray">종류</th>
			<th style="width: 20%;border:1px solid gray">출발지</th>
			<th style="width: 20%;border:1px solid gray">목적지</th>
			<th style="width: 7%;border:1px solid gray">신청<br>자리수</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<TR>
					<TD colspan="8" align="center">등록된 글이 없습니다.</TD>
				</TR>
			</c:when>
			<c:otherwise>
		<c:forEach items="${list}" var="carpool_bookedDTO">
		<tr onclick="read('${carpool_bookedDTO.carpoolno}')" style="cursor: pointer;height: 80px">
			<td style="text-align: center">${carpool_bookedDTO.memberDTO.name}</td>
			<td style="text-align: center">${carpool_bookedDTO.writer_id}</td>			
			<td style="text-align: center">${carpool_bookedDTO.type}</td>
			<td style="text-align: center">${carpool_bookedDTO.kind}</td>
			<td style="text-align: center">${carpool_bookedDTO.carpoolDTO.c_start}</td>
			<td style="text-align: center">${carpool_bookedDTO.carpoolDTO.c_end}</td>
			<td style="text-align: center">${carpool_bookedDTO.appli_seat}</td>
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