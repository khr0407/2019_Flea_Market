<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Page</title>
</head>

<% 
request.setCharacterEncoding("euc-kr");

//get sid, pid
int sid = -1, pid = -1;
String sidString = request.getParameter("sid"); String 
pidString = request.getParameter("pid");

if(sidString != null) sid = Integer.parseInt(sidString); 

if(pidString != null) pid = Integer.parseInt(pidString);
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
}

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
	<header>
    	<div class="wrapper">
    		<h1>Gingko Market</h1>
    			<ul class="menu">
    				<li><a href="<%="main.jsp?sid="+sid%>">Home</a></li>
    				<li><a href="<%="productList_intro.jsp?sid="+sid%>">Products for buyer</a></li>
    				<li><a href="productList_seller.jsp">Products for seller</a></li>
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
</body>
</html>