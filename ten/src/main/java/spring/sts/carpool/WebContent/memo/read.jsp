<%@ page language="java" contentType="text/html; charset=UTF-8" 
	  pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>
<jsp:useBean id="dao" class="memo.memoDAO" />

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	String nowPage=request.getParameter("nowPage");
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	dao.upViewcnt(memono);//조회수 증가
	memoVO vo=dao.read(memono);//한건의 레코드 가져오기
	
	String content= vo.getContent().replaceAll("\r\n","<br>");
	String wdate=vo.getWdate().substring(0,10);
	
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" 
content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
</style>


<script type = "text/javascript">
function updateM(){
	var url = "updateForm.jsp";
	url += "?memono=<%=memono%>";
	url = url + "&nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	
	location.href = url;
	//혼파망...-_-);
}

function deleteM(){
	var url = "deleteForm.jsp";
	url += "?memono=<%=memono%>";
	url = url + "&nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	location.href = url;
}
function listM(){
	var url = "list.jsp";
	url = url + "?nowPage=<%=nowPage%>";
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	location.href = url;
}

</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<DIV class="title">
		조회</DIV>

	<table>
		<TR>
			<TH>제목</TH>
			<TD><%=vo.getTitle()%></TD>
		</TR>
		<TR>
			<TH>내용</TH>
			<TD><%=content%></TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD><%=vo.getViewcnt() %></TD>
		</TR>
		<TR>
			<TH>등록일</TH>
			<TD><%=wdate%></TD>
		</TR>
	</table>

	<DIV class="bottom">
		<input type='button' value='등록'
		onclick="location.href='./createForm.jsp'">
			
	 	<input type='button' value='목록' 
	 	onclick="listM()">
	 	
	 	<input type='button' value='수정' 
	 	onclick="updateM()">
	 	<!-- on으롷 시작하는 함수는 그냥 자바스크립트 취급이라서
	 	< % % > 안써도 됨
	 	 -->
	 	 
	 	<input type='button' value='삭제' 
	 	onclick="deleteM()"> 
	 	 
	</DIV>





<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>

