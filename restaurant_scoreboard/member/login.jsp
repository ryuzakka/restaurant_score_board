<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	body {
		margin-top:80px;
	}
</style>
</head>
<body>
	
	<div align="center">
		<form method="post" action="login_ok.jsp">
			<caption><h2>로 그 인</h2></caption>
			<input type="text" name="userid" placeholder="아이디" required><p>
			<input type="password" name="userpwd" placeholder="비밀번호" required><p>
			<input type="submit" value="로그인 하기"><p>
			<span>아직 회원이 아니신가요? </span><a href="signup.jsp">회원가입</a>
		</form>
	</div>
	
</body>
</html>