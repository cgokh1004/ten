<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="bbs.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
 <%
 int bbsno=Integer.parseInt(request.getParameter("bbsno"));
 String col=(String)request.getParameter("col");
 String word=(String)request.getParameter("word");
 String nowPage=(String)request.getParameter("nowPage");
 dao.increaseViewcnt(bbsno);
 BbsDTO dto=dao.read(bbsno);
 String content=dto.getContent();
 content=content.replaceAll("\r\n", "<br>");
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style>
<script type="text/javascript">
function deleteM(){
	var url="./deleteForm.jsp"
	url+="?bbsno=<%=bbsno%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
			location.href=url;
}
function listB(){
	var url="./list.jsp"
	url+='?col=<%=col%>';
	url+='&word=<%=word%>';
	url+="&nowPage=<%=nowPage%>";
			location.href=url;
}
function updateB(){
	var url="./updateForm.jsp"
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&bbsno=<%=bbsno%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
} 
function replyB(){
	var url="./replyForm.jsp"
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&bbsno=<%=bbsno%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}

</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>

  <TABLE class='table'>
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
     <TR>
      <TH>내용</TH>
      <TD><%=content%></TD>
    </TR>
     <TR>
      <TH>성명</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
     <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
     <TR>
      <TH>등록일</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="location.href='./createForm.jsp'">
    <input type='button' value='목록' onclick="listB()">
    <input type='button' value='수정' onclick="updateB()">
	<input type='button' value='삭제' onclick="deleteM()">
    <input type='button' value='답변' onclick="replyB()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 