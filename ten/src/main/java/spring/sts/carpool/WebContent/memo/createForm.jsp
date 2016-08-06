<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-family: gulim;
		font-size: 24px;
	}
</style>
<link href="../css/style.css" rel="stylesheet">
<script type="text/javascript">
function input(f){
	if(f.title.value == ""){
		alert("제목을 입력해주세요");
		f.title.focus();		
		return false;
	}

	if(f.content.value==""){
		alert("내용을 써주세요");
		f.content.focus();
		return false;
		
	}
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<DIV class="title"> 등록 </DIV>
	
	<form name="frm" method="POST" action="./createProc.jsp" onsubmit="return input(this)">
		<table>
			<tr>
				<th>제목</th>
				<td><input type = 'text' name = 'title' size = '30' placeholder= '제목'></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea name = 'content' rows = '10' cols = '30' placeholder='내용'></textarea></td>
			</tr>
			
		</table>
		
		<div class="bottom"><input type = "submit" value="전송"></div>
	</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>