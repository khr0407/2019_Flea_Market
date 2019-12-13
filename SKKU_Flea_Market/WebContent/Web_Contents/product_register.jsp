<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Product Register</title>
<link rel="stylesheet" href="./css/product_register.css">
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
} catch(Exception e){ 
	%>alert("Something went wrong !! Please try again");<%
} 

%>

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
  <div class="content-wrapper">
    <h1>Product Register</h1> <hr>
    <form action="#" method="post">
      <h3>Please select the sell type.</h3>
      <input type="radio" name="sell_type" id="sell_type_flea" value="flea"> Flea
      <input type="radio" name="sell_type" id="sell_type_auction" value="auction"> Auction 
      <input type="button" onClick="GetSellType();" value="확인"></input> <br>
      
      <div id="informations">
      <h3>Enter the product informations.</h3>
      <p><label>Product title</label> <input type="text" name="product_title" value=""></p>
      <p><label>Phone number</label> <input type="text" name="phone_number" value=""></p>
      <p>
      <label>Category</label> <select name="category" id="select_category">
        <option value="all" selected>Category</option>
        <option value="grocery">Grocery</option>
        <option value="clothing">Clothing</option>
        <option value="cosmetics">Cosmetics</option>
        <option value="books">Books</option>
        <option value="electronics">Electronics</option>
        <option value="furniture">Furniture</option>
        <option value="others">Others</option>
      </select> </p>
      <p><label id="price"></label> <input type="text" name="" value=""> </p>
      <p id="date"><label>Due date</label><input type="datetime-local" value=""> </p>
      <div class="trading_method">
      <p>How to trade</p>
      <p>
        <input type="radio" name="send_type" value="direct"> Direct deal
        <input type="text" id="trading_place" placeholder="Enter trading place"> <br>
        <input type="radio" name="send_type" value="delivery"> By delivery
      </p>
      </div>
      <p><label>Product image</label> <input type="file" name="file" value=""></p>
        <p><textarea name="details" placeholder="Enter the product detail informations."></textarea></p>
        <br> <input type="submit" name="" value="완료">
        </div>
      
      </form>
  </div>
  <script src="./js/product_register.js"></script>
</body>
</html>
