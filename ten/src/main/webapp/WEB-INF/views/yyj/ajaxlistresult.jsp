<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
{
<c:if test="${result>0 }"> "result": "success",</c:if>
"paging": "${paging }",
"total": "${total }",
"avgscore": "${avgscore }",
"data":{
				"member":
				[
				
				<c:forEach items="${list }" var="dto">
					{
					"frev_no":"${dto.frev_no}",
					"score":"${dto.score}",
					"content":"${dto.content}",
					"fooddate":"${dto.fooddate}",
					"id":"${dto.id}"
					}, 		
				</c:forEach>		
            ]
            
          }
}


		