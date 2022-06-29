<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "dndb5032");
	
	String id = request.getParameter("id");
	
	String sql = "select * from board2 where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0619board/view</title>
</head>
<body>	<!-- 0619board/view -->

	<table width="500" align="center">
		<caption><h2>게시판 글수정</h2></caption>
		<tr>
			<td> 비밀글 </td>
			<td> <%=rs.getInt("secret")%> </td>
		</tr>
		<tr>
			<td> 제 목 </td>
			<td> <%=rs.getString("title")%> </td>
		</tr>
		<tr>
			<td> 이 름 </td>
			<td> <%=rs.getString("writer") %> </td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> <%=rs.getString("content") %> </td>
		</tr>
		<tr>
			<td> 조회수 </td>
			<td> <%=rs.getInt("viewcnt") %> </td>
		</tr>
		<tr>
			<td> 작성일 </td>
			<td> <%=rs.getString("writeday") %> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="수정" >
				<input type="button" value="목록" >
				<input type="button" value="삭제" >
			</td>
		</tr>
		
		<!-- 삭제 : 비밀번호 입력 폼 -->
		<form id="delpwd" method="post" action="delete.jsp">
			<tr>
				<input type="hidden" name="id" value="<%=rs.getInt("id") %>" >
				<input type="password" name="pwd" >
				<input type="submit" value="삭제하기" >
			</tr>
		</form>
	</table>
	
</body>
</html>
<%
	rs.close();
	pstmt.close();
	conn.close();
%>