<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*,img.*, utility.*" %>
<jsp:useBean id="dao" class = "img.ImgDAO"/>

<%
String col = Utility.nullCheck(request.getParameter("col"));
String word = Utility.nullCheck(request.getParameter("word"));

if(col.equals("total")) word = "";

int nowPage = 1;
int recordPerPage = 5;

if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int sno = ((nowPage-1)*recordPerPage)+1 ;
int eno = nowPage * recordPerPage ;

Map map = new HashMap();
map.put("sno", sno);
map.put("eno", eno);
map.put("col", col);
map.put("word", word);

List<ImgDTO> list = dao.list(map);
int total = dao.total(col,word);

String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

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

<script type = "text/javascript">
function read(imgno){
	var url = "./read.jsp";
	url = url+"?imgno=" + imgno;
	
	loction.href = url;
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지 목록</DIV>
<br>

<div class="search"> 
<FORM method='POST' action='./list.jsp'>
	<select name="col">
		<option value = "wname"
		<% if(col.equals("wname")) out.print("selected='selected'");%>
		>작성자</option>
		<option value = "title"
		<% if(col.equals("title")) out.print("selected='selected'");%>
		>제목</option>
		<option value = "content"
		<% if(col.equals("content")) out.print("selected='selected'");%>
		>내용</option>
		<option value = "total"
		<% if(col.equals("total")) out.print("selected='selected'");%>
		>전체 출력</option>
	</select>
	<input type = "text" name = "word" value=<%=word %>>
	<input type = "submit" value = "검색">
</form>
</div>
<br>

<%
for(int i=0; i<list.size(); i++){
	ImgDTO dto = list.get(i);
%>
<TABLE border='1' align='center' width='70%'>
   <TR>
   	<TD rowspan = '8' width = 20% align="center">
   	<Img src = './storage/<%=dto.getFilename()%>' width='100%'></TD>
   	<TH width='20%'>제목</TH>
   	<TD width = '60%'>
            <%
                 for(int j=0; j<dto.getIndent(); j++){
                        out.println("&nbsp;&nbsp;");
                 }
                 if(dto.getIndent()>0)
                        out.print("[답변]");
 
            %>
   	<a href='./read.jsp?imgno=<%=dto.getImgno()%>'><%=dto.getTitle() %></a></TD>
   </TR>
   <TR>
    <TH>작성자</TH>
    <TD><%=dto.getWname() %></TD>
   </TR>
   <TR>
    <TH>내용</TH>
    <TD><%=dto.getContent() %></TD>
   </TR>
   <TR>
    <TH>이미지파일명</TH>
    <TD><%=dto.getFilename() %></TD>
   </TR>
   <TR>
    <TH>grpno</TH>
    <TD><%=dto.getGrpno() %></TD>
   </TR>
   <TR> 
    <TH>indent</TH>
    <TD><%=dto.getIndent() %></TD>
   </TR>
   <TR>
    <TH>ansnum</TH>
    <TD><%=dto.getAnsnum() %></TD>
   </TR> 
   <TR>
    <TH>imgno</TH>
    <TD><%=dto.getImgno() %></TD>
   </TR>
  
  
  </TABLE>
  <BR>
  <%
  }
 %>
  
  <DIV class='bottom'>
  	<%=paging%>
  	<br>
    <input type='button' value='등록' onclick = "location.href = './createForm.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 