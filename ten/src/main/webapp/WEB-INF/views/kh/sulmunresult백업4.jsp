<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 3가지 파일이 jqPlot의 기본적인 include -->
<link class="include" rel="stylesheet" type="text/css" href="jquery.jqplot.min.css" />



<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="jquery.jqplot.min.js"></script>

<!--원형그래프위한  jqPlot의 기본적인 include -->
<script type="text/javascript" src="plugins/jqplot.pieRenderer.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//1번째 입력값 (그려진 영역의 id값)
    //2번째 입력값 (그래프내에 들어갈 데이터 값)
     $.jqplot ('graph', [[1,2,3,4,5,300,30]]);
});
</script>

</head>

<body>

<div id="graph" style="width:300px; height:300px;">

<script type="text/javascript">
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
);
</script>
</div>
</body>
</html>
