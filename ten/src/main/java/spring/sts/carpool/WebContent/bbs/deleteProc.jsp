<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%
request.setCharacterEncoding("utf-8");
int bbsno=Integer.parseInt(request.getParameter("bbsno"));
String passwd=request.getParameter("passwd");
String col=request.getParameter("col");
String word=request.getParameter("word");
String nowPage=request.getParameter("nowPage");
int cnt = dao.checkPasswd(bbsno, passwd);
%>
 
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
 <%if(cnt==1){
	 dao.delete(bbsno);
	 out.print("글을 삭제하였습니다.");
	 %> 
	 <br>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="listB()">
  </DIV>
<%
  }else{
	  out.print("패스워드 오류입니다.");
%>
	   <br>
  <DIV class='bottom'>
    <input type='button' value='다시실행' onclick="history.back()">
  </DIV>
 <% }%>
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 