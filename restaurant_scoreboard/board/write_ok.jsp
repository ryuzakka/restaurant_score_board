<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% 
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	String path = request.getRealPath("/restaurant_scoreboard/img/");
	int maxSize = 3 * 1024 * 1024;
	String enc = "UTF-8";
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, path, maxSize, enc, new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("title");
	String score = multi.getParameter("score");
	String fname = multi.getFilesystemName("fname");
	String content = multi.getParameter("content");
	String name = multi.getParameter("name");
	String pwd = multi.getParameter("pwd");
	
	String sql = "insert into restaurant_board";
	sql += "(title, score, fname, content, name, pwd, writeday,grp,depth,seq) ";
	sql += "values(?,?,?,?,?,?,now(),1,1,1)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, score);
	pstmt.setString(3, fname);
	pstmt.setString(4, content);
	pstmt.setString(5, name);
	pstmt.setString(6, pwd);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("../main.jsp");
%>