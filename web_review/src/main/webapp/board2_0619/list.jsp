<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "dndb5032");
	
	String sql = "select * from board2";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0619board/list</title>
<style>
	#pwdchk { 
		display:none;
		position:absolute;
		width:125px; 
		height:30px;
		padding-top:8px;
		padding-left:10px;
		background:#eeeeee; 
	}
</style>
<script>
	function pwdCheck(id) {
		var form = document.getElementById('pwdchk');
		form.style.display = "table-row";
		form.style.left = (event.pageX+10)+"px";
		form.style.top = event.pageY+"px";
		form.id.value = id;
	}
</script>
</head>
<body>	<!-- 0619board/list -->
	
	<table width="600" border="1" align="center">
		<caption><h2>게시판 목록</h2></caption>
		<tr>
			<td> <strong> 비밀글 </strong> </td>
			<td> <strong> 제 목 </strong> </td>
			<td> <strong> 이 름 </strong> </td>
			<td> <strong> 조회수 </strong> </td>
			<td> <strong> 작성일 </strong> </td>
		</tr>
	<% while(rs.next()) { %>
		<tr>
			<td> 
			<% if(rs.getInt("secret") == 1) { %>
				<span>O</span>
			<% } %>
			</td>
			<td> 
			<% if(rs.getInt("secret") == 0) { %>
				<a href="viewcnt.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title") %></a>
			<% } else { %>
				<div onclick="pwdCheck(<%=rs.getInt("id")%>)"> <%=rs.getString("title") %> </div>
			<% } %>
			</td>
			<td> <%=rs.getString("writer") %> </td>
			<td> <%=rs.getInt("viewcnt") %> </td>
			<td> <%=rs.getString("writeday") %> </td>
		</tr>
	<% } %>
		<tr>
			<td colspan="5"> <a href="write.jsp"><input type="button" value="글쓰기"></a> </td>
		</tr>
		
		<!-- 비밀글 비밀번호 입력 폼 -->
		<div id="pwdchk">
			<form method="post" action="viewcnt.jsp">
				<input type="hidden" name="id" value="">
				<input type="password" name="pwd" size="4">
				<input type="submit" value="확인">
			</form>
		</div>
	</table>
	
</body>
</html>

<%
	rs.close();
	pstmt.close();
	conn.close();
%>