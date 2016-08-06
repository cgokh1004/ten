<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
request.setCharacterEncoding("utf-8"); 
Cookie[] cookies=request.getCookies();
Cookie cookie=null;

String name=null;
int kuk=0;
int eng=0;

for(int i=0;i<cookies.length;i++){
	cookie=cookies[i];
	
	if(cookie.getName().equals("name")){
		name=cookie.getValue();
	}else if(cookie.getName().equals("kuk")){
		kuk=Integer.parseInt(cookie.getValue());
	}else if(cookie.getName().equals("eng")){
		eng=Integer.parseInt(cookie.getValue());		
	}
}
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>쿠키읽어오기(Cookie객체의 사용)</title> 
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
 if( name!=null){
	 out.println("성명:"+name+"<br>");
	 out.println("국어:"+kuk+"<br>");
	 out.println("영어:"+eng+"<br>");
	 out.println("총점:"+(kuk+eng)+"<br>");
	 out.println("평균:"+(kuk+eng)/2+"<br>");
	 out.println("30초 후 쿠키는 인식이 되지 않습니다."+"<br>");
 	}else{
 		out.println("쿠키를 읽어 들일수 없습니다."+"<br>");
 }
 %>
</DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 