<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	body {
		margin-top:80px;
	}
	td {
		padding-bottom:10px;
	}
	#wrongpwd {
		display:none;
		color:red;
		font-size:12px;
	}
	#wrongmail {
		display:none;
		color:red;
		font-size:12px;
	}
</style>
<script>
	function pwdCheck(my) {
		var pwd = document.signform.userpwd.value;
		if(pwd != my.value) {
			my.focus();
			document.getElementById('wrongpwd').style.display = "inline-block";
			return false;
		}
		else {
			document.getElementById('wrongpwd').style.display = "none";
			return true;
		}
	}
	
	function phoneCheck(my) {
		my.value = my.value.replace(/[^0-9]/g, "");
		if(my.value.length != 11) {
			my.focus();			
			return false;
		}
	}
	
	function mailCheck(my) {
		my.value = my.value.replace(" ", "");
		if(my.value.indexOf("@") < 0) {
			my.focus();
			document.getElementById("wrongmail").style.display = "inline-block";
			return false;
		}
		else if(my.value.indexOf(".") < 0) {
			my.focus();
			document.getElementById("wrongmail").style.display = "inline-block";
			return false;
		}
		else {
			document.getElementById("wrongmail").style.display = "none";
			return true;
		}
	}
	
	function allCheck() {
		var frm = document.signform;
		pwdCheck(frm.userpwd2);
		phoneCheck(frm.phone);
		mailCheck(frm.email);
		
		if(frm.userpwd != frm.userpwd2) {
			return false;
		}
	}
</script>
</head>
<body>
	
	<table align="center">
		<caption><h2>회 원 가 입</h2></caption>
		<form name="signform" method="post" action="signup_ok.jsp" onsubmit="return allCheck()">
			<tr>
				<td> 아이디 </td>
				<td><input type="text" name="userid" placeholder="아이디" required></td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
				<td><input type="password" name="userpwd" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td> </td>
				<td>
					<input type="password" name="userpwd2" placeholder="비밀번호 확인" required onkeyup="return pwdCheck(this)"><br>
					<span id="wrongpwd">비밀번호가 일치하지 않습니다.</span>
				</td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td><input type="text" name="username" placeholder="이름" required></td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td><input type="text" name="phone" placeholder="번호만 입력" required onkeyup="return phoneCheck(this)"></td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td>
					<input type="text" name="email" placeholder="이메일" required onkeyup="return mailCheck(this)"><br>
					<span id="wrongmail">이메일 형식이 잘못 됐습니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회원가입 하기"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="../main.jsp">홈으로</a>&nbsp;&nbsp;&nbsp;
					<a href="login.jsp">로그인</a>
				</td>
			</tr>
		</form>
	</table>
	
</body>
</html>