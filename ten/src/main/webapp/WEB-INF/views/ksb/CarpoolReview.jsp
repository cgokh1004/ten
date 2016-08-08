<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var cnt=${cnt};
if(cnt==1){
	window.open("about:blank","_self").close();
}
</script>
</head>
<body>
<h2 align="center">별점 평가</h2>
Comment:
<br>
<form action="../carpool_review/create" method="post">
<input type="hidden" name="carpoolno" value="${carpool_reviewDTO.carpoolno}">
<input type="hidden" name="score" value="${carpool_reviewDTO.score}">
<textarea name="content" id="content" rows="12" cols="61" size="1333"
 maxlength="1333" placeholder="내용을 입력해주세요">
</textarea>
<input type="submit" value="평가하기">
</form>
</body>
</html>