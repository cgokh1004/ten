<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String tra_no = (String)request.getParameter("tra_no");
	String oldfile = (String)request.getParameter("oldfile");
%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="frm" method="post" action="delete">
	<input type="hidden" name="tra_no" value="<%=tra_no%>">
	<input type="hidden" name="oldfile" value="<%=oldfile%>">
	<br>
	<br>
	<br>
	<div class="content" style="text-align: center">
		<h2>게시물을 삭제합니다.</h2>
	</div>
	<br>

	<div class="bottom" style="text-align: center">	
	
	<input type="submit" value='삭제' style="text-align: center">
	<input type="button" value='취소' onclick="history.back()">
	</div>
</form>


</body>
</html>