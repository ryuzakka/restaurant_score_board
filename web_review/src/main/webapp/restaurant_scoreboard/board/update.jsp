<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	String id = request.getParameter("id");
	
	String sql = "select * from restaurant_board where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/nav.css" type="text/css">
<title>update</title>
<script>
	function init() {
		document.updateform.score[5-<%=rs.getInt("score")%>].checked = true;
	}
</script>
</head>
<body onload="init()">	<!-- board/update.jsp -->
	
	<div class="header"><h2>식당 별점 게시판</h2></div>
	
	<form name="updateform" method="post" action="update_ok.jsp" enctype="multipart/form-data">
	<table width="550" align="center" border="1">
		<caption><h3>게시글 수정페이지</h3></caption>
		<input type="hidden" name="id" value="<%=rs.getString("id") %>">
		<tr>
			<td> 식당이름 </td>
			<td> <input type="text" name="title" value="<%=rs.getString("title") %>"> </td>
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
			<td> 
				<input type="hidden" name="oldfname" value="<%=rs.getString("fname")%>">
				<input type="file" name="fname"><br>
				<% if(rs.getString("fname") != null){ %>	<%=rs.getString("fname")%>	<% } %>
				
			</td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> <textarea cols="60" rows="7" name="content"><%=rs.getString("content")%></textarea> </td>
		</tr>
		<tr>
			<td> 작성자 </td>
			<td> <input type="text" name="name" value="<%=rs.getString("name") %>"> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정완료"><br>
				<input type="button" value="뒤로가기" onclick="javascript:location='view.jsp?id=<%=rs.getString("id") %>'">
				<a href="../main.jsp"><input type="button" value="목록으로"></a>
			</td>
		</tr>
	</table>
	</form>
	
</body>
</html>