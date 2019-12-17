<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Page</title>
</head>

<%@ page import ="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");

//get sid, pid
int sid = -1;
String sidString = request.getParameter("sid"); String pidString = request.getParameter("pid");

if(sidString != null) sid = Integer.parseInt(sidString);

//MySQL database connection
ResultSet rs = null; PreparedStatement pst = null; Connection conn= null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
} catch(Exception e){}

if(sid!=-1){
	pst = conn.prepareStatement("Select * from users where sid="+sid);
	rs = pst.executeQuery();
	if (!rs.next()) %> <script>alert("Database connection failed. Please try again.")</script> <%
	String classString = rs.getString("class");
	
	if(classString.equals("buyer")){
		%><script>window.location.href = '<%="productlist_intro_temp.jsp?sid="+sid%>';</script> <%
	} else if(classString.equals("seller")){
		%><script>window.location.href = '<%="seller_intro.jsp?sid="+sid%>';</script> <%
	} else if (classString.equals("admin")){
		%><script>window.location.href = '<%="admin.jsp?sid="+sid%>';</script> <%
	}
}

%>

<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

html, body{
  width:100%; height: 100%;
  margin: 0; padding: 0;
  background: #27C9C6;
  background: -webkit-linear-gradient(45deg, #68EBB9, #27C9C6);
  background: -o-linear-gradient(45deg, #68EBB9, #27C9C6);
  background: -moz-linear-gradient(45deg, #68EBB9, #27C9C6);
  background: linear-gradient(45deg, #68EBB9, #27C9C6);

}

body{
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	text-align: center;
}

.welcome{
	positin: absolute;
	margin-top: 150px;
	font-size: 5rem;
	color:white;
	font-weight: bold;
}
.welcome #welcome{float:left; margin-left:100px;}
.welcome #market{font-size:8rem;}
.welcome #login{text-decoration:none; color:white; border: 1px solid white; font-size:2.5rem;}

/*menu bar*/
header{
	height:80px; background-color:#36304a; border: 1px solid #36304a;
	width:100%; z-index:9999; top:0; left:0; padding:10px;
	color:white;
}

.wrapper{width:1170px; margin:0 auto; display:flex;}
.menu li{float:left;list-style:none;}
.menu a{
	text-decoration:none;line-height:60px; color:black; padding: 0 15px; display: block;
	color:white;
}
.menu #moveToLogin{position:absolute; right:50px; color:white;}
.menu #loginId{position:absolute; right:140px; color:#27C9C6; text-decoration:none;line-height:60px; display: block; font-size:15px;}
</style>

<body>    
    <div class="welcome">
    	<span id ="welcome">Welcome to</span><br>
    	<span id="market">GINGKO MARKET</span><br>
    	<a href="login.jsp" id="login" >Sign In/Sign Up</a>
    </div>
</body>
</html>