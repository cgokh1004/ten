
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="./ssi.jsp"%>


<jsp:useBean id="dao" class="memo.memoDAO" />
<jsp:useBean id="vo" class="memo.memoVO" />
<jsp:setProperty property="*" name="vo" />

<%
request.setCharacterEncoding("utf-8");
String nowPage=request.getParameter("nowPage");
String col=request.getParameter("col");
String word=request.getParameter("word");
	cnt = dao.update(vo);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function listM(){
	var url = "list.jsp";
	url +="?nowPage=<%=nowPage%>";
	url +="&col=<%=col%>";
	url +="&word=<%=word%>";
	location.href = url;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<DIV class="content">
		<%
			if (cnt == 1) {
				out.println("메모를 수정 했습니다.");
			} else {
				out.println("메모 수정에 실패했습니다.");
			}
		%>
		<br> <input type='button' value='계속 등록'
			onclick="location.href='./createForm.jsp'"> 
			<input type='button' value='목록' onclick="listM()">
	</DIV>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>