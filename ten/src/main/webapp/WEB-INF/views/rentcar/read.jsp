<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function listB() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;

	}
	function updateB() {
		var url = "update";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&carno=${dto.carno}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;

	}
	function deleteB() {
		var url = "delete.do";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&carno=${dto.carno}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;

	}
	function replyB() {
		var url = "reply";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&carno=${dto.carno}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;

	}
	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?carno=${dto.carno}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&flag=../car/read";
				location.href = url;
			} else {
				tarea.blur();
			}
		}
	}

	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?carno=${dto.carno}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&flag=../car/read";
				location.href = url;
				return false;
			} else {

				return false;
			}
		} else if (f.content.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.content.focus();
			return false;
		}
	}
	function rupdate(rnum, rcontent) {
		var f = document.rform;
		f.content.value = rcontent;
		f.rnum.value = rnum;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	function rdelete(rnum) {
		if (confirm("정말삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?rnum=" + rnum;
			url = url + "&carno=${dto.carno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
</script>
</head>
<body>
	<div>차량조회</div>
	
	<table class="table">
		<tr>
			<th>사진</th>
			<td><img style="width:25%" src="../storage/${dto.filename }"></td>
		</tr>
		<tr>
			<th>차량번호</th>
			<td>${dto.carno }</td>
		</tr>
		<tr>
			<th>차종</th>
			<td>${dto.brand }</td>
		</tr>
		<tr>
			<th>유종</th>
			<td>${dto.oil }</td>
		</tr>
		<tr>
			<th>차고지</th>
			<td>${dto.place }</td>
		</tr>
		<tr>
			<th>기본요금</th>
			<td>${dto.dprice }</td>
		</tr>
		<tr>
			<th>최대인원</th>
			<td>${dto.howmany }</td>
		</tr>
		<tr>
			<th>예약상태</th>
			<c:choose>
				<c:when test="${dto.state eq 1 }">
					<td>예약가능</td>
				</c:when>
				<c:otherwise>
					<td>예약불가</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
	<DIV class='bottom'>
		<input type='button' value='등록' onclick="location.href='./create'">
		<input type='button' value='목록' onclick="listB()"> <input
			type='button' value='수정' onclick="updateB()"> <input
			type='button' value='삭제' onclick="deleteB()"> <input
			type='button' value='답변' onclick="replyB()">
	</DIV>
</body>
</html>