<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
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
<body>

<!-- *********************************************** -->
 
<DIV class="content">

평창 동계 올림픽 SBS에서 생방송<br></br> 
    1, 2, 3부로 나누어 생방송합니다.<br></br> 
    많은 시청 바랍니다.<br></br> 
    1차 투표에서 46표 이상 취득시 개최지 확정!<br></br> 
 
    <form name="frm" method="post" 
        action="./notice_cookie.jsp"> 
      <input type="checkbox" value="close" 
        onclick="document.frm.submit();">1분간 창 열지 않기 
    </form>
  </div> 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 