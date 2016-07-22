<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
String root = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
</head>
<body leftmargin="0" topmargin="0">
 
 
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table style="width: 100%">
  <tr>
    <td>
        <img src="<%=root %>/menu/images/main-03.jpg" width='100%' height='40%'>
    </td>
  </tr>
  
  <tr>
    <td>
      <div style="font-size: 24px;">JSP/Spring Developer Support page.</div>
    </td>
  </tr>
 
  <tr>
    <td>
    | 홈 | 메뉴1 | 메뉴2 | 메뉴3 | 메뉴4 | 메뉴5 | 메뉴6 | 메뉴7 | 메뉴8 | 메뉴9 | 메뉴10 |
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">
내용 출력<br>
</div>
<!-- 내용 끝 -->
 
 
 
<!-- 하단 메뉴 시작 -->
<div style="width: 100%; background-color: #EEEEEE; text-align: center; margin-top: 2em;">
    2014 SOLDESK JSP Developer
</div>
<!-- 하단 메뉴 끝 -->
 
 
</body>
</html>