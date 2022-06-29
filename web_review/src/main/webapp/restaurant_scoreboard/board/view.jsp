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
<title>view</title>
</head>
<body>	<!-- board/view.jsp -->
	
	<div class="header"><h2>식당 별점 게시판</h2></div>
	
	<table width="550" align="center" border="1">
		<caption><h3>게시글 상세페이지</h3></caption>
		<tr>
			<td> 식당이름 </td>
			<td> <%=rs.getString("title") %> </td>
		</tr>
		<tr>
		<%
			String star = "";
			switch(rs.getInt("score")){
				case 5: star="★★★★★"; break;
				case 4: star="★★★★"; break;
				case 3: star="★★★"; break;
				case 2: star="★★"; break;
				case 1: star="★"; break;
			}
		%>
			<td> 점 수 </td>
			<td> <%=star%> </td>
		</tr>
		<tr>
			<td> 사 진 </td>
			<td> <img src="../img/<%=rs.getString("fname")%>" width="350"> </td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> <%=rs.getString("content").replace("\r\n", "<br>") %> </td>
		</tr>
		<tr>
			<td> 작성자 </td>
			<td> <%=rs.getString("name") %> </td>
		</tr>
		<tr>
			<td> 조회수 </td>
			<td> <%=rs.getInt("viewcnt") %> </td>
		</tr>
		<tr>
			<td> 작성일자 </td>
			<td> <%=rs.getString("writeday") %> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="update.jsp?id=<%=id%>"><input type="button" value="수정"></a>
				<a href="delete.jsp?id=<%=id%>"><input type="button" value="삭제"></a>
				<a href="rewrite.jsp?grp=<%=rs.getInt("grp")%>"><input type="button" value="답글"></a>
				<br>
				<a href="../main.jsp"><input type="button" value="목록으로"></a>
			</td>
		</tr>
	</table>
	



</body>
</html>