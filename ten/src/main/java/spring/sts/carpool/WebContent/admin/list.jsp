<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="member.*,java.util.*,utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
 
<% request.setCharacterEncoding("utf-8");
String root=request.getContextPath();
 
   //검색관련
   String col = Utility.nullCheck(request.getParameter("col"));
   String word = Utility.nullCheck(request.getParameter("word"));
 
   if(col.equals("total"))word="";
   
   //paging 관련
   int nowPage =1; //현재페이지
   int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
   if(request.getParameter("nowPage")!=null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }
   
   int sno = ((nowPage -1) * recordPerPage) +1;    
   int eno =  nowPage * recordPerPage;
   
   Map map = new HashMap();
   map.put("col", col);
   map.put("word", word);
   map.put("sno", sno);
   map.put("eno", eno);
   
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
 
<link href='../css/style.css' rel='Stylesheet' type='text/css'> 
 
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
 
<DIV class="title">회원 목록</DIV> 
 
<DIV class="content"> 
  <input type='button' value='회원 등록'  onclick="location.href='./createForm.jsp'"> 
 
<FORM method="POST" action="./list.jsp">
<select name="col">
<option value="mname"
<%if(col.equals("mname")) out.print("selected='selected'"); %>
>성명</option>
<option value="email"
   <%if(col.equals("email")) out.print("selected='selected'"); %> 
>이메일</option>
<option value="id"
   <%if(col.equals("id")) out.print("selected='selected'"); %> 
>아이디</option>
<option value="total"
   <%if(col.equals("total")) out.print("selected='selected'"); %> 
>전체출력</option>
</select>
<input type="text" name="word" value="<%=word %>">
<input type="submit" value="검색" />
</FORM>
</DIV>
 
<% 
List<MemberDTO> list = dao.list(map);
 
for(int i=0; i < list.size(); i++){ 
  MemberDTO dto = list.get(i);   
   
%> 
 
<TABLE border='1' align='center' width='70%'> 
  
  <TR> 
    <TD rowspan='5' width='20%' align="center">
    <IMG src='<%=root %>/member/storage/<%=dto.getFname() %>' width='100%'></TD> 
    <TH width='20%'>아이디</TH> 
    <TD width='60%'><A href='<%=root %>/member/read.jsp?id=<%=dto.getId() %>'><%=dto.getId() %></A></TD>
  </TR>
   
  <TR> 
    <TH>성명</TH> 
    <TD><%=dto.getMname() %></TD> 
  </TR> 
  <TR> 
    <TH>전화번호</TH> 
    <TD><%=dto.getTel() %></TD> 
  </TR> 
  <TR> 
    <TH>이메일</TH> 
    <TD><%=dto.getEmail() %></TD> 
  </TR> 
  <TR> 
    <TH>주소</TH> 
    <TD><%=dto.getAddress1() %> 
    
        <% if (dto.getAddress2() != null){
             out.print(dto.getAddress2());
           } 
        %>
        
    </TD> 
  </TR> 
 
</TABLE> 
<BR> 
<% 
} 
%> 
 
<DIV class="bottom"> 
<%=paging %>
</DIV> 
 
 
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 