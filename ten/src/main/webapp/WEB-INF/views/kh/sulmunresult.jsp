<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 구글차트 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript">
     var data1 = null;
     var title1 = null;
     $(function(){
 	    $.get( 
               "http://localhost:8000/ten/survey/result",
               {
                   "name":"hong",
               },
               function(data, textStatus) {
                  //alert(textStatus);
                   result=eval("("+data+")");
                   data1=result.chart;
                   title1=result.title;
                   //alert(title1);
                   //alert(data1);
               }
           ); 
         	
     });
     google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawChart);
     

     function drawChart() {

       var data = google.visualization.arrayToDataTable(data1);

       var options = { title: title1  };

       var chart = new google.visualization.PieChart(document.getElementById('piechart'));

       chart.draw(data, options);
     }
    </script>
</head>

<body align ="center">

${sulgroupname }
<h2 align="center">결과보기</h2>

${joby}

<table border="2px solid" bordercolor="blue" align="center">

<c:forEach items="${list}" var="surveydto" varStatus = "status">


<tr>
    <td colspan="6">
	${surveydto.askcontent}
	</td>
</tr>

	<c:forEach items="${surveydto.sulmunrdtoList}" var="sulmunrdto">
   <br><br>
   <tr>
       <td>
			${sulmunrdto.chono}번
		</td>
		<td>	
			 선택한 보기항목은${sulmunrdto.chocontent} 이며
	   </td>
	   <td>
			 선택자수는 ${sulmunrdto.thenumber}명 이며, 
		</td>
		<td>	 
			 그룹내 비율은 ${sulmunrdto.theratio} 입니다!.
      </td>
      <td>
			${sulmunrdto.chocontent}
	</td>
	<td>		
			${sulmunrdto.theratio}
	<br>	
   </td>
</tr>	
			</c:forEach>
		
<tr >
  <td colspan="6" height="80px">
<!-- 그래프나타나는 곳 -->
<div id='${status.index}'>${surveydto.askcontent}</div>
<script type="text/javascript">
document.getElementById('${status.index}').innerHTML = "ㅁㄴㅇㄹ";

// 이 아래에 차트만들기~

</script>
  </td>
  </tr>
  ${status.index }

</c:forEach>


</table>
<br><br>
  <DIV class='bottom' style="padding-center: 1%" >
     <input type='button' value='종료'  onclick="location.href='./list'">
  </div>


</body>
</html>
