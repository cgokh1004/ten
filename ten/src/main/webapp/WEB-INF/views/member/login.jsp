<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function logincheck(){
	var f=document.frm
	if(f.id.value==""){
		alert("아이디를 입력해주세요");
		f.id.focus()
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요");
		f.passwd.focus()
		return false;
	}
}
</script>
</head> 
<body>

 <div style="margin-top: 160px">
<DIV style="font-size: 30px">로그인</DIV>
 <br>
<FORM name='frm' method='POST' action='../member/login' onsubmit="return logincheck()">
  <input type="hidden" name="flag" value="${param.flag}">
  <input type="hidden" name="carpoolno" value="${carpoolno}">
  <input type="hidden" name="nowPage" value="${nowPage}">
  <input type="hidden" name="nPage" value="${nPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
<center> 
<TABLE class='table' >
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" autofocus value='${c_id_val}' style="height: 35px;width: 220px">
       <c:choose>
       <c:when test="${c_id=='Y'}">
       <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장
       </c:when>
       <c:otherwise>
       <input type='checkbox' name='c_id' value='Y' > ID 저장 
       </c:otherwise>
       </c:choose>
     
      </TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" style="height: 35px;width: 220px"></TD>
    </TR>
  </TABLE>
  </center>
  <br>
  <DIV class='bottom'>
    <input type='submit' value='확인'>
    <input type='button' value='회원가입' onclick="location.href='agree'">
  </DIV>
</FORM>
 </div>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 