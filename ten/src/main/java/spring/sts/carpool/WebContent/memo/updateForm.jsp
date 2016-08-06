
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="memo.memoDAO" />


<%@ include file="./ssi.jsp"%>

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	memoVO vo = dao.read(memono);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">
<style>
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<DIV class="title">
		수정</DIV>

	<form name="frm" method="POST" action="./updateProc.jsp">

		<input type='hidden' name='memono' size='30' value='<%=memono%>'>
		<input type='hidden' name='col' size='30' value='<%=col%>'>
		<input type='hidden' name='word' size='30' value='<%=word%>'>
		<input type='hidden' name='nowPage' size='30' value='<%=nowPage%>'>
		<table>
			<tr>
				<th>제목</th>
				<td><input type='text' name='title' size='30'
					value='<%=vo.getTitle()%>'></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name='content' rows='10' cols='30'><%=vo.getContent()%></textarea></td>
			</tr>

		</table>

		<div class="bottom">
			<input type="submit" value="전송">
		</div>
	</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>


