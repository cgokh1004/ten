<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="spring.model.member.*,java.util.*,spring.utility.blog.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style>
 
<link href='../css/style.css' rel='Stylesheet' type='text/css'> 
 
</head> 
<body> 
 
<DIV class="title">회원 목록</DIV> 
 
<DIV class="content"> 
 
<FORM method="POST" action="list">
<select name="col">
<option value="mname"
<c:if test="${col==mname}">selected='selected'</c:if>
>성명</option>
<option value="email"
<c:if test="${col==email}">selected='selected'</c:if>
>이메일</option>
<option value="id"
  <c:if test="${col==id}">selected='selected'</c:if>
>아이디</option>
<option value="total"
  <c:if test="${col==total}">selected='selected'</c:if>
>전체출력</option>
</select>
<input type="text" name="word" value="${word}">
<input type="submit" value="검색" />
  &emsp;<input type='button' value='회원 등록'  onclick="location.href='../member/create'"> 
</FORM>
</DIV>
 
<c:forEach var="dto" items="${list}">
<TABLE border='1' align='center' width='70%'> 
  
  <TR> 
    <TD rowspan='5' width='20%' align="center">
    <IMG src='../storage/${dto.fname}' width='100%'></TD> 
    <TH width='20%'>아이디</TH> 
    <TD width='60%'><A href='../member/read?id=${dto.id}'>${dto.id}</A></TD>
  </TR>
   
  <TR> 
    <TH>성명</TH> 
    <TD>${dto.mname}</TD> 
  </TR> 
  <TR> 
    <TH>전화번호</TH> 
    <TD>${dto.tel}</TD> 
  </TR> 
  <TR> 
    <TH>이메일</TH> 
    <TD>${dto.email}</TD> 
  </TR> 
  <TR> 
    <TH>주소</TH> 
    <TD>${dto.address1} 
    <c:if test="${not empty dto.address2}">
    ${dto.address2}
    </c:if>        
    </TD> 
  </TR> 
 
</TABLE> 
<BR> 
</c:forEach>
 
<DIV class="bottom"> 
${paging}
</DIV> 
 
 
</body> 
</html> 