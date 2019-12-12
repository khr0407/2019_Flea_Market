<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Modification</title>
<link rel="stylesheet" href="./css/admin_member_modification.css">
</head>
<body>

<%@ page import ="java.sql.*"%>
<%
ResultSet rs = null; PreparedStatement pst = null; Connection conn= null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	
	pst = conn.prepareStatement("Select * from users where sid='2017314888'");
	rs = pst.executeQuery();
	if (!rs.next()) %> <script>alert("Database connection failed. Please try again.")</script> <%
} catch(Exception e){ 
	%>alert("Something went wrong !! Please try again");<%
} 
request.setCharacterEncoding("euc-kr");
%>

<header>
    	<div class="wrapper">
    		<h1>Gingko Market</h1>
    			<ul class="menu">
    				<li><a href="#">Home</a></li>
    				<li><a href="#">About</a></li>
    				<li><a href="#">Board</a></li>
    				<li><a href="#">Reference</a></li>
    				<li><a href="#">Contact</a></li>
    			</ul>
    	</div>
    </header>
   
<div class="content-wrapper">
<h1>Member Modification</h1><hr>

<form action="admin_member_modification.jsp">
<p><label>Student ID</label> <input type="text" name="id" value="<%=rs.getInt("sid") %>"></p>
<p><label>Password</label> <input type="text" name="pwd" value="<%=rs.getString("pw") %>"></p>
<p><label>Name</label> <input type="text" name="name" value="<%=rs.getString("name") %>"></p>
<input type="submit" value="완료">
</form>

</div>

<% 
String sid = request.getParameter("id");
if(sid != null){
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	pst = conn.prepareStatement("update users set sid="+sid+" where sid="+rs.getInt("sid"));
	pst.executeUpdate();
	pst = conn.prepareStatement("update users set pw='"+pwd+"' where sid="+rs.getInt("sid"));
	pst.executeUpdate();
	pst = conn.prepareStatement("update users set name='"+name+"' where sid="+rs.getInt("sid"));
	pst.executeUpdate();
	%><script> 
	alert("회원정보 변경이 완료되었습니다.");
	window.location.href = "admin_member_modification.jsp";
	</script><%
}
%>

</body>
</html>