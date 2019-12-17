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
request.setCharacterEncoding("euc-kr");

//get sid, pid
int sid = -1, pid = -1;
String sidString = request.getParameter("sid"); String 
pidString = request.getParameter("pid");

if(sidString != null) sid = Integer.parseInt(sidString);
else sid=2017314888; 

if(pidString != null) pid = Integer.parseInt(pidString);
else pid=1;

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
%>

<header>
    	<div class="wrapper">
    		<h1>Gingko Market</h1>
    			<ul class="menu">
    				<li><a href="<%="main.jsp?sid="+sid%>">Home</a></li>
    				<li><a href="<%="productList_intro.jsp?sid="+sid%>">Products for buyer</a></li>
    				<li><a href="<%="productList_intro.jsp?sid="+sid%>">Products for seller</a></li>
    				<li><a href="<%="product_info_flea.jsp?sid="+sid %>">Flea</a></li>
    				<li><a href="<%="product_info_auction.jsp?sid="+sid %>">Auction</a></li>
    				<li><a href="<%="product_register.jsp?sid="+sid %>">Product register</a></li>
    				<%if(sid != -1){ %>
    				<li id=loginId><%=sid %></li>
    				<li id="moveToLogin"><a href="main.jsp">Log out</a></li>
    				<%} else { %>
    				<li id="moveToLogin"><a href="login.jsp">Sign In/Sign Up</a></li> <%} %>
    			</ul>
    	</div>
    </header>
   
<div class="content-wrapper">
<h1>Member Modification</h1><hr>

<form action=<%="admin_member_modification.jsp?sid="+sid+"&pid="+pid %>>
<p><label>Student ID</label> <input type="text" name="id" value="<%=rs.getInt("sid") %>"></p>
<p><label>Password</label> <input type="text" name="pwd" value="<%=rs.getString("pw") %>"></p>
<p><label>Name</label> <input type="text" name="name" value="<%=rs.getString("name") %>"></p>
<input type="submit" value="완료">
</form>

</div>

<% 
String id = request.getParameter("id");
if(id != null){
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	pst = conn.prepareStatement("update users set sid="+id+" where sid="+rs.getInt("sid"));
	pst.executeUpdate();
	pst = conn.prepareStatement("update users set pw='"+pwd+"' where sid="+rs.getInt("sid"));
	pst.executeUpdate();
	pst = conn.prepareStatement("update users set name='"+name+"' where sid="+rs.getInt("sid"));
	pst.executeUpdate();
	%><script> 
	alert("회원정보 변경이 완료되었습니다.");
	window.location.href = "admin_member_modification.jsp?sid="+sid+"&pid="+pid;
	</script><%
}
%>

</body>
</html>