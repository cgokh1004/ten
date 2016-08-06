<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
Cookie[] cookies=request.getCookies();
Cookie cookie=null;

String sw=null;

if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		cookie=cookies[i];
		
		if(cookie.getName().equals("sw")){
			sw=cookie.getValue();
		}
	}
}
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>접속 환영</title> 
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
<%
if(sw!=null){
	out.println("재 접속을 환영합니다."+"<br>");
}else{
	out.println("처음 접속하셨군요?!!"+"<br>");
	Cookie wcookie=null;
	
	wcookie=new Cookie("sw","1");
	wcookie.setMaxAge(60);
	
	response.addCookie(wcookie);
}
%>
<br><br>
<A href='./welcome.jsp'>Server 접속</A>
</DIV>
 
<FORM name='frm' method='POST' action='./.do'>
  <TABLE class='table'>
    <TR>
      <TH></TH>
      <TD></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value=''>
    <input type='button' value='' onclick="location.href=''">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 