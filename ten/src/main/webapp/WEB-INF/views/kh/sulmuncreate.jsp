<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function list(){
	var url ="list"
		 
		location.href=url;
}



</script>

<style type="text/css">

/* 하단 메뉴 */
.bottom{
  margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}

</style>

</head>
<body>

<h2 align="center">설문등록</h2>
<FORM name='frm' method='POST' action='/ten/survey/create'>
<input type="hidden" name="numscore" value="1">
<div align="center">
<table>
<tr>
<td>
  <TABLE border="1px solid" bordercolor="green" width="600px">
          
      <TR>
      
      <TD >설문제목: &nbsp;<input type="text" name="sulgroupname" style="width:500px; height:20px;"  value="${sulgroupname}" placeholder="설문제목을 입력해주세요">
      
      </TD>
      </TR>    
      
      <TR>     
      <TD >진행상태: &nbsp;<select name="sulstate" style="width:20%;" >
						                        <option value="진행" selected="selected">진행</option>
						                        <option value="완료">완료</option>                    
						                        </select>
      </TD></TR> 
    
      <TR>
     
      <TD >질문내용: &nbsp;<textarea name = "askcontent" cols="60" rows="10" placeholder="Q)질문을 입력해주세요"></textarea></TD>
    </TR> 
    		
        <tr>        
         <td height="25" >
          <table id="addTable" width="700" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
            <tr>                          
              <td>보기항목: &nbsp;<input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
      
         <font color="#FF0000">
         <br>
        <span name="index">1</span> <input type="text" name="chocontent1" style="width:500px; height:20px;" placeholder="보기항목을 입력해주세요"></td>
              <td align="center"></td>
            </tr>
          </table></td>
        </tr>
       </table>
      </td>
   </tr>


 </table>

  <DIV class='bottom' style="padding-center: 1%" >
      <input type='submit' value='저장' onclick="list()">
     <input type='button' value='종료'  onclick="location.href='./list'">
  </div>

 
  </DIV>
</FORM>
</body>
</html>