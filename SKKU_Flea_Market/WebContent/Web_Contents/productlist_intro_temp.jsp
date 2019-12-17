<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>

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

button {
	border-radius:20px;
	background-color: white;
	font-size: 4rem;
	font-weight: bold;
	text-transform: uppercase;
	width:100%; height:100%;
	color: #27C9C6;
}

.content-wrapper {
	width: 60%; height:55%;
	margin: 0 auto;
	margin-top: 25px;
	margin-bottom: 10px;
	border: 0px;
	border-radius: 10px;
	display:grid; 
	grid-template-columns: 1fr 1fr;
	grid-gap:20px;
}

#market{
	text-align:center;
	positin: absolute;
	font-size: 6rem;
	color:white;
	font-weight: bold;
}

/*menu bar*/
header{
	height:10%; background-color:white;
	width:100%; z-index:9999; top:0; left:0; padding:10px;
	color:#27C9C6; display:flex;
}
header h1{margin-left:10%;}
.menu{float:right; display:flex;}
.menu li, a{list-style:none; text-decoration:none;line-height:60px; padding: 0 15px; display: block; color: #27C9C6;}
.menu #moveToLogin{position:absolute; right:8%; text-decoration:none;}
.menu #loginId{position:absolute; right:14%; text-decoration:none; font-weight:bold;}

.image{width:100%; height:100%;}
</style>
</head>

<%@ page import ="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");

//get sid, pid
int sid = -1;
String sidString = request.getParameter("sid");
if(sidString != null) sid = Integer.parseInt(sidString);

//MySQL database connection
ResultSet rs = null; PreparedStatement pst = null; Connection conn= null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
} catch(Exception e){} 

%>

<body>
<header>
	<h1>Gingko Market</h1>
	<ul class="menu">
    	<li><a href="<%="productlist_intro_temp.jsp?sid="+sid%>">Buy products</a></li>
    	<li><li><a href="<%="wishlist.jsp?sid="+sid%>">Wish list</a></li>
    	<li><li><a href="<%="shoppingList.jsp?sid="+sid%>">Shopping list</a></li>
    	<%if(sid != -1){ %>
    		<li id=loginId><%=sid %></li>
    		<li id="moveToLogin"><a href="main.jsp">Log out</a></li>
    	<%} else { %>
    		<li id="moveToLogin"><a href="login.jsp">Sign In/Sign Up</a></li> <%} %>
    </ul>
</header>

<div id="market">Buy Products</div>
<div class="content-wrapper">
	 <button id="card_flea"><img class="image" src="src/flea_market.png" alt=""></button>
	 <button id="card_auction"><img class="image" src="src/auction.png" alt=""></button>
</div>

</body>

<script>
var card_flea = document.getElementById("card_flea");
var card_auction = document.getElementById("card_auction");

card_flea.addEventListener('click', () => {
	window.location.href = '<%="productList_buyer_flea.jsp?sid="+sid%>';
});

card_auction.addEventListener('click', () => {
	window.location.href = '<%="productList_buyer_auction.jsp?sid="+sid%>';
});
</script>
</html>