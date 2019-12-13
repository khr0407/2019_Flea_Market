<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Wishlist Deletion</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sid = request.getParameter("sid");
	String pid = request.getParameter("pid");
	String query = "delete from 2019_flea_market.wish_list where sid='"+sid+"' and pid='"+pid+"'";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","0000");
	PreparedStatement pst = conn.prepareStatement(query);
	int n = pst.executeUpdate();

%>
<script>
	alert("Successfully deleted!");
	window.location.href = 'wishlist.jsp';
</script>
</body>
</html>