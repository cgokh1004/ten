<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{
	margin: 0 auto;            /* 테이블 가운데 정렬 */
	border-color: #000000;     /* 테이블 외곽선 색깔 */ 
	border-width: 1px;         /* 테이블 외곽선 두께 */ 
	border-style: solid;       /* 테이블 외곽선 스타일 */
	border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */	
	width: 80%;
	text-align: center;
}
TH{
  border-color: #000000;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color:  #000000;        /* 글자 색 */ 
  background-color: #ffffff; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */
  text-align: center;

}
 
 
td{
  border-color: #000000;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
 
  color: #000000;            /* 글자 색 */ 
  background-color: #ffffff; /* 배경 색 */
  padding: 5px;              /* 셀 내부 간격 */
  text-align: center;
}

section{

  border-color: #c568ec;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  width: 80%;

}

.bottom{
	margin: 20px auto;
  	text-align: center;
 	width: 80%;
  	padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}

</style>

<script type="text/javascript">
function read(ktx_no){
	var url = "read";
	url += "?ktx_no="+ktx_no;

	location.href=url;
	
}
</script>
</head>
<body>

<div class="search">
			<label>출발역</label> <select name="src_key_1" id="tmp_selKtxStartPlace" data-val="">
				<option value="">전체</option>
				<option>서울역</option>
				<option>영등포역</option>
				<option>용산역</option>
				<option>광명역</option>
				<option>수원역</option>
				<option>행신역</option>
				<option>검암역</option>
				<option>인천공항역</option>
				<option>대전역</option>
				<option>서대전역</option>
				<option>동대구역</option>
				<option>광주송정역</option>
				<option>포항역</option>
				<option>울산역</option>
				<option>구포역</option>
				<option>부산역</option>
				<option>오송역</option>
				<option>계룡역</option>
				<option>공주역</option>
				<option>논산역</option>
				<option>천안아산역</option>
				<option>남원역</option>
				<option>익산역</option>
				<option>전주역</option>
				<option>정읍역</option>
				<option>곡성역</option>
				<option>구례구역</option>
				<option>나주역</option>
				<option>목포역</option>
				<option>순천역</option>
				<option>여수엑스포역</option>
				<option>여천역</option>
				<option>경산역</option>
				<option>신경주역</option>
				<option>김천구미역</option>
				<option>마산역</option>
				<option>밀양역</option>
				<option>진영역</option>
				<option>진주역</option>
				<option>창원역</option>
				<option>창원중앙역</option>
			
			</select> <label>도착역</label>		
			<!-- -->
			<select name="src_key_2" id="tmp_selKtxArriPlace" data-val="">
				<option value="">전체</option>
				<option>서울역</option>
				<option>영등포역</option>
				<option>용산역</option>
				<option>광명역</option>
				<option>수원역</option>
				<option>행신역</option>
				<option>검암역</option>
				<option>인천공항역</option>
				<option>대전역</option>
				<option>서대전역</option>
				<option>동대구역</option>
				<option>광주송정역</option>
				<option>포항역</option>
				<option>울산역</option>
				<option>구포역</option>
				<option>부산역</option>
				<option>오송역</option>
				<option>계룡역</option>
				<option>공주역</option>
				<option>논산역</option>
				<option>천안아산역</option>
				<option>남원역</option>
				<option>익산역</option>
				<option>전주역</option>
				<option>정읍역</option>
				<option>곡성역</option>
				<option>구례구역</option>
				<option>나주역</option>
				<option>목포역</option>
				<option>순천역</option>
				<option>여수엑스포역</option>
				<option>여천역</option>
				<option>경산역</option>
				<option>신경주역</option>
				<option>김천구미역</option>
				<option>마산역</option>
				<option>밀양역</option>
				<option>진영역</option>
				<option>진주역</option>
				<option>창원역</option>
				<option>창원중앙역</option>
				
			</select> <input type='button' value='검색'>
		</div>
<br/><br/>


<br/>
	<TABLE>
		<TR>
			<TH>등록번호</TH>
			<TH>작성자ID</TH>
			<TH>출발지</Th>
			<TH>도착지</TH>
			<TH>카풀목적</Th>
			<TH>출발일</TH>
			<TH>잔여좌석</TH>
			<TH>가격</TH>
			<TH>등록일</TH>

		</TR>
		<c:choose>
			<c:when test="${empty list}">
				<TR>
					<TD colspan="8" align="center">등록된 글이 없습니다.</TD>
				</TR>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<TR>
						<TD><a>${dto.ktx_no}</a></TD>
						<TD><a>${dto.id}</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${dto.s_point}</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${dto.r_point}</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${dto.purpose}</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${fn:substring(dto.s_date, 0, 13)}시</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${dto.seat}</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${dto.price}</a></TD>
						<TD><a href="javascript:read('${dto.ktx_no}')">${fn:substring(dto.reg_date, 0 , 16)}</a></TD>
					</TR>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</TABLE>
	<br/>
	<div class='bottom'>
	    ${paging}
    <input type='button' value='등록' onclick="location.href='create'">
	</div>
</body>
</html>