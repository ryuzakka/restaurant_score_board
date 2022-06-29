<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/nav.css" type="text/css">
<title>board/write</title>
</head>
<body>

	<div class="header"><h2>식당 별점 게시판</h2></div>
	
	<table width="550" align="center" border="1">
		<caption><h3>게시판 글쓰기</h3></caption>
		<form method="post" action="write_ok.jsp" enctype="multipart/form-data">
		<tr>
			<td> 식당이름 </td>
			<td> <input type="text" name="title" maxlength="100" size="40" required> </td>
		</tr>
		<tr>
			<td> 점 수 </td>
			<td>
				<input type="radio" name="score" value="5">★★★★★<br>
				<input type="radio" name="score" value="4">★★★★<br>
				<input type="radio" name="score" value="3">★★★<br>
				<input type="radio" name="score" value="2">★★<br>
				<input type="radio" name="score" value="1">★<br>
			</td>
		</tr>
		<tr>
			<td> 사 진 </td>
			<td><input type="file" name="fname"> </td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td><textarea cols="60" rows="7" name="content"></textarea> </td>
		</tr>
<%	if(session.getAttribute("name") != null) { %>
		<tr>
			<td> 작성자 </td>
			<td>
				<%=session.getAttribute("name")%>
				<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
			</td>
		</tr>
		<tr style="display:none">
			<td> 비밀번호 </td>
			<td><input type="hidden" name="pwd" value="<%=session.getAttribute("pwd")%>"> </td>
		</tr>
<%	} else { %>
		<tr>
			<td> 작성자 </td>
			<td><input type="text" name="name"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td><input type="password" name="pwd"> </td>
		</tr>
<%	} %>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="작성완료">
				<a href="../main.jsp"><input type="button" value="메인으로"></a>
			</td>
		</tr>
		</form>
	</table>
	
</body>
</html>