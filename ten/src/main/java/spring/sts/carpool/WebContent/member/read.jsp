<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="member.*,utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<% 
request.setCharacterEncoding("utf-8");
    //관리자 회원목록에서 이름을 클릭하고 올때
String id = request.getParameter("id");
 
    //일반사용자가 로그인후 나의정보를 클릭하고 올때
    if(id==null){
        id = (String)session.getAttribute("id");
    }
    
    MemberDTO dto = dao.read(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: 맑은고딕; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteM(id,oldfile){
if(confirm("정말탈퇴 하겠습니까?")){
var url = "deleteForm.jsp";
url = url +"?id="+id;
url = url +"&oldfile="+oldfile;
 
location.href=url;
 
}
 
}
function updateFile(id,oldfile){
var url ="updateFileForm.jsp"
url = url + "?id="+id;
url = url + "&oldfile="+oldfile;
 
location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 
  <TABLE class='table'>
    <TR>
      <TD colspan="2">
       <img src="./storage/<%=dto.getFname()%>">
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD><%=dto.getId() %></TD>
    </TR>
    <tr> 
      <th>이름</th> 
      <td><%=dto.getMname() %></td> 
    </tr> 
    <tr> 
      <th>전화번호</th> 
      <td><%=dto.getTel() %></td> 
    </tr>           
    <tr>  
      <th>이메일</th> 
      <td><%=dto.getEmail() %></td> 
    </tr> 
    <tr>  
      <th>우편번호</th> 
      <td><%=dto.getZipcode() %></td> 
    </tr> 
    <tr>  
      <th>주소</th> 
      <td> 
        <%=dto.getAddress1() %> <br> 
        <%=Utility.nullCheck(dto.getAddress2()) %> 
      </td> 
    </tr>
    <tr>  
      <th>직업</th> 
      <td> 
       <%=Utility.getCodeValue(dto.getJob())%></td> 
    </tr> 
    <tr>  
      <th>가입날짜</th> 
      <td><%=dto.getMdate().subSequence(0, 10)%></td> 
    </tr> 
  </TABLE>
  
  <DIV class='bottom'>
  	<input type='button' value='목록' onclick="location.href='list.jsp?id=<%=dto.getId()%>'">
    <input type='button' value='정보수정' onclick="location.href='updateForm.jsp?id=<%=dto.getId()%>'">
    <input type='button' value='사진수정' onclick="updateFile('<%=dto.getId()%>','<%=dto.getFname()%>')">
    <input type='button' value='패스워드 변경' onclick="location.href='updatePwForm.jsp?id=<%=dto.getId()%>'">
    <input type='button' value='탈퇴' onclick="deleteM('<%=dto.getId()%>','<%=dto.getFname()%>')">
    <input type='button' value='다운로드'  
           onclick="location.href='<%=request.getContextPath() %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">
  </DIV>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 