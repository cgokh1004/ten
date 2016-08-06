<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
 String id=(String)session.getAttribute("id");
   String grade=(String)session.getAttribute("grade");
   String title="이번 여름에는 어디로 갈까?";
   
   if(id!=null&&grade.equals("A")){
	   title="관리자 페이지";
   }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 20px; 
} 
</style> 
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="title"><%=title %></div>
<div class="content">
<img src="images/보라카이.jpg" width=50%><br>
<%
if (id == null){%>
<br> 
<input type='button' value='로그인' 
       onclick="location.href='./member/loginForm.jsp'">   
<% 
}else{%> 
<input type='button' value='로그아웃' 
       onclick="location.href='./member/logout.jsp'"> 
<% 
}%> 

</DIV> 

<div class="bottom"></div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html> 