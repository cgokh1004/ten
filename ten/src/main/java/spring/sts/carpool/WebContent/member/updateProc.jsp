<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 

%> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
 <% int cnt=dao.update(dto);%>
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
 
<DIV class="title">정보수정</DIV>
 
<div class="content">
<%
if(cnt==1){
   out.print("정보수정을 했습니다.");
}else{
   out.print("정보수정을 실패했습니다.");
}
 
%>
</div>
 
<% if(cnt==1){ %>  
<DIV class='bottom'>
  <input type='button' value='정보확인' 
  onclick="location.href='read.jsp?id=<%=dto.getId()%>'">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input type='button' value='다시시도' 
  onclick="history.back()">
</DIV>
<%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 