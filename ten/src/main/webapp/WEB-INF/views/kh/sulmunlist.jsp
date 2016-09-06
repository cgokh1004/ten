<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sulmunlist</title>
<script type="text/javascript">
table{
	 
}


</script>

<script type="text/javascript">
	function del(sulgroupname) {
		if(confirm("정말 삭제할꺼건가요?")){
		var url="../survey/delete";
		url += "?sulgroupname="+sulgroupname;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";		
		location.href=url;
		}
	}
	
	function read(sulgroupname, sulstate){
		alert(sulstate);
		var url = "../survey/read";
		url += "?sulgroupname="+sulgroupname;
		url += "&sulstate="+sulstate;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";		
		
		location.href=url;
	}
	
	function preview(){
		window.open('','preview','scrollbars=yes, toolbar=yes,resizable=yes, width=300, height=300')
	    document.frm.action="preview.jsp"//팝업창페이지설명
	    document.frm.target="preview"
	    document.frm.submit()
	}
	function updateA(sulno){		
		     
				var url="../survey/update";
				url += "?sulno="+sulno;
				url += "&col=${col}";
				url += "&word=${word}";
				url += "&nowPage=${nowPage}";		
				location.href=url;
		}
	
	function result(sulgroupname){
		alert(sulgroupname);
		var url = "../survey/result";
		url += "?sulgroupname=" + sulgroupname;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";		
		
		location.href=url;
	}
	
</script>

<!-- table -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<h2 align="center">마이리서치</h2>

<div class="container">
	<FORM method="POST" action="list">
		<select name="col">		
			<option value="sulgroupname" <c:if test="${col=='sulgroupname'}">selected</c:if>>설문주제</option>
			<option value="sulstate" <c:if test="${col=='state'}">selected</c:if>>상태</option>
			<option value="total" <c:if test="${col=='total'}">selected</c:if>>전체출력</option>
		</select> <input type="text" name="word" value="${word}">
		                 <input type="submit" value="검색" /> 
	</FORM>
	</div>
	<TABLE class="table" border='2' align='center' style="width: 70%">
	 <thead>
		<TR>		
			<TH width='10%' style="text-align: center">설문주제</TH>
			<TH width='10%' style="text-align: center">상태</TH>	
			<c:if test="${sessionScope.id == 'admin'}"> 
				<TH width='10%' style="text-align: center">삭제</TH>
			</c:if>
			<TH width='10%' style="text-align: center">결과보기</TH>
		</TR>
		 </thead>
		 <tbody>
		<c:forEach items="${list}" var="dto">
			<tr class="info">
				<TD><a href="javascript:read('${dto.sulgroupname}','${dto.sulstate}')"> ${dto.sulgroupname}</a></TD>
				<TD>${dto.sulstate}	</TD>
				<c:if test="${sessionScope.id == 'admin'}"> 
				<TD><input type="button" value="삭제하기" onclick="del('${dto.sulgroupname}')"></TD>
				</c:if>
				<TD><input type="button" value="결과보기" onclick="result('${dto.sulgroupname}')"></TD>
			</TR>

			<br>
		</c:forEach>
		  </tbody>
	</TABLE>
	<br>
	<div align="center">
	<c:if test="${sessionScope.id == 'admin'}"> 
	<input type='button' value='설문지등록' onclick="location.href='./create'">
	</c:if>
	</div>
	<br>
	${paging}
</body>
</html>