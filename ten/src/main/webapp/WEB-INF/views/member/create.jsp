<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td {
		text-align: left;
		padding-left: 15px;
		margin: 15px;
	}
	hr {
		border : solid 2px #4ABFD3;
	}
	th {
		font-size: 18px;
		text-align: left;
		padding-left: 15px;
		margin-bottom: 15px;
		margin-top: 15px;
		padding-bottom: 15px;
	}
	.search {
		text-align: center;
	}
	.title {
		color : #4ABFD3;
		text-align: left;
		font-weight: bold;
		font-size: 21px;
		font-family: 굴림;
		padding-left: 250px;
		padding-top: 20px;
	}
	a:link{
		color : black;
		text-decoration: none;
	}
	a:VISITED {
		color : black;
		text-decoration: none;
	}
	a:HOVER {
		color : red;
		text-decoration: none;
	}
</style>
</head>
<body>
<DIV class="title">${dto.name} 회원 정보</DIV>
 
  <TABLE class='table' width = "25%">
    <TR>
      <TD style = "text-align : center;">
       <img style="width: 250; hegiht : 250"  src="../images/${dto.mfile}">
      </TD>
    </TR>
    <TR>
      <TD>아이디 : ${dto.id}</TD>
    </TR>
    <tr> 
      <td>이름 : ${dto.name}</td> 
    </tr> 
    <tr> 
      <td>회원종류 : ${dto.mem_type}</td> 
    </tr> 
    <tr> 
      <td>성별 : ${dto.gender}</td> 
    </tr> 
    <tr> 
      <td>운전면허 종류 : ${dto.license_type}</td> 
    </tr>           
    <tr>  
      <td>인증갯수 : ${dto.certi_num}</td> 
    </tr> 
    <tr>  
      <td>핸드폰번호 : ${dto.phone_num}</td> 
    </tr> 
    <tr>  
      <td>핸드폰번호 인증 상태 : 
      <c:choose>
		<c:when test="${dto.phone_certi}">
	      
	      </c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
		</td> 
    </tr> 
    <tr>  
      <td>SNS : ${dto.sns}</td> 
    </tr> 
    <tr>  
      <td>SNS 인증 상태 : 
      
      ${dto.sns_certi}</td> 
    </tr> 
    <tr>  
      <td>이메일 : ${dto.mail}</td> 
    </tr> 
    <tr>  
      <td>이메일 인증 상태 : 
      
      ${dto.mail_certi}</td> 
    </tr> 
    <tr>  
      <td>여권 : ${dto.passport}</td> 
    </tr> 
    <tr>  
      <td>여권 인증 상태 : 
      
      ${dto.passport_certi}</td> 
    </tr> 
    <tr>  
      <td> 
        	주소 : ${dto.address1} <br> 
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${dto.address2}
      </td>   
    <tr>  
      <td>주소 인증 상태 : 
      
      ${dto.addr_certi}</td> 
    </tr>
    <tr>
      <td>가입날짜 : ${fn:substring(dto.mdate,0,10)}</td> 
    </tr> 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' class = "button1" value='정보수정' onclick="update('${dto.id}','${dto.filename}')">
    <input type='button' class = "button1" value='탈퇴' onclick="deleteM('${dto.id}','${dto.filename}')">
    <input type='button' class = "button1" value='비번변경' onclick="location.href='updatePw.do?id=${dto.id}'">
    <input type='button' class = "button1" value='다운로드'  
     onclick="location.href='${pageContext.request.contextPath}/download?dir=/view/member/storage&filename=${dto.filename}'">
  
  </DIV>
</body>
</html>