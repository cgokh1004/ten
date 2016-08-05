<%@ page contentType="text/html; charset=UTF-8" %> 

 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/top.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body> 
<script type="text/javascript">
function listM(){
	var url = "../survey/list";
	url += "?col="+col;
	url += "&word=${dto.word}";
	url += "&nowPage=${dto.nowpage}";
	
	location.href=url;	
}
</script>
</head>
<body>
<DIV class="title">삭제 확인</DIV>
 
<Form name='frm' method='POST' action='delete'>
  <input type='hidden' name='sulno' size='30' value='${dto.sulno}'>
  <input type='hidden' name='col' size='30' value='${dto.col}'>
  <input type='hidden' name='word' size='30' value='${dto.word }'>
  <input type='hidden' name='nowPage' size='30' value='${dto.nowPage }'>
  
  <DIV class="content">
    삭제를 하면 복구 될 수 없습니다.<br><br>
    삭제하시려면 삭제 처리 버튼을 클릭하세요.<br><br>
    취소는 '목록' 버튼을 누르세요.
    <br><br>
    <input type='submit' value='삭제 처리'>
    <input type='button' value='목록' onclick="listM()">
  </DIV>  
</Form>
<!-- *********************************************** -->
</html> 

