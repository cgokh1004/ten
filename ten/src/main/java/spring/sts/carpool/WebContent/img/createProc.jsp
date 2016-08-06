<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="img.ImgDAO" />
<jsp:useBean id="dto" class="img.ImgDTO" />
<% 
request.setCharacterEncoding("utf-8"); 

    //업로드 폴더와 임시폴더 설정
    String upDir=application.getRealPath("./img/storage");
    String tempDir = application.getRealPath("./img/temp");
    //업로드 처리 모듈객체 생성
    UploadSave upload = new UploadSave(request,-1,-1,tempDir);   //생성자가 매개변수값이 있는 생성자는 usebean을 사용하지못함. 
    //모듈객체를 이용해서 보내는 파라메터값과 파일받음
    FileItem fileItem = upload.getFileItem("filename");
    int size = (int)fileItem.getSize();
    String filename = null;
    if(size>0){
        filename = UploadSave.saveFile(fileItem, upDir);
    }
    String passwd=upload.getParameter("passwd");
    String wname=UploadSave.encode(upload.getParameter("wname"));
    String title=UploadSave.encode(upload.getParameter("title"));
    String content=UploadSave.encode(upload.getParameter("content"));
 
    dto.setFilename(filename);
    dto.setPasswd(passwd);
    dto.setWname(wname);
    dto.setTitle(title);
    dto.setContent(content);
    
    int cnt = dao.create(dto);   
%> 
 
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
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" />
<!-- *********************************************** -->
 
<DIV class="title">게시물 등록 </DIV>
 
<DIV class="content">
<%
if(cnt==1){
   out.print("게시물을 등록하였습니다.");
 
}else{
   out.print("게시물 등록을 실패하였습니다.");
 
}
 
%>
</DIV>
<% if(cnt==1){ %>
<DIV class='bottom'>
  <input type='button' value='등록' onclick="location.href='createForm.jsp'">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input type='button' value='다시시도' onclick="history.back()">
  <input type='button' value='홈' onclick="location.href='../index.jsp'">
</DIV>
<%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 