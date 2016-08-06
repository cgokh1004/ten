<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="utility.*" %>
<jsp:useBean id="dao" class="img.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="img.ImgDTO"></jsp:useBean>

<% request.setCharacterEncoding("utf-8"); 
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
int grpno=Integer.parseInt(upload.getParameter("grpno"));
int indent=Integer.parseInt(upload.getParameter("indent"));
int ansnum=Integer.parseInt(upload.getParameter("ansnum"));

dto.setFilename(filename);
dto.setPasswd(passwd);
dto.setWname(wname);
dto.setTitle(title);
dto.setContent(content);
dto.setGrpno(grpno);
dto.setIndent(indent);
dto.setAnsnum(ansnum);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변프록페이지닷!</title>
<script type="text/javascript">
function listB(){
	var url="list.jsp";
	
	location.href=url;
}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="content">
		<%
dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
int cnt= dao.reply(dto);
if(cnt==1){
	out.print("답변을 등록했습니다.");


%>

		<DIV class='bottom'>
			<input type='button' value='목록' onclick="listB()">
		</DIV>
		<%
}else{
	out.print("그냥 답변안쓰면 안되요?");
	%>

		<DIV class='bottom'>
			<input type='button' value='다시 시도' onclick="history.back();">
			<input type='button' value='목록' onclick="listB()">
		</DIV>
		<%} %>
	</div>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
