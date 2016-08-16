<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>

 
<DIV class="title">ID 중복확인</DIV>
<DIV class='content'>  
<FORM name='frm' method='POST' action='id_proc'>
ID를 입력하세요<br><br>
  <TABLE class='table'>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" size='20'></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='중복확인'>
    <input type='button' value='취소' onclick="window.close()">
  </DIV>
</FORM>
 </DIV>
 

</body>

</html> 