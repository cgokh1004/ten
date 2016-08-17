<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
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
 <input type="hidden"	name="col"	value="${param.col}">
<input type="hidden"	name="word"	value="${param.word}">
<input type="hidden"	name="nowPage"	value="${param.nowPage}">
<DIV class="content">
	오류 페이지 입니다.
 	<DIV class='bottom'>
      <input type='button' value='다시 시도' onclick="history.back();">
    </DIV>
</DIV>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 