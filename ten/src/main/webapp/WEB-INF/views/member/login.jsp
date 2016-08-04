<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td {
		text-align: left;
		padding-left: 15px;
		margin: 15px;
	}
	hr {
		border : solid 2px #4ABFD3;
	}
	th {
		font-size: 18px;
		text-align: left;
		padding-left: 15px;
		margin-bottom: 15px;
		margin-top: 15px;
		padding-bottom: 15px;
	}
	.title {
		color : #4ABFD3;
		text-align: left;
		font-weight: bold;
		font-size: 21px;
		font-family: 굴림;
		padding-left: 250px;
		padding-top: 20px;
	}
	a:link{
		color : black;
		text-decoration: none;
	}
	a:VISITED {
		color : black;
		text-decoration: none;
	}
	a:HOVER {
		color : red;
		text-decoration: none;
	}
</style>
</head>
<body>
<div class = "title">로그인</div>
<table style = "margin : 0 auto">
	<tr>
		<td colspan="5" style = "padding-top: 20px; padding-bottom: 20px;"><hr></td>
	</tr>
	<tr>
		<td style = "width : 1200px;">
			<FORM name='frm' method='POST' action='./login'>
					<TABLE class='table'>
						<TR>
							<TD><input class = "text1" type="text" name="id" size="20"
								value='${c_id_val}' placeholder="아이디"> 
								<c:choose>
									<c:when test="${c_id == 'Y'}">
										<input type='checkbox' name='c_id' value='Y' checked='checked'>ID저장
									</c:when>
									<c:otherwise>
										<input type='checkbox' name='c_id' value='Y'> ID저장
									</c:otherwise>
								</c:choose>
							</TD>
						</TR>
						<TR>
							<TD><input class = "text1" type="password" name="passwd" size="20" placeholder="비밀번호"></TD>
						</TR>
					</TABLE>
			
					<DIV class='bottom'>
						<input class = "button1" type='submit' value='로그인'>
						<input class = "button1" type='button' value='회원가입' onclick="location.href='./create'">
					</DIV>
				</FORM>
		</td>
	</tr>
</table>
</body>
</html>