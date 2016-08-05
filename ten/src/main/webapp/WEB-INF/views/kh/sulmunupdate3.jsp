<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="spring.model.survey.*" %>
    <% 	
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	SurveyDTO dto = (SurveyDTO)request.getAttribute("dto");
	
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language="javascript">

var oTbl;
//Row 추가
var numm = 1;

function insRow() {

  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();

  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<span>" + (numm+1) + "</span><input type=text name='chocontent" + (numm+1) + "' style=width:500px; height:20px;> ";
  frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
  oCell.innerHTML = frmTag;
  
  numm=numm+1;
  
  document.frm.numscore.value = numm;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.rows.length-1);
  numm=numm-1;
}


function frmCheck()
{
  var frm = document.form;
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText[]" )
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
             frm.elements[i].focus();
             return;
          }
      }
   }
 }

</script>
<script type="text/javascript">
function del(f){
	alert("정말 삭제하시겠습니까");
	f.document.focus();
	return false;
}

function list(){
	var url ="list"
		 
		location.href=url;
}



</script>


</head>
<body>

<h2>수정</h2>
<FORM name='frm' method='POST' action='/ten/survey/update'>

  <TABLE border="1px solid" bordercolor="green" width="600px">
          
      <TR>
      
      <TD >설문제목: &nbsp;<input type="text" name="sulgroupname" style="width:500px; height:20px;" >${surveydto.sulgroupname }</TD></TR> 
    
      <TR>
      
      <TR>
     
      <TD >진행상태: &nbsp;<input type="text" name="sulstate" style="width:500px; height:20px;">${surveydto.sulstate }</TD></TR> 
    
      <TR>
     
      <TD >질문내용: &nbsp;

      <div>
      1. ${surveydto.askcontent}<br>
      2. ${surveydto.askcontent}<br>
      3. ${surveydto.askcontent}<br>
      4. ${surveydto.askcontent}

      </div>
      </TD>
    </TR> 
    		
     </TABLE>

  
</FORM>
 
  <DIV class='bottom' style="padding-left: 25%">
     <input type='submit' value='수정' onclick="list()">
     <input type='button' value='종료'  onclick="location.href='./list'">   
     <input type='button' value='삭제' onclick="del()">
  </DIV>
    
</body>
</html>