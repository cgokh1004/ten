<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ page import="img.*" %>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>

<%
int imgno=Integer.parseInt(request.getParameter("imgno"));


ImgDTO dto=dao.readReply(imgno);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
	function input(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}

		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.filename.value == "") {
			alert("이미지를 올려주세요");
			f.filename.focus();
			return false;
		}
		var file = frm.filename.value;
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
		switch(fileExt){
		case "jpg":
		break;
		case "png":
		break;
		case "gif":
		break;
		case"jpeg":
		break;
		case "bmp":
		break;
		
		default:
			alert("JPG,JPEG,GIF,PNG,BMP파일로 올려주세요");
		 return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
		
		f.submit(); 
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
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='./replyProc.jsp' enctype="multipart/form-data"
  onsubmit="return input(this)">
<input type="hidden"	name="imgno"	value="<%=imgno %>">
<input type="hidden"	name="grpno"	value="<%=dto.getGrpno() %>">
<input type="hidden"	name="indent"	value="<%=dto.getIndent() %>">
<input type="hidden"	name="ansnum"	value="<%=dto.getAnsnum() %>">

  <TABLE class='table'>
    <TR>
      <TH>답변쟁이</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    
    <TR>
      <TH>타이틀</TH>
      <TD><input type="text" name="title" size='80' value="<%=dto.getTitle()%>"></TD>
    </TR>
    
    <TR>
      <TH>컨텐츠</TH>
      <TD><textarea name="content" rows='20' cols='80' maxlength="5000"></textarea></TD>
    </TR>
    <TR>
      <TH>이미지업로드</TH>
      <TD><input type="file" name="filename" ></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" placeholder="비밀번호를 써주세요!"></TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
