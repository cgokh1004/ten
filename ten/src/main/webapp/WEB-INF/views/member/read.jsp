<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="util" uri="/ELFunctions"%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteM(id,oldfile){
if(confirm("정말탈퇴 하겠습니까?")){
var url = "delete";
url = url +"?id="+id;
url = url +"&oldfile="+oldfile;
 
location.href=url;
 
}
 
}
function updateFile(id,oldfile){
var url ="updateFile"
url = url + "?id="+id;
url = url + "&oldfile="+oldfile;
 
location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">${dto.mname}의 회원정보</DIV>
 
  <TABLE class='table'>
    <TR>
      <TD colspan="2">
       <img src="../storage/${dto.fname}" width="300px">
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>${dto.id}</TD>
    </TR>
    <tr> 
      <th>이름</th> 
      <td>${dto.mname}</td> 
    </tr> 
    <tr> 
      <th>전화번호</th> 
      <td>${dto.tel}</td> 
    </tr>           
    <tr>  
      <th>이메일</th> 
      <td>${dto.email}</td> 
    </tr> 
    <tr>  
      <th>우편번호</th> 
      <td>${dto.zipcode}</td> 
    </tr> 
    <tr>  
      <th>주소</th> 
      <td> 
        ${dto.address1} <br> 
        ${dto.address2} 
      </td> 
    </tr>
    <tr>  
      <th>직업</th> 
      <td>
      ${util:getJob(dto.job)}</td> 
    </tr> 
    <tr>  
      <th>가입날짜</th> 
      <td>${dto.mdate}</td> 
    </tr> 
  </TABLE>
  
  <DIV class='bottom'>
  	<input type='button' value='목록' onclick="location.href='${pageContext.request.contextPath}/admin/list?id=${dto.id}'">
    <input type='button' value='정보수정' onclick="location.href='update?id=${dto.id}'">
    <input type='button' value='사진수정' onclick="updateFile('${dto.id}','${dto.fname}')">
    <input type='button' value='패스워드 변경' onclick="location.href='updatePw?id=${dto.id}'">
    <input type='button' value='탈퇴' onclick="deleteM('${dto.id}','${dto.fname}')">
    <input type='button' value='다운로드'  
           onclick="location.href='${pageContext.request.contextPath}/download?dir=/storage&filename=${dto.fname}'">
  </DIV>
 
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 