<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(tra_no){
	var url = "read";
	url += "?tra_no="+tra_no;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
		
	location.href=url;
}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body>
<DIV class="title">여행지 추천</DIV>

<DIV class="search">
<form method="POST" action="./list">
	<select name="col">
		<option value="title"
		<c:if test="${col=='title'}">selected</c:if>
		>제목</option>
		<option value="content"
		<c:if test="${col=='content'}">selected</c:if>
		>내용</option>
		<option value="location"
		<c:if test="${col=='location'}">selected</c:if>
		>장소</option>
		<option value="total"
		<c:if test="${col=='total'}">selected</c:if>
		>전체출력</option>
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">
</form>
</DIV>
<Br> 
		
<TABLE style ="margin: 0 auto; width: 150 px">
<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan = "8" align="center">등록된 글이 없습니다.</td>
		</tr>	
	</c:when>	
	<c:otherwise>
		<c:forEach items="${list}" var="dto">						
			<TR>
				<td style="width: 20px">${dto.location}</td>
			    <td  colspan="1" style="width: 150px; height: 200px;"><img style="width: 150px; height: 150px; margin: 0 auto" src="../storage/${dto.filename}"></td>    
			    <td colspan="2"><a href="javascript:read('${dto.tra_no}')">${dto.title}</a></td>
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
</html>