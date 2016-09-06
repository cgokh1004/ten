<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<!--테이블 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 구글차트 -->
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">



new google.charts.load('current', {'packages':['corechart']});

var data = null;
var title = null;

var scjsonlist = ${jsonlist}

function drawChart() {	   
	   $.each(scjsonlist, function(index, value){
				  data=value.chart;
		          title=value.title;
		          var data = new google.visualization.arrayToDataTable(data);
		          var options = { title: title  };
		          var chart = new google.visualization.PieChart(document.getElementById(index));
		          chart.draw(data, options);
		});
   
  }


</script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 구글차트 -->
</head>

<body >

<div class="container">

<h2 align="center">결과보기(주제:&nbsp ${sulgroupname })</h2>
<table class="table table-bordered" align="center" width="50%">
<c:forEach items="${list}" var="surveydto" varStatus = "status">
<thead>
<tr class="danger">
    <th colspan="6" >
	Q) ${surveydto.askcontent}
	</th>	
</tr>

</thead>
<tbody>
	<tr>
	  <td>  번호 </td>
	  <td>  보기 </td>
	  <td>  응답자수 </td>
	  <td>  응답률 (%)</td>
	</tr>
	<c:forEach items="${surveydto.sulmunrdtoList}" var="sulmunrdto">

    <tr >
       <td>
			${sulmunrdto.chono}번
		</td>
		<td>	
			 ${sulmunrdto.chocontent}
	   </td>
	   <td>
			  ${sulmunrdto.thenumber}명 
		</td>
		<td>	 
			  ${sulmunrdto.theratio}
      </td>
</tr>	

			</c:forEach>
		
<tr >
  <td colspan="6" >
<!-- 그래프나타나는 곳 -->
<div id='${status.index}' style="height: 500px; width: 1200px">${surveydto.askcontent}</div>
  </td>
  </tr>
</c:forEach>
  </tbody>
</table>
</div>
<br><br>
  <DIV class='bottom' style="padding-center: 1%" >
     <input type='button' value='종료'  onclick="location.href='./list'">
  </div>
<script type="text/javascript">
 google.charts.setOnLoadCallback(drawChart);
</script>

</body>

</html>
