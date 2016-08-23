<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link class="include" rel="stylesheet" type="text/css" href="jquery.jqplot.min.css" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="jquery.jqplot.min.js"></script>

<script type="text/javascript" src="plugins/jqplot.pieRenderer.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
    $("#hide").click(function(){
        $("p").hide();
    });

$.jqplot ('graph', [[['첫번째', 50], ['두번째', 22], ['세번째', 38], ['네번째', 30]]], 
        { 
          seriesDefaults: {
            //원형으로 렌더링
            renderer: $.jqplot.PieRenderer,
            //원형상단에 값보여주기(알아서 %형으로 변환)
            rendererOptions: {
              showDataLabels: true
            }
          },
          //우측 색상별 타이틀 출력
          legend: { show:true, location: 'e' }
        }
)

</script>
</head>

<body>
${sulgroupname }
<h2>결과보기</h2>



<table border="2px solid" bordercolor="blue">

<c:forEach items="${list}" var="surveydto">

<tr>
    <td>
	${surveydto.askcontent}
	</td>
</tr>
<tr>	
  <td>
	<c:forEach items="${surveydto.sulmunrdtoList}" var="sulmunrdto">
<div id="graph" style="width:300px; height:300px;">
   <br><br>
			${sulmunrdto.chono}번 선책한 보기항목은${sulmunrdto.chocontent} 이며	선택자수는 ${sulmunrdto.thenumber}명 이며, 그룹내 비율은 ${sulmunrdto.theratio} 입니다!.
<!-- 	       <ol> -->
<!-- 					<li class="iGraph"> -->
<!-- 						<span class="gBar"><span class="gAction" style="width:10%"></span></span> -->
<%-- 						<span class="gPercent"><strong>${sulmunrdto.theratio}</strong>%</span> --%>
<!-- 					</li>			 -->
<!--          </ol> -->
</div>
	<br>	
			</c:forEach>
	
	</td>
</tr>			
</c:forEach>




</table>

</body>
</html>