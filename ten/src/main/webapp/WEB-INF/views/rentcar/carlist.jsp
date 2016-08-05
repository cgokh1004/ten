<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function read(carno){
	var url = "read";
	url += "?carno="+carno;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	
	location.href=url;
}
function regist(){
	var url = "regist";
	
	location.href=url;
}
</script>
</head>
<body>

<div class="title">등록차량 일람</div>

<div class="search">
<form method="POST" action="./carlist">
	<select name="col">
		<option value="carno"
		<c:if test="${col=='carno' }">selected</c:if>
		>자동차번호</option>
		<option value="brand"
		<c:if test="${col=='brand' }">selected</c:if>
		>차종</option>
		<option value="place"
		<c:if test="${col=='place' }">selected</c:if>
		>차고지</option>
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">
</form>
</div>
<table class='table'>
	<tr>
		<th>사진</th>
		<th>자동차번호</th>
		<th>차고지</th>
		<th>기본요금</th>
		<th>차종</th>
		<th>유종</th>
		<th>최대인원</th>
		<th>예약가부</th>
		<th>수정 및 삭제</th>
	</tr>
<c:choose>
<c:when test="${empty carlist}">
	<tr>
		<td colspan="8" align="center">동록된 글이 없습니다.</td>
	</tr>
</c:when>
<c:otherwise>
	<c:forEach items="${carlist }" var="dto">
	 <tr>
	 	<td><img style="width:150px; height: 150px;"  src="../storage/${dto.filename }"></td>
	 	<td><a href="javascript:read('${dto.carno }')">${dto.carno }</a></td>
	 	<td>${dto.place }</td>
	 	<td>${dto.dprice }</td>
	 	<td>${dto.brand }</td>
	 	<td>${dto.oil }</td>
	 	<td>${dto.howmany }</td>
	 	<c:choose>
	 		<c:when test="${dto.state eq 1 }">
	 			<td>예약가능</td>
	 		</c:when>
	 		<c:otherwise>
	 			<td>예약불가</td>
	 		</c:otherwise>
	 	</c:choose>
		<td><a href="./update?carno=${dto.carno }">수정</a>/
		<a href="./delete?carno=${dto.carno }">삭제</a></td>
	</tr>
	</c:forEach>
</c:otherwise>
</c:choose>
</table>
<div class='bottom'>
	${paging }
	<input type="button" value='등록' onclick="location.href='regist'">
</div>
</body>
</html>