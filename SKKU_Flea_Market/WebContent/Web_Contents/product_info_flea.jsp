<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <link rel="stylesheet" href="./css/product_info_flea.css">

<%@ page import ="java.sql.*"%>
<%
ResultSet rs = null; PreparedStatement pst = null; Connection conn= null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	
	pst = conn.prepareStatement("Select * from products where pid=0 and type='flea'");
	rs = pst.executeQuery();
	if (!rs.next()) %> <script>alert("Database connection failed. Please try again.")</script> <%
} catch(Exception e){ 
	%>alert("Something went wrong !! Please try again");<%
} 

pst = conn.prepareStatement("update products set hits="+(rs.getInt("hits")+1)+" where pid=0");
pst.executeUpdate();
%>

<script>
function buyNow(){
	window.open("move_to_shopping_list_popup.html","a","width=400,height=150,left=600,top=300");
}
function addToWishlist(){
	<% 
	String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
	try{
		pst = conn.prepareStatement("insert into wish_list values (2017314888,0,'"+inDate+inTime+"',0)");
		pst.executeUpdate();
		%> alert("The product is added to wishlist."); <%
	} catch(Exception e){
		%> alert("This product is already in the wish list.") <%
	}
	%>
}
</script>
    <header>
    	<div class="wrapper">
    		<h1>Gingko Market</h1>
    			<ul class="menu">
    				<li><a href="#">Home</a></li>
    				<li><a href="#">About</a></li>
    				<li><a href="#">Board</a></li>
    				<li><a href="#">Reference</a></li>
    				<li><a href="#">Contact</a></li>
    				<li id="moveToLogin"><a href="login.jsp">Sign In/Sign Up</a></li>
    			</ul>
    	</div>
    </header>

    <div class="container-fluid">
        <div class="content-wrapper">
    		<div class="item-container">
    				<div class="product_image">
    						<center>
    							<img id="item-display" src="<%=rs.getString("url") %>" alt=""></img>
    						</center>
    				</div>

		<div class="product_basic_info">
              <span id="views"><%=rs.getInt("hits") %> views</span>
              <h2><%=rs.getString("name") %></h2>
              <p>Seller ID: <%=rs.getString("sid") %></p>
              <p>phone number</p>
              <p><%=rs.getString("category") %></p>
              <p>Registered time: <%=rs.getDate("registered_time")+" "+rs.getTime("registered_time") %></p>
              <p>Trading place: <%=rs.getString("trading_place") %></p>
    		  <h3><%=rs.getInt("price") %> &#8361;</h3>
              <hr>
              <button type="button" onclick="addToWishlist();">Add to wishlist</button>
              <button type="button" onclick="buyNow();">Buy now</button>
    				</div>
    			</div>
<hr>

  <div class="product_detil">
    <h2>Product Details</h2>

    <section class="container product-info">
      product detail info <br>
      The Corsair Gaming Series GS600 power supply is the ideal price-performance solution for building or upgrading a Gaming PC. A single +12V rail provides up to 48A of reliable, continuous power for multi-core gaming PCs with multiple graphics cards. The ultra-quiet, dual ball-bearing fan automatically adjusts its speed according to temperature, so it will never intrude on your music and games. Blue LEDs bathe the transparent fan blades in a cool glow. Not feeling blue? You can turn off the lighting with the press of a button.

      <h3>Corsair Gaming Series GS600 Features:</h3>
      <li>It supports the latest ATX12V v2.3 standard and is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
      <li>An ultra-quiet 140mm double ball-bearing fan delivers great airflow at an very low noise level by varying fan speed in response to temperature</li>
      <li>80Plus certified to deliver 80% efficiency or higher at normal load conditions (20% to 100% load)</li>
      <li>0.99 Active Power Factor Correction provides clean and reliable power</li>
      <li>Universal AC input from 90~264V no more hassle of flipping that tiny red switch to select the voltage input!</li>
      <li>Extra long fully-sleeved cables support full tower chassis</li>
      <li>Over Current/Voltage/Power Protection, Under Voltage Protection and Short Circuit Protection provide complete component safety</li>
      <li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
      <li>MTBF: 100,000 hours</li>
    </section>
  </div>


    	</div>
    </div>
