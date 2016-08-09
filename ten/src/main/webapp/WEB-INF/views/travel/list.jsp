<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(tra_no){
	var url = "read";
	url += "?tra_no="+tra_no;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
		
	location.href=url;
}
</script>
<style type="text/css"> 
	*{ 
	  font-family: gulim; 
	  font-size: 20px; 
	} 

	td{
		size: 150cm;
	}

</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body>
<DIV class="title">게시판 목록</DIV>

<DIV class="search">
<form method="POST" action="./list">
	<select name="col">
		<option value="title"
		<c:if test="${col=='title'}">selected</c:if>
		>제목</option>
		<option value="content"
		<c:if test="${col=='content'}">selected</c:if>
		>내용</option>
		<option value="total"
		<c:if test="${col=='total'}">selected</c:if>
		>전체출력</option>
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">
</form>
</DIV>
<Br> 
<TABLE style ="margin: 0 auto">
<c:choose>
	<c:when test="${empty list }">
		<tr>
			<td colspan = "8" align="center">등록된 글이 없습니다.</td>
		</tr>	
	</c:when>	
	<c:otherwise>
		<c:forEach items="${list}" var="dto">
			
		<div class="newsWrap">
			<div class="news_list">
				<div class="item">
					<a href="/kor/bz15/travel/theme/content/cms_view_2392049.jsp?gotoPage=&category=&listType=">
						
						<div class="pic">
							<img src="http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel/theme/content/2392049_image2_1.jpg" alt="킬링 더위, 힐링 자연으로 보내다! 사진" >
								<span>
									<img src="http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel/trv_list/img_ov.png" alt="">
								</span>
						</div>
				<div class="cnt">
					<h3>킬링 더위, 힐링 자연으로 보내다!</h3>
						<p class="info1">
							<span class="read">9551</span>
							<span class="time">07. 07</span>
						</p>
						<p class="txt">
							장마 끝자락 찾아온 불볕더위. 매년 만나는 무더위인데 만날 때마다 견디기 어렵다. 시원한 에어컨 바람도 잠깐. 계속되는 인공 바람 혹은 무더위에 몸과 마음이 지치는 건 당연지사. 이럴 때일수록 몸과 마음을 달래줄 위로가 필요하다. 나무와 숲, 그리고 바다까지. 자연의 ...
						</p>
				</div>
					</a>
		</div>
		
		<div class="item"><a href="/kor/bz15/travel/theme/content/cms_view_2391526.jsp?gotoPage=&category=&listType=">
			<div class="pic">
	
							<img src="http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel/theme/content/2391526_image2_1.jpg" alt="매력적인 바다도시 울산&거제 사진" >
							<span><img src="http://tong.visitkorea.or.kr/img/vk/kor/bz15/travel/trv_list/img_ov.png" alt=""></span>
						</a>
			</div>				
		</div>
				
				

			
			
			<TR>
			    <td style="width: 150px; height: 300px;"><img style="width: 150px; height: 150px;" src="../storage/${dto.filename}"></td>    
			    <td><a href="javascript:read('${dto.tra_no}')">${dto.content}</a></td>
	  		</TR>		
		</c:forEach> 
	</c:otherwise>
</c:choose>
</TABLE> 



				<div class="cnt">
					<h3>킬링 더위, 힐링 자연으로 보내다!</h3>
					<p class="info1">
						<span class="read">9551</span>
						<span class="time">07. 07</span>
					</p>
					<p class="txt">
						장마 끝자락 찾아온 불볕더위. 매년 만나는 무더위인데 만날 때마다 견디기 어렵다. 시원한 에어컨 바람도 잠깐. 계속되는 인공 바람 혹은 무더위에 몸과 마음이 지치는 건 당연지사. 이럴 때일수록 몸과 마음을 달래줄 위로가 필요하다. 나무와 숲, 그리고 바다까지. 자연의 ...
					</p>
				</div>
			</a></div>

			<div class="item"><a href="/kor/bz15/travel/theme/content/cms_view_2391526.jsp?gotoPage=&category=&listType=">


















<DIV class='bottom'>
    ${paging}
    <input type='button' value='등록' onclick="location.href='create'">
    <input type='button' value='test' onclick="location.href='read'">
</DIV>
</body>
</html> 

