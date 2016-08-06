<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<% request.setCharacterEncoding("utf-8"); 


 %> 
 <jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
 <jsp:useBean id="dto" class="img.ImgDTO" />

 <%
 String upDir=application.getRealPath("./img/storage");
 String tempDir = application.getRealPath("./img/temp");
 //업로드 처리 모듈객체 생성
 UploadSave upload = new UploadSave(request,-1,-1,tempDir);   //생성자가 매개변수값이 있는 생성자는 usebean을 사용하지못함. 
 //모듈객체를 이용해서 보내는 파라메터값과 파일받음
 String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
 FileItem fileItem = upload.getFileItem("filename");
 int size = (int)fileItem.getSize();
 String filename = null;
 if(size>0){
		   if(oldfile!=null )
		       Utility.deleteFile(upDir,oldfile);
     filename = UploadSave.saveFile(fileItem, upDir);
 }
int imgno=Integer.parseInt(upload.getParameter("imgno"));
String passwd=upload.getParameter("passwd");
String wname=UploadSave.encode(upload.getParameter("wname"));
String title=UploadSave.encode(upload.getParameter("title"));
String content=UploadSave.encode(upload.getParameter("content"));

dto.setContent(content);
dto.setTitle(title);
dto.setWname(wname);
dto.setFilename(filename);
dto.setPasswd(passwd);
dto.setImgno(imgno);

 %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(){
	var url = "read.jsp";
	url += "?imgno=<%=dto.getImgno()%>";	
    location.href=url;	
}
function listB(){
	var url = "list.jsp";	
	
    location.href=url;	
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
 
<DIV class="content">
 <%
 	 int  cnt = dao.passwdCheck(imgno, passwd);  //셋프로펄티로 dto에 저장되어있음
     if(cnt==1){
    	 dao.update(dto);
    	 out.print("글을 변경했습니다");
    	 %>
    	  <br>
    	    <DIV class='bottom'>
    	      <input type='button' value='변경 확인' onclick="read()">
    	      <input type='button' value='목록' onclick="listB()">
    	    </DIV>  	 
    
    <%
      }else{
      out.print("패스워드가 오류입니다");
     %>
     <br>
      <DIV class='bottom'>
      <input type='button' value='다시 시도' onclick="history.back();">       
      <input type='button' value='목록' onclick="listB()">
    </DIV>
 
  <%
  }
  %>
</DIV>	 

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
