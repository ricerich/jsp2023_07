<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");

		Statement stmt = null;

		try {
// 			String sql = "INSERT INTO Member(id, passwd, name) VALUES('"+id+"','"+passwd+"','"+name+"')";
			String sql = ""; 
			sql += " INSERT INTO "; 
			sql += " 	Member(id, passwd, name) "; 
			sql += " 	VALUES('"+id+"','"+passwd+"','"+name+"') ";
			
			stmt = conn.createStatement();
			int success = stmt.executeUpdate(sql);
			
			if(success != 0)
				System.out.println("성공하였습니다");
			else
				System.out.println("실패하였습니다");
			
			out.println("Member 테이블 삽입이 성공했습니다.");
		} catch (SQLException ex) {
			out.println("Member 테이블 삽입이 실패했습니다.<br>");
			out.println("SQLException: " + ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>
	