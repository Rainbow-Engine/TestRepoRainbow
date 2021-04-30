<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Connection Pool Test</title>
</head>
<body>
<%
Context context = new InitialContext();
DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/LoginTemplate");
Connection conn = ds.getConnection();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM USER_MASTER");
while(rs.next()){
	System.out.printf("ID = %6s ",rs.getString("USER_ID"));
	System.out.printf("NAME = %8s ",rs.getString("USER_NAME"));
	System.out.printf("PASS = %32s ",rs.getString("PASSWORD"));
%>
<div>
User ID = <%=rs.getString("USER_ID") %>
User Name = <%=rs.getString("USER_NAME") %>
Password = <%=rs.getString("PASSWORD") %>
</div>
<%}
rs.close();
stmt.close();
conn.close();
%>
</body>
</html>