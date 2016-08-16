<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
	function input(f){
		if(f.passwd.value==""){
			alert("비밀번호를 써주세요")
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value==""){
			alert("비밀번호를 한번더 써주세요")
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value!==f.repasswd.value){
			alert("비밀번호가 같은지 확인해주세요")
			f.repasswd.value="";
			f.repasswd.focus();
			return false;
		}
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경</DIV>
<FORM name='frm' 
      method='POST' 
	  action='updatePw'
	  onsubmit="return input(this)">
 <input type="hidden" name='id' value='${param.id}'>
  <TABLE class='table'>
    <TR>
      <TH>*패스워드</TH>
      <TD><input type="password" name="passwd" size="15" value=""></TD>
      <TD>패스워드를 적어주세요.</TD>
    </TR>
       <TR>
      <TH>*패스워드 확인</TH>
      <TD><input type="password" name="repasswd" size="15" value=""></TD>
      <TD>패스워드를 확인합니다.</TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='패스워드 수정'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 