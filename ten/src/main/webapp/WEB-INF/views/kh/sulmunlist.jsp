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

</head>

<body>
	<h2 align="center">마이리서치</h2>

<div align="center">
	<FORM method="POST" action="list">
		<select name="col">		
			<option value="sulgroupname" <c:if test="${col=='sulgroupname'}">selected</c:if>>설문주제</option>
			<option value="sulstate" <c:if test="${col=='state'}">selected</c:if>>상태</option>
			<option value="total" <c:if test="${col=='total'}">selected</c:if>>전체출력</option>
		</select> <input type="text" name="word" value="${word}">
		                 <input type="submit" value="검색" /> 
	</FORM>
	</div>
	<TABLE border='2' align='center' width='70%' >
		<TR>		
			<TH width='10%'>설문주제</TH>
			<TH width='10%'>상태</TH>	
			<TH width='10%'>삭제</TH>
			<TH width='10%'>결과보기</TH>
		</TR>
		<c:forEach items="${list}" var="dto">
			<TR>
				<TD><a href="javascript:read('${dto.sulgroupname}','${dto.sulstate}')"> ${dto.sulgroupname}</a></TD>
				<TD>${dto.sulstate}	</TD>
				<TD><input type="button" value="삭제하기" onclick="del('${dto.sulgroupname}')"></TD>
				<TD><input type="button" value="결과보기" onclick="result('${dto.sulgroupname}')"></TD>
			</TR>

			<br>
		</c:forEach>
	</TABLE>
	<br>
	<div align="center">
	<input type='button' value='설문지등록' onclick="location.href='./create'">
	</div>
	<br>
	${paging}
</body>
</html>