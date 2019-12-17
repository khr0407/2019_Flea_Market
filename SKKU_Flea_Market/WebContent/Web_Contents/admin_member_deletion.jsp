<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Deletion</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sid = request.getParameter("sid");
	String query="delete from 2019_flea_market.users where sid='"+sid+"'";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	PreparedStatement pst = conn.prepareStatement(query);
	int n = pst.executeUpdate();

%>
<script>
	alert("Successfully deleted!");
	window.location.href = 'admin.jsp';
</script>
</body>
</html>