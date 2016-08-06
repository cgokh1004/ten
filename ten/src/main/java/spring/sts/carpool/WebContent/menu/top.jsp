<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% 
String root = request.getContextPath();
String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
%>
 
<html>
<head>
<style type="text/css">
ul#menu li{
display :inline;
}
ul#menu li a{
background-color: #3399ff;
color:white;
padding : 10px 20px;
text-decoration:none;
border-radius:10px 10px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}

li#admin{
float:right;
padding-right: 30px
}
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table style="border-color: white">
  <tr>
    <td >
        <img src="<%=root %>/menu/images/images.jpg" width='100%' height='32%'>
    </td>
  </tr>
  
  <tr>
    <td>
    <ul id="menu">
     <li><a href="<%=root %>/index.jsp">홈</a></li>    
<% if(id==null){%>
     <li><a href="<%=root %>/member/loginForm.jsp">로그인</a></li>
     <li><a href="<%=root %>/member/agreement.jsp">회원가입</a></li>
     <li><a href="<%=root %>/member/idFindForm.jsp">아이디 찾기</a></li>
     <li><a href="<%=root %>/member/pwFindForm.jsp">패스워드 찾기</a></li>     
    <%}else{ %>    
     <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>
     <li><a href="<%=root %>/member/read.jsp">나의정보</a></li>
     <li><a href="<%=root %>/member/updateForm.jsp">회원수정</a></li>
     <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>     
     <% }%>
     <li><a href="<%=root %>/bbs/list.jsp">글목록</a></li>
     <li><a href="<%=root %>/bbs/createForm.jsp">글생성</a></li>
     <li><a href="<%=root %>/memo/list.jsp">메모목록</a></li>
     <li><a href="<%=root %>/memo/createForm.jsp">메모생성</a></li>
     
     <%if(id!=null && grade.equals("A")){ %>
     <li id="admin"><a href="<%=root %>/admin/list.jsp">회원목록</a></li>
    <%} %>
    
    </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">