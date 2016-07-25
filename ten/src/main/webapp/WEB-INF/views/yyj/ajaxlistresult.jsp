<%@ page contentType="text/plain; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
{
"data":{
				"member":
				[
				
				<c:forEach items="${list }" var="dto">
					{
					"score":"${dto.score}",
					"content":"${dto.content}",
					"fooddate":"${dto.fooddate}",
					"id":"${dto.id}"
					}, 		
				</c:forEach>		
            ]
            
          }
}


		