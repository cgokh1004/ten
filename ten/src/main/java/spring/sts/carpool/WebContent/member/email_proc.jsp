<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<% 
request.setCharacterEncoding("utf-8"); 
String email=request.getParameter("email");
int cnt=dao.duplicateEmail(email); 

%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function use(){
	opener.frm.eclick.value+=1;
	opener.frm.email.value='<%=email%>';
	self.close();
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

<body>

 
<DIV class="title">E-mail 중복확인</DIV>
 <div class="content">
입력된 E-mail:<%=email %><br><br>
<%
if(cnt==1){
	out.print("이미 생성된 E-mail 입니다.<br><br>");
}else{
	out.print("사용가능한 E-mail 입니다.<br><br>");
	out.print("<input type='button' value='사용' onclick='use()'>");
}
%> 
   </div>
  <DIV class='bottom'>
    <input type="button" value='다시시도' onclick="location.href='email_form.jsp'">
    <input type='button' value='닫기' onclick="window.close();">
  </DIV>


</body>

</html> 