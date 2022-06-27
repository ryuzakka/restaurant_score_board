<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/ezen";
	Connection conn = DriverManager.getConnection(db, "root", "1234");
	
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	String sql = "select * from restaurant_user where userid=? and userpwd=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userid);
	pstmt.setString(2, userpwd);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()) {
		session.setAttribute("userid", rs.getString("userid"));
		session.setAttribute("name", rs.getString("username"));
		session.setAttribute("pwd", rs.getString("userpwd"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		response.sendRedirect("../main.jsp");
	}
	else {
		rs.close();
		pstmt.close();
		conn.close();
		
		response.sendRedirect("login.jsp");
	}
	
%>
