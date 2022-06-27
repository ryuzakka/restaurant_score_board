<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	int pager;
	
	String sql = "select * from restaurant_board order by id desc";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/nav.css" type="text/css">
<title>main</title>
</head>
<body>
	
	<div class="navbar">
		<ul>
<%	if(session.getAttribute("name") == null) { %>
			<li> <a href="member/login.jsp">로그인</a> </li>
			<li> <a href="member/signup.jsp">회원가입</a> </li>
<%	} else { %>
			<li> 반갑습니다.</li>
			<li><%=session.getAttribute("name")%> 님,</li>
			<li><a href="member/logout.jsp">로그아웃</a></li>
<%	} %>
		</ul>
	</div>
	<div class="header"><h2>식당 별점 게시판</h2></div>
	
	<div class="navbar btn">
		<a href="board/write.jsp"><input type="button" value="글쓰기"></a>
	</div>
	<table width="700" align="center" border="1">
		<tr align="center">
			<td> 식당명 </td>
			<td> 작성자 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
			<td> grp </td>
			<td> depth </td>
			<td> seq </td>
		</tr>
	<% while(rs.next()) { %>
		<tr>
			<td> <%=rs.getString("title") %> </td>
			<td> <%=rs.getString("name") %> </td>
			<td> <%=rs.getString("viewcnt") %> </td>
			<td> <%=rs.getString("writeday") %> </td>
			<td> <%=rs.getString("grp") %> </td>
			<td> <%=rs.getString("depth") %> </td>
			<td> <%=rs.getString("seq") %> </td>
		</tr>
	<% } %>
	</table>
	
</body>
</html>