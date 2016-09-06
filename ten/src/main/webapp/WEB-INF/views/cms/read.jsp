<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="spring.model.travel.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
   
<%
   	String col = request.getParameter("col");
   	String word = request.getParameter("word");
   	String nowPage = request.getParameter("nowPage");	   	
   	TraDTO dto = (TraDTO)request.getAttribute("dto");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
.rcreate{
  font-size: 20px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
.rlist{
  line-height:1.2em;
  font-size: 15px;
  font-weight:bold;
  text-align: left;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: #AAAAAA; /* 선 색깔 */
  color: #000000;        /* 글자 색깔 */
  width: 35%;            /* 화면의 30% */ 
  padding: 10px;         /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
  
  /* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
  /* padding-top: 30px;  상단만 간격을 30px 지정   */
  
  margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}
hr{
  text-align: center;
  border-style: solid;   /* 실선 */
  border-width: 1px;     /* 선 두께 */
  border-color: red; /* 선 색깔 */
  width: 55%;            /* 화면의 30% */ 
}
 
 
</style>  


<style>
	
	tr{
		text-align: center;
		padding-left: 10px;
		margin: 15px;
		padding-top: 20px;
		padding-bottom: 20px;

	}		
	td{
		text-align: center;
		padding-left: 10px;
		margin: 15px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	
	th{
		font-size: 15px;
		text-align: center;
		padding-left: 15px;
		margin-bottom ;
		margin-top: ;		
	}	
	.title {
 		color : #4ABFD3;
 		text-align: left;
 		font-weight: bold;
 		font-size: 21px;
 		font-family: 고딕;
 		padding-left: 250px;
 		padding-top: 20px;
 	}
</style>
<script type="text/javascript">
function listB(){
	var url="list";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
	
}
function updateB(){
	var url="update";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&tra_no=<%=dto.getTra_no()%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;	
}
function deleteB(){
	var url="delete";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&tra_no=<%=dto.getTra_no()%>";
	url += "&nowPage=<%=nowPage%>";
	location.href=url;	
}
</script>
<script>
function rcheck(tarea){
if('${sessionScope.id}'==""){
if(confirm("로그인후 댓글를 쓰세요")){
var url = "../member/login";
url = url + "?tra_no=${dto.tra_no}";
url = url + "&nowPage=${param.nowPage}";
url = url + "&nPage=${nPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&flag=../travel/read";
location.href=url;
}else{
tarea.blur();
}
}
}
 
function input(f){
if('${sessionScope.id}'==""){
if(confirm("로그인후 댓글를 쓰세요")){
var url = "../member/login";
url = url + "?tra_no=${dto.tra_no}";
url = url + "&nowPage=${param.nowPage}";
url = url + "&nPage=${nPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&flag=../travel/read";
location.href=url;
return false;
}else{
 
return false;
}
}else if(f.content.value==""){
alert("댓글 내용을 입력하세요.");
f.content.focus();
return false;
}
}
function rupdate(treply_no,rcontent){
var f = document.rform;
f.content.value = rcontent;
f.treply_no.value = treply_no;
f.rsubmit.value="수정";
f.action="./rupdate"
}
function rdelete(rnum){
if(confirm("정말삭제 하겠습니까?")){ 
var url = "./rdelete";
url = url + "?treply_no="+treply_no;
url = url + "&tra_no=${dto.tra_no}";
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
	<br><br>
	<div style="text-align: center; color: gray;">지역 소개
			<h1><%=dto.getLocation() %></h1>
			</div>
		<br>
		<hr width= "70%">
	<table style="margin: 0 auto">
		<tr>
			<td rowspan="2">
			<h3>『${dto.title }』</h3><br>
			<br>
				<img style="width: 25%"  src="../storage/${dto.filename}">
			</td>	
		</tr>
	</table>	
	<table style="margin: 0 auto">
		
		<tr>			
			<td><%=dto.getContent() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getTdate() %></td>
		</tr>				
	</table>		
	<br>
	<br>
	<br>
	<!-- -다음지도 API 시작 -->

	<!-- -다음지도 AIP 끝	 -->
	
	
	<!-- 댓글 시작 -->
	<hr>
  <c:forEach var="rdto" items="${rlist}">
  <div class="rlist">
   ${rdto.id}<br/>
   <p>${rdto.content}</p>
   ${rdto.trep_date}
   <c:if test="${sessionScope.id==rdto.id }">
   <span style="float: right;">
   <a href="javascript:rupdate('${rdto.treply_no}','${rdto.content }')">
   수정</a>|<a href="javascript:rdelete('${rdto.rnum}')">삭제</a>
   </span>
   </c:if>
  </div>
  </c:forEach>
<!--   <div class="rcreate"> -->
<!--   <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)"> -->
<!--   <textarea rows="3" cols="28" name="content" onclick="rcheck(this)"></textarea> -->
<!--   <input type="submit" name="rsubmit" value="등록"> -->
<%--   <input type="hidden" name="tra_no" value="${dto.tra_no}"> --%>
<%--   <input type="hidden" name="id" value="${sessionScope.id}"> --%>
<%--   <input type="hidden" name="nowPage" value="${param.nowPage}"> --%>
<%--   <input type="hidden" name="nPage" value="${nPage}"> --%>
<%--   <input type="hidden" name="col" value="${param.col}"> --%>
<%--   <input type="hidden" name="word" value="${param.word}"> --%>
<!--   <input type="hidden" name="treply_no" value="0"> -->
  
  
<!--   </form> -->
  </div>
  <div class="bottom">
  ${paging}
  </div>
  
  <!-- 댓글 끝 -->
			
		<br>
		<div style="text-align: center">
			<input type='button' value='목록' onclick="listB()">
			<input type='button' value='수정' onclick="updateB()">
			<input type="button" value='삭제' onclick="deleteB()">
		</div>		
</body>
</html>