<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty property="*" name="dto"/>
<% 
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
	var url="read.jsp";
	url+="?bbsno=<%=dto.getBbsno()%>";
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
function listB(){
	var url="list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
<%
	int cnt=dao.checkPasswd(dto.getBbsno(), dto.getPasswd());
	if(cnt==1){
		dao.update(dto);
		out.print("글을 변경했습니다.");
%>
<br>
<DIV class='bottom'>
      <input type='button' value='변경 확인' onclick="read()">
      <input type='button' value='목록' onclick="listB()">
    </DIV>
<%
	}else{
		out.print("패스워드 오류입니다.");
%>
<br>
 <DIV class='bottom'>
      <input type='button' value='다시 시도' onclick="history.back();">       
      <input type='button' value='목록' onclick="listB()">
    </DIV>
    <%} %>
</DIV>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 