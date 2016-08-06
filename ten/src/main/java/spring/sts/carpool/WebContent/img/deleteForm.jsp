<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="img.ImgDAO" />
<%  
request.setCharacterEncoding("utf-8"); 
String imgno=request.getParameter("imgno");
String oldfile = request.getParameter("oldfile");

%>  
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지삭제</DIV>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
  <input type="hidden" name="imgno" value="<%=imgno%>">
   <input type="hidden" name="oldfile" value="<%=oldfile%>">
  
  <div class="content">
  비밀번호:
  <input type ="password" name="passwd">
  
  </div>
  
  <DIV class='bottom'>
  
    <input type='submit' value='삭제'>
    <input type='button' value='취소' onclick="history.back()">
     
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
 