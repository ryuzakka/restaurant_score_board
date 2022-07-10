<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<% 
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	String path = request.getRealPath("/restaurant_scoreboard/img/");
	int maxSize = 3 * 1024 * 1024;
	String enc = "UTF-8";
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, path, maxSize, enc, new DefaultFileRenamePolicy());
	
	String id = multi.getParameter("id");
	String title = multi.getParameter("title");
	String score = multi.getParameter("score");
	String fname = multi.getFilesystemName("fname");
	String content = multi.getParameter("content");
	String name = multi.getParameter("name");
	
	String oldfname = multi.getParameter("oldfname");
	
	File file = new File(path+"/"+oldfname);
	if(file.exists())
		file.delete();
	
	String sql = "update restaurant_board set ";
	sql += "title=?, score=?, fname=?, content=?, name=?, writeday=now() where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, score);
	pstmt.setString(3, fname);
	pstmt.setString(4, content);
	pstmt.setString(5, name);
	pstmt.setString(6, id);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("view.jsp?id=" + id);
%>