<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
#list{
box-shadow : 2px 2px 10px silver;
}
table tr td{
border-top:1px solid gray;
}
</style>
<script type="text/javascript">
function read(no){
	var url = "read";
	url = url + "?carpoolno=" + no;
	url = url + "&nowPage=${nowPage}";
	url = url + "&kind1=${kind1}";
	url = url + "&kind2=${kind2}";
	url = url + "&word1=${word1}";
	url = url + "&word2=${word2}";
	//띄어쓰기 주의 -_-) ? memo = (x) ?memo= (o)
	location.href = url; //자바스크립트에서 -get 방식- 링크 보내기
}
</script>
</head>
<body>
	<div style="float: left; width: 80%">
	<form method="post" action="/ten/carpool/list">
		<div class="search_wrap">
			<select name='kind1'
				style="border: none; border: 1px solid #d8d8d8; width: 10%; height: 35px">
				<option value="total"
				<c:if test="${kind1=='total'}">selected</c:if>
				>전체</option>
				<option value="regularly"
				<c:if test="${kind1=='regularly'}">selected</c:if>
				>정기 카풀</option>
				<option value="short"
				<c:if test="${kind1=='short'}">selected</c:if>
				>단기 카풀</option>
				<option value="woman"
				<c:if test="${kind1=='woman'}">selected</c:if>
				>여성전용 카풀</option>
			</select>
			<select name='kind2'
				style="border: none; border: 1px solid #d8d8d8; width: 10%; height: 35px">
				<option value="total"
				<c:if test="${kind2=='total'}">selected</c:if>
				>전체</option>
				<option value="take_it"
				<c:if test="${kind2=='take_it'}">selected</c:if>
				>타세요</option>
				<option value="plz_ride"
				<c:if test="${kind2=='plz_ride'}">selected</c:if>
				>태워주세요</option>
			</select>
		
				<img src="${pageContext.request.contextPath}/images/ico_start.gif" title="출발지" alt="출발지" width="12px"
					height="20px"> 
					<input type="search" name="word1"
					value="${word1}" title="출발지를 입력해주세요" size="10" maxlength="100"
					placeholder="서울"
					style="border: none; border: 1px solid #d8d8d8; width: 20%; height: 35px">
				<img src="${pageContext.request.contextPath}/images/ico_arrival.gif" title="도착지" alt="도착지" width="12px"
					height="20px"> 
					<input type="search" name="word2"
					value="${word2}" title="도착지를 입력해주세요" size="10" maxlength="100"
					placeholder="부산"
					style="border: none; border: 1px solid #d8d8d8; width: 20%; height: 35px">
		
			<input style="height: 35px;width: 50px" type="submit" name="" value="검색" title="검색">
			<input style="border: 0px solid; background-color: #ffcf0f;border-radius:5px;width: 120px;height: 35px;
			box-shadow: 1px 2px 1px #b1b5ba;margin-left: 30px" type="button"  onclick="self.location='/ten/carpool/create1'" value="등록하기">
		</div>
	</form>
		
	<br>
	<table id="list" style="border: 1px solid gray;width: 100%;background-color: white;
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
		<tr onclick="read(${carpoolDTO.carpoolno})" style="cursor: pointer;">
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
	<table style="float: left;margin-left: 100px">
		<tr>
			<td style="border: 1px solid">
				운전자리스트
			</td>
		</tr>
		<tr>
			<td style="border: 1px solid">
				지역별 <br>글 리스트
			</td>
		</tr>
	</table>
</body>
</html>