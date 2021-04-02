<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_bInfo</title>
</head>
<body>
	<div align="center" style="padding-top: 100px">
	<div align="center">
		<h1>게시글 보기</h1>
		<br>
	</div>
		<table style="width: 700px; text-align: center" border="1">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>글번호</td>
				<td>${bdto.num}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${bdto.readCount}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${bdto.writer}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${bdto.regDate}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${bdto.email}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${bdto.subject}</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>${bdto.content}</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정하기" onclick="location.href='bUpdate.do?num=${bdto.num}'">
					<input type="button" value="삭제하기" onclick="location.href='bDelete.do?num=${bdto.num}'">
					<input type="button" value="목록보기" onclick="location.href='bList.do'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>