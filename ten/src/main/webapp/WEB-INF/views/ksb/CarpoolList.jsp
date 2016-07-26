<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<form style="text-align: center;">
		<div class="search_wrap">
			<select name='kind1' id='kind1'
				style="border: none; border: 1px solid #d8d8d8; width: 10%; height: 35px">
				<option value="0">전체</option>
				<option value="1">정기 카풀</option>
				<option value="2">단기 카풀</option>
				<option value="3">여성전용 카풀</option>
			</select>
			<select name='kind2' id='kind2'
				style="border: none; border: 1px solid #d8d8d8; width: 10%; height: 35px">
				<option value="0">전체</option>
				<option value="1">타세요</option>
				<option value="2">태워주세요</option>
			</select>
		
				<img src="../image/ico_start.gif" title="출발지" alt="출발지" width="12px"
					height="20px"> 
					<input type="search" name="src_key_1"
					value="" title="출발지를 입력해주세요" size="10" maxlength="100"
					placeholder="서울"
					style="border: none; border: 1px solid #d8d8d8; width: 20%; height: 35px">
				<img src="../image/ico_arrival.gif" title="도착지" alt="도착지" width="12px"
					height="20px"> 
					<input type="search" name="src_key_2"
					value="" title="도착지를 입력해주세요" size="10" maxlength="100"
					placeholder="부산"
					style="border: none; border: 1px solid #d8d8d8; width: 20%; height: 35px">
		
			<input type="submit" name="" value="검색" title="검색">
		</div>
	</form>
	<table border="1" style="width: 85%;float: left;">
		<tr>
			<th style="width: 7%">프로필</th>
			<th style="width: 7%">인증단계</th>
			<th style="width: 25%">출발</th>
			<th style="width: 25%">도착</th>
			<th style="width: 7%">유형</th>
			<th style="width: 7%">자리/금액</th>
		</tr>
		<tr>
		<td style="text-align: center;"><img alt="photo" src="../image/photo.jpg" width="100%"><br>김성빈</td>
		<td style="text-align: center;">3</td>
		<td style="text-align: left;">경기도 이천시 사음동 182-4번지<br>2016.07.15 오전 7시 16분</td>
		<td style="text-align: left;">서울특별시 관철동 19-7번지</td>
		<td style="text-align: left;">단기 카풀<br>태워주세요</td>
		<td style="text-align: left;">1자리/<br>5000원/인</td>
		</tr>
		<tr>
		<td style="text-align: center;"><img alt="photo" src="../image/photo.jpg" width="100%"><br>김성빈</td>
		<td style="text-align: center;">3</td>
		<td style="text-align: left;">경기도 이천시 사음동 182-4번지<br>2016.07.15 오전 7시 16분</td>
		<td style="text-align: left;">서울특별시 관철동 19-7번지</td>
		<td style="text-align: left;">단기 카풀<br>태워주세요</td>
		<td style="text-align: left;">1자리/<br>5000원/인</td>
		</tr>
		<tr>
		<td style="text-align: center;"><img alt="photo" src="../image/photo.jpg" width="100%"><br>김성빈</td>
		<td style="text-align: center;">3</td>
		<td style="text-align: left;">경기도 이천시 사음동 182-4번지<br>2016.07.15 오전 7시 16분</td>
		<td style="text-align: left;">서울특별시 관철동 19-7번지</td>
		<td style="text-align: left;">단기 카풀<br>태워주세요</td>
		<td style="text-align: left;">1자리/<br>5000원/인</td>
		</tr>
		<tr>
		<td style="text-align: center;"><img alt="photo" src="../image/photo.jpg" width="100%"><br>김성빈</td>
		<td style="text-align: center;">3</td>
		<td style="text-align: left;">경기도 이천시 사음동 182-4번지<br>2016.07.15 오전 7시 16분</td>
		<td style="text-align: left;">서울특별시 관철동 19-7번지</td>
		<td style="text-align: left;">단기 카풀<br>태워주세요</td>
		<td style="text-align: left;">1자리/<br>5000원/인</td>
		</tr>
		<tr>
		<td style="text-align: center;"><img alt="photo" src="../image/photo.jpg" width="100%"><br>김성빈</td>
		<td style="text-align: center;">3</td>
		<td style="text-align: left;">경기도 이천시 사음동 182-4번지<br>2016.07.15 오전 7시 16분</td>
		<td style="text-align: left;">서울특별시 관철동 19-7번지</td>
		<td style="text-align: left;">단기 카풀<br>태워주세요</td>
		<td style="text-align: left;">1자리/<br>5000원/인</td>
		</tr>
	</table>
	<div style="float:right;border: 1px solid;width: 100px ;text-align: center;padding:3% 0px ">등록하기</div>
	<div style="float:right;border: 1px solid red;width: 100px ;text-align: center;padding:3% 0px;margin-top: 20px">운전자리스트</div>
	<div style="float:right;border: 1px solid red;width: 100px ;text-align: center;padding:3% 0px;margin-top: 20px">지역별 <br>글 리스트</div>
		<input type="button" value="이전페이지" style="float: left;margin: 10px;margin-left: 130px">
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">1</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">2</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">3</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">4</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">5</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">6</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">7</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">8</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">9</div>
		<div style="margin:10px;float:left; border: 1px solid;width: 20px;text-align: center;">10</div>
		<input type="button" value="다음페이지" style="float: left;margin: 10px">
</body>
</html>