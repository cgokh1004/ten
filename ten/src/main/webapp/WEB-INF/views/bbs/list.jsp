<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(bbsno){
	var url = "read";
	url += "?bbsno="+bbsno;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	
	location.href=url;
	
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<DIV class="title">고객 Q&A</DIV>

<DIV class="search">
<form method="POST" action="list">
	<select name="col">
		<option value="wname"
		<c:if test="${col=='wname'}">selected</c:if>
		>성명</option>
		<option value="title"
		<c:if test="${col=='title'}">selected</c:if>
		>제목</option>
		<option value="content"
		<c:if test="${col=='content'}">selected</c:if>
		>내용</option>
		<option value="total"
		<c:if test="${col=='total'}">selected</c:if>
		>전체출력</option>
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">
</form>
</DIV>
 
<TABLE class='table'>
  <TR>
    <TH>번호</TH>
    <TH>제목</Th>
    <TH>성명</TH>
    <TH>조회수</Th>
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
  	<TD>${dto.bbsno}</TD>
  	<TD>
  	<c:forEach begin="1" end="${dto.indent}">
  	&nbsp;&nbsp;
  	</c:forEach>
  	<c:set var="rcount" value="${util:rcount(dto.bbsno,rdao) }"/>
  	<a href="javascript:read('${dto.bbsno}')">
  	<c:if test="${dto.indent>0 }">[답변]</c:if>
  	${dto.title}
  	<c:if test="${rcount>0 }">
            <span style="color:red;">(${rcount})</span>
    </c:if>
  	</a>  	
  	<c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
  		<img src="../images/new.gif">
  	</c:if>
  	</TD>
  	<TD>${dto.wname}</TD>
  	<TD>${dto.viewcnt}</TD>
  	<TD>${dto.wdate}</TD>
  </TR>
</c:forEach>
</c:otherwise>
</c:choose>
</TABLE> 
<DIV class='bottom'>
    ${paging}
    <input type='button' value='등록' onclick="location.href='create'">
</DIV>
 
</body>
<!-- *********************************************** -->
</html> 

