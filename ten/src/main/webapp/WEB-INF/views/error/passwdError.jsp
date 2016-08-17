<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function listB(){
	var url="list";
	url+="?col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;

}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
}
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<DIV class="content">
	비밀번호 오류입니다.
 	<DIV class='bottom'>
      <input type='button' value='다시 시도' onclick="history.back();">       
      <input type='button' value='목록' onclick="listB()">
    </DIV>
</DIV>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 