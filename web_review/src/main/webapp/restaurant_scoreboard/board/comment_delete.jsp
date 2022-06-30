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
	
	String sql = "select pwd from restaurant_comment where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	String dbpwd = rs.getString("pwd");
	
	if(pwd.equals(dbpwd)) {
		sql = "delete from restaurant_comment where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
	}
	
	rs.close();
	pstmt.close();
	conn.close();
	
	response.sendRedirect("view.jsp?id=" + bid);
%>