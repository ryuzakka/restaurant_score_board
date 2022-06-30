<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	request.setCharacterEncoding("UTF-8");
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
<script>
	function update_cmmt(num, nick, comment) {
		var form = document.cmmtForm;
		form.id.value = num;
		form.name.value = nick;
		form.name.disabled = false;
		form.content.value = comment;
		form.content.disabled = false;
		form.action = "comment_update.jsp";
		form.submit.value = "댓글 수정";
	}
	function origin_cmmt() {
		var form = document.cmmtForm;
		form.id.value = "";
		form.name.value = "";
		form.name.disabled = false;
		form.content.value = "";
		form.content.disabled = false;
		form.action = "comment_write.jsp";
		form.submit.value = "댓글 작성";
	}
	function delete_cmmt(num, nick, comment) {
		var form = document.cmmtForm;
		form.id.value = num;
		form.name.value = nick;
		form.name.disabled = true;
		form.content.value = comment;
		form.content.disabled = true;
		form.action = "comment_delete.jsp";
		form.submit.value = "댓글 삭제";
	}
</script>
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
	
	<p>
	<h3 align="center">댓 글</h3>
	<form name="cmmtForm" method="post" action="comment_write.jsp" align="center">
		<input type="hidden" name="id" value="">
		<input type="hidden" name="bid" value="<%=id%>">
		<input type="text" name="name" placeholder="이름" required>
		<input type="text" name="content" placeholder="내용">
		<input type="password" name="pwd" placeholder="비밀번호" size="5" required>
		<input type="submit" name="submit" value="댓글 작성">
	</form>
	
	<%
		sql = "select * from restaurant_comment where bid=? group by id desc";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
	%>
	
	<table width="550" align="center">
		<tr align="center">
			<td> 이름 </td>
			<td> 내용 </td>
			<td> 작성일 </td>
			<td></td>
		</tr>
	<%	while(rs.next()) { %>
		<tr>
			<td> <%=rs.getString("name") %> </td>
			<td onclick="origin_cmmt()"> <%=rs.getString("comment") %> </td>
			<td> <%=rs.getString("writeday") %> </td>
			<td>
				<input type="button" value="수정" onclick="update_cmmt(<%=rs.getInt("id")%>,'<%=rs.getString("name") %>','<%=rs.getString("comment") %>')">
				<input type="button" value="삭제" onclick="delete_cmmt(<%=rs.getInt("id")%>,'<%=rs.getString("name") %>','<%=rs.getString("comment") %>')">
			</td>
		</tr>
	<%	} %>
	</table>
	
</body>
</html>
<%
	rs.close();
	pstmt.close();
	conn.close();
%>