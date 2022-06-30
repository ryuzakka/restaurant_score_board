<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	request.setCharacterEncoding("UTF-8");
	String bid = request.getParameter("bid");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String comment = request.getParameter("content");
	
	String sql = "select pwd from restaurant_comment where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String dbpwd = rs.getString("pwd");
	
	if(pwd.equals(dbpwd)) {
		sql = "update restaurant_comment set ";
		sql += "name=?, comment=?, writeday=now() where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, comment);
		pstmt.setString(3, id);
		
		pstmt.executeUpdate();
	}
	
	rs.close();
	pstmt.close();
	conn.close();
	
	response.sendRedirect("view.jsp?id=" + bid);
%>