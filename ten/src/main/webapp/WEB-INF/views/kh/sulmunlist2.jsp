<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sulmunlist</title>
<style>
table, th, td {
	border: 1px solid purple;
	border-collapse: collapse
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

<script type="text/javascript">
	function del(f) {
		alert("정말삭제하시나요?");
		f.document.focus();
		return false;
	}

	function preview() {
		window.open('', 'preview', 'width=300, height=300')
		document.frm.action = "preview.html"//팝업창페이지설명
		document.frm.target = "preview"
		document.frm.submit()
	}
</script>
</head>
<body>
	<h2>마이리서치</h2>

	<table style="width: 70%">
		<tr>
			<img src="헤세26.jpg" alt="헤세" style="width: 1110px; height: 228px;">
		</tr>

		<tr align="center">
			<br>
			<form>
				<br>
				<DIV class="bottom" style="padding-left: 30%">
					<input type="button" value="설문작성"
						onclick="location.href='설문등록.html'" />
				</DIV>
				<br>
			</form>
			<br>
			<form method="post" action="" name="frm">
				<table style="width: 70%">
					<tr>
						<th width="10%">번호</th>
						<th><input type="checkbox" id="" name="" /> 선택</th>
						<th colspan="2">주제</th>
						<th>상태</th>
						<th>미리보기</th>
						<th>수정</th>

						<th>삭제</th>
						<th>결과보기</th>
					</tr>
					<tr>
						<td>1</td>
						<td><input type="checkbox" id="" name="" />빌게이츠</td>
						<th colspan="2"><a href="설문하기.html">dfdfdfsdfs</a></th>
						<td>진행중</td>
						<td><input type="button" value="미리보기" onclick="preview()"></td>
						<td><input type="button" value="수정하기"
							onclick="location.href='설문등록.html'"></td>
						<td><input type="button" value="삭제하기" onclick="del()"></td>
						<td><input type="button" value="결과보기"
							onclick="location.href='결과보기.html'"></td>

					</tr>
					<tr>
						<td>2</td>
						<td><input type="checkbox" id="" name="" /> 빌게이츠</td>
						<th colspan="2"><a href="설문하기.html">dfdfdfsdfs</a></th>
						<td>진행중</td>
						<td><input type="button" value="미리보기" onclick="preview()"></td>
						<td><input type="button" value="수정하기"
							onclick="location.href='설문등록.html'"></td>
						<td><input type="button" value="삭제하기" onclick="del()"></td>
						<td><input type="button" value="결과보기"
							onclick="location.href='결과보기.html'"></td>

					</tr>
					<tr>
						<td>3</td>
						<td><input type="checkbox" id="" name="" /> 빌게이츠</td>
						<th colspan="2"><a href="설문하기.html">dfdfdfsdfs</a></th>
						<td>진행중</td>
						<td><input type="button" value="미리보기" onclick="preview()"></td>
						<td><input type="button" value="수정하기"
							onclick="location.href='설문등록.html'"></td>
						<td><input type="button" value="삭제하기" onclick="del()"></td>
						<td><input type="button" value="결과보기"
							onclick="location.href='결과보기.html'"></td>

					</tr>
					<tr>
						<td>4</td>
						<td><input type="checkbox" id="" name="" /> 빌게이츠</td>
						<th colspan="2"><a href="설문하기.html">dfdfdfsdfs</a></th>
						<td>진행중</td>
						<td><input type="button" value="미리보기" onclick="preview()"></td>
						<td><input type="button" value="수정하기"
							onclick="location.href='설문등록.html'"></td>
						<td><input type="button" value="삭제하기" onclick="del()"></td>
						<td><input type="button" value="결과보기"
							onclick="location.href='결과보기.html'"></td>

					</tr>
					<tr>
						<td>5</td>
						<td><input type="checkbox" id="" name="" /> 빌게이츠</td>
						<th colspan="2"><a href="설문하기.html">dfdfdfsdfs</a></th>
						<td>진행중</td>
						<td><input type="button" value="미리보기" onclick="preview()"></td>
						<td><input type="button" value="수정하기"
							onclick="location.href='설문등록.html'"></td>
						<td><input type="button" value="삭제하기" onclick="del()"></td>
						<td><input type="button" value="결과보기"
							onclick="location.href='결과보기.html'"></td>

					</tr>

				</table>
			</form>
</body>
</html>