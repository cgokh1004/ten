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
  border-color: #AAAAAA; /* 선 색깔 */
  width: 45%;            /* 화면의 30% */ 
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
	hr{
		border: solid 0.1px #5555ff;
		margin-top: 10px;		
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
	<div class = "title">지역 소개</div>
		<br>
		<hr width= "70%">
	<table style="margin: left">
		<tr>
			<td><%=dto.getFilename() %></td>
			<td rowspan="2">
				<img style="width: 25%"  src="../storage/${dto.filename}">
			</td>	
			<th>제목</th>
			<td><%=dto.getTitle() %></td>			
			<th>지역</th>
			<td><%=dto.getLocation() %></td>
		</tr>
	</table>	
	<table style="margin: 0 auto">
		<tr>
			<td style="text-align: center">내용</td>
		</tr>
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
		<div id="map" style="width:500px;height:400px; margin: 0 auto;" ></div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ab11f2e98268edfe66214d129020fa35"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(33.450701, 126.570667),
				level: 3
			};
	
			var map = new daum.maps.Map(container, options);
		
			var marker = new daum.maps.Marker({
			    position: new daum.maps.LatLng( 37.23, 126.67 )
			});

			clusterer.addMarker(marker);
		
			 var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
			        level : 14 // 지도의 확대 레벨 
			    });
			    
			    // 마커 클러스터러를 생성합니다 
			    var clusterer = new daum.maps.MarkerClusterer({
			        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			        minLevel: 10 // 클러스터 할 최소 지도 레벨 
			    });
			 
			    // 데이터를 가져오기 위해 jQuery를 사용합니다
			    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
			    $.get("/download/web/data/chicken.json", function(data) {
			        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
			        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			        var markers = $(data.positions).map(function(i, position) {
			            return new daum.maps.Marker({
			                position : new daum.maps.LatLng(position.lat, position.lng)
			            });
			        });

			        // 클러스터러에 마커들을 추가합니다
			        clusterer.addMarkers(markers);
			    });
			
			
			</script>
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
  <div class="rcreate">
  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
  <textarea rows="3" cols="28" name="content" onclick="rcheck(this)"></textarea>
  <input type="submit" name="rsubmit" value="등록">
  <input type="hidden" name="tra_no" value="${dto.tra_no}">
  <input type="hidden" name="id" value="${sessionScope.id}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="treply_no" value="0">
  
  
  </form>
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