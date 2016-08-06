<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, img.*, utility.*"%>
<jsp:useBean id="dao" class="img.ImgDAO" />
<%
	request.setCharacterEncoding("utf-8"); 
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	
	List list = dao.imgRead(imgno);
	ImgDTO dto = dao.read(imgno);
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">사진 목록</DIV>

	<DIV class = "content">
	<TABLE class='table'>
		<TR>
			<TH colspan="5"><img src="./storage/<%=dto.getFilename()%>"><%=dto.getFilename() %></TH>
		</TR>

		<TR>
			<%for(int i = 5; i < 7; i++){ %>
			<%if(list.get(i)!=null){ %>
			<TD><A href='./read.jsp?imgno=<%=list.get(i-5)%>'><img src="./storage/<%=list.get(i)%>" width="200px" height ="200px"><%=list.get(i)%></a></TD>
			<%}
			else{%>
			<TD><img src="./storage/imgfornull.jpg" width="200px" height ="200px"></TD> 
			<%	}} %>
			
			<TD style="border-style: solid; border-width: 3px;  border-color: #de2125;"><img src="./storage/<%=dto.getFilename()%>" width="200px" height ="200px"><%=dto.getFilename() %></TD>
			
			<%for(int i = 8; i < 10; i++){ %>
			<%if(list.get(i)!=null){ %>
			<TD><A href='./read.jsp?imgno=<%=list.get(i-5)%>'><img src="./storage/<%=list.get(i)%>" width="200px" height ="200px"><%=list.get(i)%></a></TD>
			<%} else {%>			
			<TD><img src="./storage/imgfornull.jpg" width="200px" height ="200px"></TD>
			<% }}%>
			



		</TR>
	</TABLE>
	</DIV>
	<DIV class='bottom'>
		<input type='button' value='뒤로가기' onclick="history.back()">
		<input type='button' value='목록' onclick="location.href='list.jsp'">
		<input type='button' value='답변' onclick="location.href='replyForm.jsp?imgno=<%=dto.getImgno()%>'">
		<input type='button' value='수정' onclick="location.href='updateForm.jsp?imgno=<%=dto.getImgno()%>&oldfile=<%=dto.getFilename()%>'">
		<input type='button' value='삭제' onclick="location.href='deleteForm.jsp?imgno=<%=dto.getImgno()%>&oldfile=<%=dto.getFilename()%>'">
	</DIV>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>