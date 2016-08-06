<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="img.*" %>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<%
String oldfile = request.getParameter("oldfile");
  int imgno = Integer.parseInt(request.getParameter("imgno"));
  ImgDTO dto = dao.read(imgno);
  
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
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='updateProc.jsp' enctype="multipart/form-data"
		  onsubmit="return input(this)">
<input type="hidden" name="imgno" value="<%=imgno%>">
<input type="hidden" name="oldfile" value="<%=oldfile%>">

  <TABLE >
    <TR>
      <TH>성명</TH>
      <TD><input type='text' name='wname' value="<%=dto.getWname()%>" size='40'></TD>
    </TR>  
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name='title' value="<%=dto.getTitle() %>" size='40' ></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><TEXTAREA name='content' rows='10' cols='40' ><%=dto.getContent() %></TEXTAREA></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type='password' name='passwd'></TD>
    </TR>    
    <TR>
      <TH>이미지첨부</TH>
      <TD><input type='file' name='filename' ></TD>
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
