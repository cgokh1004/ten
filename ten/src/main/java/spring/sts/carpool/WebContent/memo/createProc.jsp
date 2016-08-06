
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>
<jsp:useBean id="dao" class="memo.memoDAO" />
<jsp:useBean id="vo" class="memo.memoVO" />
<jsp:setProperty name="vo" property="*" />

<!-- property는 request를 포함한 getter를 저장한다. -->
<!-- property="*"을 쓰려면 폼에 네임에있는 이름과 vo.가 가지고 있는 멤버변수와 sql테이블에있는 컬럼명을 동일하게 해야한다.-->
<!-- 다를시 property="title" param="ti" 이런식으로 다른 것을 하나하나 다 써줘야한다.(폼의 name에 있는 이름과 param에있는 이름이 같아야한다.)-->
<!-- 다를시 적어도 sql테이블에 있는 컬럼명과 dto(즉,여기서는 meoVO)에있는 멤버변수가 같아야한다.-->
<%

    cnt=dao.create(vo);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			if (cnt == 1) {
				out.println("메모를 등록 했습니다.");
			} else {
				out.println("메모 등록에 실패했습니다.");
			}
		%>
		<br> <input type='button' value='계속 등록'
			onclick="location.href='./createForm.jsp'">
			<input type='button' value='목록' onclick="location.href='./list.jsp'">
	</DIV>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>