<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<jsp:useBean id="dao" class="memo.memoDAO"/>


<%
request.setCharacterEncoding("utf-8");
int memono = Integer.parseInt(request.getParameter("memono"));
String nowPage=request.getParameter("nowPage");
String col=request.getParameter("col");
String word=request.getParameter("word");
cnt=dao.delete(memono);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="../css/style.css" rel="stylesheet">
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<DIV class="content">
		<%
  if (cnt == 1){
    out.println("메모를 삭제 했습니다.");
  }else{
    out.println("메모 삭제에 실패했습니다.");
  }
  %>
		<br> <input type='button' value='목록'
			onclick="location.href='./list.jsp'">
	</DIV>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>