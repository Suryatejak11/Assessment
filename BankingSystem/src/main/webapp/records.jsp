<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Records</h1>
<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc", "root", "Root");
		String s1 = "select * from user1";
		String s2 = "select * from bank";
		PreparedStatement pst1 = conn.prepareStatement(s1);
		PreparedStatement pst2 = conn.prepareStatement(s2);
		ResultSet rs1 = pst1.executeQuery();
		ResultSet rs2 = pst2.executeQuery();
		while (rs1.next()) {

			out.println("Name : " + rs1.getString("name"));
			out.println("Password : " + rs1.getString("password"));
	%>
	<br>
	<%
	}
	while (rs2.next()) {
	out.println("Account : " + rs2.getString("account"));
	out.println("Amount : " + rs2.getString("amount"));
	%>
	<br>
	<%
	}

	} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
%>
</body>
</html>