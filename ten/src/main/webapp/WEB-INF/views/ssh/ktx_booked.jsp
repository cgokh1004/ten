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

<br/><br/>


<br/>
	<TABLE>
		<TR>
			<TH>예약번호</TH>
			<TH>글 번호</TH>
			<TH>신청자ID</TH>
			<TH>작성자ID</TH>
			<TH>신청좌석</TH>


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
						<TD><a href="javascript:read('${dto.booked_no}')">${dto.booked_no}</a></TD>
						<TD><a href="javascript:read('${dto.booked_no}')">${dto.ktx_no}</a></TD>
						<TD><a href="javascript:read('${dto.booked_no}')">${dto.appli_id}</a></TD>
						<TD><a href="javascript:read('${dto.booked_no}')">${dto.writer_id}</a></TD>
						<TD><a href="javascript:read('${dto.booked_no}')">${dto.appli_seat}</a></TD>
					</TR>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</TABLE>
	<br/>
	<div class='bottom'>
	    ${paging}
    <input type='button' value='목록' onclick="location.href='list'">
	</div>
</body>
</html>