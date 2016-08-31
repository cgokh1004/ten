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
#mywrite {
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
					value="${word}"  size="10" maxlength="100" placeholder="부산"
					style="border: none; border: 1px solid #d8d8d8; width: 20%; height: 35px">
		
			<input style="height: 35px;width: 50px" type="submit" name="" value="검색" title="검색">
		</div>
	</form>
	<br>
<table id="list" style="border: 1px solid gray;width: 70%;background-color: white;
	Border-collapse: collapse" align="center">
		<tr >
			<th style="width: 7%;border:1px solid gray">프로필</th>
			<th style="width: 7%;border:1px solid gray">인증단계</th>
			<th style="width: 20%;border:1px solid gray">출발</th>
			<th style="width: 20%;border:1px solid gray">도착</th>
			<th style="width: 12%;border:1px solid gray">유형</th>
			<th style="width: 9%;border:1px solid gray">자리/금액</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<TR>
					<TD colspan="8" align="center">등록된 글이 없습니다.</TD>
				</TR>
			</c:when>
			<c:otherwise>
		<c:forEach items="${list}" var="carpoolDTO">
		<tr onclick="read('${carpoolDTO.carpoolno}')" style="cursor: pointer;">
			<td style="text-align: center"><img alt="photo"
				src="${pageContext.request.contextPath}/storage/${carpoolDTO.memberDTO.mfile}"
				width="100%"><br>${carpoolDTO.memberDTO.name}</td>
			<td style="text-align: center">
			<span style="font-weight: bolder;">${carpoolDTO.memberDTO.certi_num}단계</span><br>
			<c:if test="${carpoolDTO.memberDTO.phone_certi==1}">휴대폰번호<br></c:if>
			<c:if test="${carpoolDTO.memberDTO.addr_certi==1}">주소<br></c:if>
			<c:if test="${carpoolDTO.memberDTO.sns_certi==1}">SNS<br></c:if>
			<c:if test="${carpoolDTO.memberDTO.mail_certi==1}">E-mail<br></c:if>
			<c:if test="${carpoolDTO.memberDTO.passport_certi==1}">여권<br></c:if>
			</td>			
			<td style="text-align: left">${carpoolDTO.c_start}<br>${carpoolDTO.startdate.substring(0,16)}</td>
			<td style="text-align: left">${carpoolDTO.c_end}</td>
			<td style="text-align: left">${carpoolDTO.c_type}<br>${carpoolDTO.kind}</td>
			<td style="text-align: left">${carpoolDTO.seat}자리/<br>${carpoolDTO.price}원/인당</td>
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