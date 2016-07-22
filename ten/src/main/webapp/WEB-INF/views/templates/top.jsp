<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style type="text/css">
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
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
<table style="width: 100%">
  <tr>
    <td>
        <img src="${pageContext.request.contextPath}/images/praha.jpg" width='50%' height='50%'>
    </td>
  </tr>
  
  <tr>
    <td>
    <ul id="menu">
     <li><a href="${pageContext.request.contextPath}/">홈</a></li>    
     <c:choose>
	     <c:when test="${empty sessionScope.id}">
	     <li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
	     <li><a href="${pageContext.request.contextPath}/member/agree">회원가입</a></li>
	     <li><a href="${pageContext.request.contextPath}/member/idFind">아이디 찾기</a></li>
	     <li><a href="${pageContext.request.contextPath}/member/pwFind">패스워드 찾기</a></li>   
	     </c:when>
	     <c:otherwise>
	     <li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
	     <li><a href="${pageContext.request.contextPath}/member/read">나의정보</a></li>
	     <li><a href="${pageContext.request.contextPath}/member/update">회원수정</a></li>
	     <li><a href="${pageContext.request.contextPath}/member/delete">회원탈퇴</a></li>   
	     </c:otherwise>
     </c:choose> 
     <li><a href="${pageContext.request.contextPath}/bbs/list">글목록</a></li>
     <li><a href="${pageContext.request.contextPath}/bbs/create">글생성</a></li>
     <li><a href="${pageContext.request.contextPath}/img/list">이미지목록</a></li>
     <li><a href="${pageContext.request.contextPath}/img/create">이미지생성</a></li>
     <li><a href="${pageContext.request.contextPath}/memo/list">메모목록</a></li>
     <li><a href="${pageContext.request.contextPath}/memo/create">메모생성</a></li>
     <li><a href="${pageContext.request.contextPath}/cal/calendar">일정생성</a></li>
     <c:if test="${not empty sessionScope.id && sessionScope.grade =='A'}">  
     	<li id="admin"><a href="${pageContext.request.contextPath}/admin/list">회원목록</a></li>
     </c:if>
    </ul>
    </td> 
  </tr>
</table>
</div>
<!-- 상단 메뉴 끝 -->
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">