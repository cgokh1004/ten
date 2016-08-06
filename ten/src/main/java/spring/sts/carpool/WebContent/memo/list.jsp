<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./ssi.jsp" %>
<%@ page import="utility.*"%>
<jsp:useBean id="dao" class="memo.memoDAO"/>
<%
request.setCharacterEncoding("utf-8");
int nowPage=1;
int recordPerPage=5;
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int sno=((nowPage-1)*recordPerPage)+1;
int eno=nowPage*recordPerPage;
String col=Utility.nullCheck(request.getParameter("col"));
String word=Utility.nullCheck(request.getParameter("word"));

if(col.equals("total")) word="";

Map map =new HashMap();
map.put("sno",sno);
map.put("eno",eno);
map.put("col",col);
map.put("word",word);
List<memoVO> list=dao.list(map);

int total=dao.total(col,word);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">
<style>
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
<script type="text/javascript">
	function read(memono){
		var url = "./read.jsp";
		url = url + "?memono=" + memono;
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		//띄어쓰기 주의 -_-) ? memo = (x) ?memo= (o)
		location.href = url; //자바스크립트에서 -get 방식- 링크 보내기
		
	}

</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<DIV class='title'>메모 목록</DIV>
	<div class="search">
	<form method="post" action="./list.jsp">
		<select name="col">
			<option value="title"
			<%if(col.equals("title")) %> selected
			>제목</option>
			<option value="wdate"
			<%if(col.equals("wdate")) %> selected
			>날짜</option>
			<option value="hit"
			<%if(col.equals("hit")) %> selected
			>조회수</option>
			<option value="total"
			<%if(col.equals("total")) %> selected
			>전체출력</option>
		</select>
	<input type="text" name="word" value=<%=word%>>
	<input type="submit" value="검색">
	</form>
	</div>

	<Table>
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>날짜</TH>
			<TH>조회수</TH>
		</TR>

		<%
			if (list.size()==0) {
		%>
		<TR>
			<TD colspan='4'>등록된 메모가 없습니다.</TD>
		</TR>
		<%
			} // end if
			else {
				for(int i=0; i<list.size();i++){
					memoVO vo=list.get(i);
		%>
		<TR>
			<TD><%=vo.getMemono()%></TD>
			<TD><a href = "javascript:read('<%=vo.getMemono()%>')"><%=vo.getTitle()%></a>
			<%if(Utility.compareDay(vo.getWdate())) {%>
			<img src="../images/new.gif">
			<%}%>
			</TD>
			<TD><%=vo.getWdate()%></TD>
			<TD><%=vo.getViewcnt()%></TD>

		</TR>

		<%
			} //for end

			} //if end
		%>
	</Table>

	<DIV class='bottom'>
	<%=new Paging().paging2(total, nowPage, recordPerPage, col, word)%>
		<input type="button" value='등록'
			onclick="location.href='./createForm.jsp'">
	</DIV>




<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>