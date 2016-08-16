<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function use(){
	opener.frm.mail.value='${param.mail}';
	self.close();
	opener.frm.eclick.value=1;
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

<body>

 
<DIV class="title">E-mail 중복확인</DIV>
 <div class="content">
입력된 E-mail:${param.mail}<br><br>

<c:choose>
<c:when test="${cnt==1}">
이미 생성된 E-mail 입니다.<br><br>
</c:when>
<c:otherwise>
사용가능한 E-mail 입니다.<br><br>
<input type='button' value='사용' onclick='use()'>
</c:otherwise>
</c:choose>
 
   </div>
  <DIV class='bottom'>
    <input type="button" value='다시시도' onclick="location.href='email_form'">
    <input type='button' value='닫기' onclick="window.close();">
  </DIV>


</body>

</html> 