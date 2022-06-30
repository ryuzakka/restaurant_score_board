<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	request.setCharacterEncoding("UTF-8");
	String bid = request.getParameter("bid");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	String sql = "insert into restaurant_comment(name, comment, pwd, writeday, bid) ";
	sql += "values(?,?,?,now(),?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, content);
	pstmt.setString(3, pwd);
	pstmt.setString(4, bid);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	
	response.sendRedirect("view.jsp?id=" + bid);
%>