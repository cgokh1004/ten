<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
            <h1 >리서치 작성이 시작됩니다.</h1>
			<h2>
				<p>본 리서치는 저희 회사에 대한 것이며, 본 리서치결과는 상업적인 목적으로 사용하지 않으며</p>
				<p>기업 마케팅에만 적용되어 고객들에게 더 나은 서비스를 위해 시행하는 것입니다.</p>
			</h2>
                   <c:forEach items="${list}" var="surveydto">
<%-- 			${surveydto.sulno} --%>
			${surveydto.askcontent}
			<c:forEach items="${surveydto.sulmunrdtoList}" var="sulmunrdto">
				${sulmunrdto.chono}
				${sulmunrdto.chocontent}
			</c:forEach>
			<br>
	</c:forEach>

</body>
</html>