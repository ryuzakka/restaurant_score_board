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
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	if(phone.length() != 11) {
		response.sendRedirect("signup.jsp");
	}
	else if(email.indexOf("@") < 0 || email.indexOf(".") < 0) {
		response.sendRedirect("signup.jsp");
	}
	else {
		String sql = "select * from restaurant_user where userid=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			rs.close();
			pstmt.close();
			conn.close();
			
			response.sendRedirect("signup.jsp");
		}
		else {
			
			
			
			sql = "insert into restaurant_user";
			sql += "(userid,userpwd,username,phone,email,joinday) ";
			sql += "values(?,?,?,?,?,now())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			pstmt.setString(3, username);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			
			pstmt.executeUpdate();
			
			rs.close();
			pstmt.close();
			conn.close();
			
			response.sendRedirect("signup_success.jsp");
		}
	}

%>