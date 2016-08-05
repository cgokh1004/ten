<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문하기</title>
<script type="text/javascript">
	// function save(f) {
	// 	alert("클릭하시면 제출이 됩니다?");
	// 	f.document.focus();
	// 	return false;
	// }
	function save(f) {
		/* confirm(문자열, 초기값) */
		var check = confirm("확인 버튼을 누르면 제출이 됩니다. 제출취소는 취소 버튼을 누르세요");
		/* if(check == true) else false */
		if (check)
			alert("제출했습니다. 확인 버튼을 누르시고, 하단 돌아가기 버튼을 누르세요");
		else
			alert("제출 취소되었습니다. ");
	}
		
</script>

<script language="javascript">

function checkOnly(chk){

	   var obj = document.getElementsByName("check");

	      for(var i=0; i<obj.length; i++){
	            if(obj[i] != chk){
	                  obj[i].checked = false;
	                  }
	            }
	    }

function listA(){
	var url ="list"
	url += "?sulno="+sulno;
	url += "&sulgroupname="+sulgroupname;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";		
		 
		location.href=url;
}

function checklistclick(val1, val2){	
	var checkstr = "/설"+val1
	var tempresult = document.frm.hapresult.value;
	if(tempresult.indexOf(checkstr) != -1){
		var pointloc = tempresult.indexOf(checkstr);
		
		//앞에짜르기
		var firststr = tempresult.substring(0, pointloc);
		
		//뒤에짜르기
		var secondpointloc = tempresult.indexOf("/", pointloc+1);
		var laststr;
		if(secondpointloc != -1){
			laststr = tempresult.substring(secondpointloc, tempresult.length);
			document.frm.hapresult.value = firststr + "/설" + val1 + "," + val2 + laststr;
		}
		else{
			document.frm.hapresult.value = firststr + "/설" + val1 + "," + val2;
		}
	}	
	else{
		document.frm.hapresult.value = document.frm.hapresult.value +  "/설" + val1 + "," + val2;
	}
}

function sulmunrupdate(sulmunrno){
	alert(sulmunrno)
}

function surveyupdate(sulno){
	alert(sulno)
}
</script>
</head>
<body>
<form action="/ten/survey/read" method="post" name="frm">
<input type="hidden" name="nowPage" value="${nowPage }" >
<input type="hidden" name="col" value="${col }">
<input type="hidden" name="word" value="${word}">
<input type="hidden" name="hapresult" style="width: 1000px">


현재 설문 상태는 ${sulstate } 입니다.
<c:if test="${sulstate=='진행'}"><a href="./sulstateno?sulgroupname=${sulgroupname }"><input type="button" value="설문끝내기"></a></c:if>
<c:if test="${sulstate=='완료'}"><a href="./sulstateyes?sulgroupname=${sulgroupname }"><input type="button" value="설문재시작하기"></a></c:if>



	<h1>리서치 작성이 시작됩니다.</h1>
	<h2>
		<p>본 리서치의 주제는	${sulgroupname }이며, 본 리서치결과는 상업적인 목적으로 사용하지 않으며</p>
		<p>기업 마케팅에만 적용되어 고객들에게 더 나은 서비스를 위해 시행하는 것입니다.</p>
	</h2>
  <TABLE border="1px solid" bordercolor="green" width="1000px">
  
  <form></form>
  
	<c:forEach items="${list}" var="surveydto">
	
	
<tr>
   <th>	질문</th>
   <td width="50%">${surveydto.askcontent}</td>
   
 <FORM method="get" action="surveyupdate">
   <td>		
   <input type="hidden" size="35%" name="sulgroupname" value="${sulgroupname }"></input>
	   <input type="text" size="35%" name="askcontent"></input>
	 </td>  	
	 <td>  <input type="hidden" name="sulno" value="${surveydto.sulno }"> <input type="submit" value="질문 수정하기"></td>		
</tr> 
</FORM>

    	<c:forEach items="${surveydto.sulmunrdtoList}" var="sulmunrdto">
   <tr>

    <td>	
		<c:if test="${sulstate=='진행'}"><input type="radio" name="radio${surveydto.sulno }" value="${sulmunrdto.chono}" onclick="checklistclick(${surveydto.sulno },${sulmunrdto.chono})">${sulmunrdto.chono}번</c:if>
	</td>
	<td>	
			${sulmunrdto.chocontent}
	</td>
	
	 <FORM method="get" action="sulmunrupdate">
 <td>
  <input type="hidden" size="35%" name="sulgroupname" value="${sulgroupname }"></input>
  <input type="text" size="35%" name="chocontent"></input>
 </td>
 <td> <input type="hidden" name="sulmunrno" value="${sulmunrdto.sulmunrno }"> <input type="submit" value="보기 수정하기" > </td>   
</tr>
</FORM>
	    	</c:forEach>
			<br>
	</c:forEach>
	</table>		
	
	<br>
	<div align="center">
	<input type='button' value='돌아가기' onclick="location.href='./list'">
	<c:if test="${sulstate=='진행'}"><input type="submit" value='저장'></c:if>
	</div>	
</form>
</body>
</html>