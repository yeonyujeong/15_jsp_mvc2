<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>
		<p>입사지원을 위해서는 로그인이 필요합니다.</p>
		<hr>
		<form action="loginAction.do" method="post">
			<p>아이디<input type="text" name="id" autofocus></p>
			<p>패스워드<input type="password" name="pw"></p>
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>