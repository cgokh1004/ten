<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
String col=(String)request.getParameter("col");
String word=(String)request.getParameter("word");
String nowPage=(String)request.getParameter("nowPage");
%> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
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
      dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
	int cnt=dao.reply(dto);
	if(cnt==1){
		out.print("답변을 등록했습니다.");
%>
<br>
<DIV class='bottom'>
      <input type='button' value='목록' onclick="listB()">
    </DIV>
<%
	}else{
		out.print("답변등록을 실패 했습니다.");
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