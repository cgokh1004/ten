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
		padding-top: 20px;
		padding-bottom: 20px;
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
<script type="text/javascript">
	function update(noticeno){
		var url = "update";
		url += "?noticeno="+noticeno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		url += "&oldfile=${dto.imgname}";
		
		location.href=url;
	}
	function deleteD(noticeno){
		var url = "delete";
		url += "?noticeno="+noticeno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		url += "&oldfile=${dto.imgname}";
		
		location.href=url;
	}
	
	
		function rupdate(comno,content){
			document.rform.rsubmit.value = '수정';
			document.rform.action="./rupdate"
		var f = document.rform;
			document.rform.content.value = content;
			document.rform.comno.value = comno;
		}
		
		function rdelete(comno){
		if(confirm("정말삭제 하겠습니까?")){ 
			var url = "./rdelete";
			url = url + "?comno="+comno;
			url = url + "&noticeno=${param.noticeno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href=url; 
			}
		}
</script>
</head>
<body>
<div class = "title">공지 게시판</div>
<table style = "margin : 0 auto">
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<th style = "width : 50px"><a href="list_sub1.html">제목</a></th>
		<td colspan="3" style = "width : 900px">${dto.title}</td>
	</tr>
	<tr>
		<th style = "width : 300px">닉네임</th>
		<td style = "width : 300px">관리자</td>
		<th style = "width : 300px">작성일</th>
		<td style = "width : 300px">${fn:substring(dto.wdate, 0, 10)}</td>
	</tr>
	<tr>
		<td colspan="4">
			<c:if test="${dto.imgname!='noimg'}">
				<img src="../images/ks/${dto.imgname}" width="100%" height="350" border="0">
			</c:if>
			${dto.content}
		</td>
	</tr>
	<tr>
	<tr>
		<td colspan="4" style = "text-align: center">
			<c:if test="${sessionScope.id=='admin'}">
				<input type = "button" value = "등록" onclick="location.href='./create'">
				<input type = "button" value = "수정" onclick="javascript:update('${dto.noticeno}')">
				<input type = "button" value = "삭제" onclick="javascript:deleteD('${dto.noticeno}')">
			</c:if>
			<input type = "button" value = "목록" onclick="location.href='./list'">
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<hr>
  <c:forEach var="ndto" items="${nlist}">
  <div class="nlist">
   ${ndto.id}<br>
   <p>${ndto.content}</p>
   ${fn:substring(ndto.wdate, 0, 10)}
   <c:if test="${sessionScope.id==ndto.id}">
   <span style="float: right;">
   <a href="javascript:rupdate('${ndto.comno}','${ndto.content }')">
   수정</a>|<a href="javascript:rdelete('${ndto.comno}')">삭제</a>
   </span>
   </c:if>
  </div>
  </c:forEach>
  <div class="rcreate">
  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
  <textarea rows="3" cols="28" name="content" onclick="rcheck(this)" style = "width : 95%"></textarea>
  <input type="submit" name="rsubmit" value="등록">
  <input type="hidden" name="noticeno" value="${dto.noticeno}">
  <input type="hidden" name="id" value="user1">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="comno" value="0">
  
  </form>
  </div>
  <div class="bottom">
  ${paging}
  </div>
		</td>
	</tr>
</table>
</body>
</html>