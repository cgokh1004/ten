<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*,bbs.*,utility.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%
//페이징관련 변수 선언
int nowPage=1;//현재페이지
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage = 5;//한페이지당 보여줄 레코드 개수
int sno=((nowPage-1)*recordPerPage)+1;
int eno= nowPage*recordPerPage;
//검색관련 변수 선언
String col=Utility.nullCheck(request.getParameter("col"));
String word=Utility.nullCheck(request.getParameter("word"));

if(col.equals("total")) word="";

Map map=new HashMap();
map.put("sno", sno);
map.put("eno", eno);
map.put("col",col);
map.put("word",word);
List<BbsDTO> list=dao.list(map);
int total=dao.total(col,word);
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
<script type="text/javascript">
function read(bbsno){
	var url="read.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}

</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 
 
<DIV class="title">목록</DIV>
 
 <div class="search">
 <form method='post' action="./list.jsp">
 <select name="col">
 	<option value="wname"
 	<%if(col.equals("wname")) %> selected
 	>성명</option>
 	<option value="title"
 	<%if(col.equals("title")) %> selected
 	>제목</option>
 	<option value="content"
 	<%if(col.equals("content")) %> selected
 	>내용</option>
 	<option value="total"
 	<%if(col.equals("total")) %> selected
 	>전체출력</option>
 	</select>
 	<input type="text"  name="word" value="<%=word %>">
 	<input type="submit" value="검색"> </div>
 	
  <TABLE class='table'>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>성명</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>grpno</TH>
      <TH>indent</TH>
      <TH>ansnum</TH>
    </TR>
    <%if(list.size()==0){%>
    <tr>
    	<td colspan="8" align="center">등록된 글이 없습니다.</td>
    </tr>
    <%}else{ 
		for(int i=0;i<list.size();i++){
    		BbsDTO dto=list.get(i);
    		%>
    <TR>
      <TD text align="center"><%=dto.getBbsno()%></TD>
      <TD width="35%";>
      <% for(int j=0;j<dto.getIndent();j++) {
      out.print("&nbsp;&nbsp;");
      }
      if(dto.getIndent()>0)out.print("[답변]");
      %>
      <a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
      <%if(Utility.compareDay(dto.getWdate().substring(0, 10))){ %>
      <img src="../images/new.gif">
      <%} %>
      </TD>
      <TD><%=dto.getWname()%></TD>
      <TD text align="center"><%=dto.getViewcnt()%></TD>
      <TD text align="center"><%=dto.getWdate().substring(0, 10)%></TD>
      <TD text align="center"><%=dto.getGrpno()%></TD>
      <TD text align="center"><%=dto.getIndent()%></TD>
      <TD ><%=dto.getAnsnum()%></TD>
    </TR>
    <%
		
		}
    }
    %>     
  </TABLE>
  
  <DIV class='bottom'>
    <%=new Paging().paging3(total, nowPage, recordPerPage, col, word) %>
    <br>
    <input type='button' value='등록' onclick="location.href='createForm.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 