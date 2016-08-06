<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
 
#idcss{
  color: #FF0000;             /* 빨간색 */
  background-color: #FFFF00;  /* 노란색 */
  font-size: 50px;
  text-align: center;
  width: 35%;
  margin: 0 auto;
}
</style> 
<link href="./style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
  <DIV class='title'>게시판 version 2.0</DIV>
  
  <DIV class='content'>내용</DIV>
  
  <TABLE class='table'>
    <TR>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>내용</TH>
    </TR>
    <TR>
      <TD align='center'>1</TD>
      <TD align='center'>월요일</TD>
      <TD>첫눈</TD>
    </TR>
    <TR>
      <TD align='center'>2</TD>
      <TD align='center'>화요일</TD>
      <TD>메모장 제작</TD>
    </TR>
    <TR>
      <TD align='center'>3</TD>
      <TD align='center'>수요일</TD>
      <TD>메모장 테스트</TD>
    </TR>
  </TABLE>
 
  <DIV class='content'>
    <A href='http://www.kma.go.kr'>기 상 청</A><br>
  </DIV>  
  
  <DIV id='idcss'>
    <br>
    고유한 CSS 적용
    <br><br>
  </DIV>
  <DIV class='bottom'>하단 메뉴</DIV>
</body> 
</html> 