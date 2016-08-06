<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 <jsp:useBean id="dao" class="bbs.BbsDAO"/>
  <jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty property="*" name="dto"/>
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
 <%
 int cnt=dao.create(dto);
if(cnt>0){
	out.print("글을 작성하였습니다.");
}else{
	out.print("글 작성을 실패하였습니다.");
}

%>

  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='list.jsp'">&emsp;
    <input type='button' value='다시등록' onclick="location.href='createForm.jsp'">
  </DIV>
 </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 