<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import ="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");

//get sid, pid
int sid = -1, pid = -1;
String sidString = request.getParameter("sid"); String 
pidString = request.getParameter("pid");

if(sidString != null) sid = Integer.parseInt(sidString);

if(pidString != null) pid = Integer.parseInt(pidString);
else pid=1;

//MySQL database connection
ResultSet rs = null; PreparedStatement pst = null; Connection conn= null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	
	pst = conn.prepareStatement("Select * from products where pid="+pid+" and type='auction'");
	rs = pst.executeQuery();
	if (!rs.next()) %> <script>alert("Database connection failed. Please try again.")</script> <%
} catch(Exception e){ 
	%>alert("Something went wrong !! Please try again");<%
} 

boolean bidPossible=false;
			
// 조회수 올리기
pst = conn.prepareStatement("update products set hits="+(rs.getInt("hits")+1)+" where pid="+pid);
pst.executeUpdate();

%>

<script>
var bidPossible = false;
function addToWishlist(){
	<% 
	String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
	try{
		pst = conn.prepareStatement("insert into wish_list values ("+sid+","+pid+",'"+inDate+inTime+"',0)");
		pst.executeUpdate();
		%> alert("The product is added to wishlist."); <%
	} catch(Exception e){
		%> alert("This product is already in the wish list.") <%
	}
	%>
}

function checkBidPrice(obj){
	  var price = currentPrice.innerHTML; price *= 1;
	  var myprice = bidPrice.value; myprice *= 1;
	  var isNumber = !isNaN(myprice);
	  if(!isNumber){
		  bidPossible=false; <% bidPossible=false; %>
		  bidAlertText.innerHTML = "Enter the number.";
	  }else if(price >= myprice){
		  bidPossible = false; <% bidPossible=false; %>
		  bidAlertText.innerHTML = "Bid price must larger than current price.";
	  } else{
		  bidPossible = true; <% bidPossible=true; %>
		  bidAlertText.innerHTML = "";
	  }

	}
</script>

    <link rel="stylesheet" href="./css/product_info_auction.css">
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
              <h3>Time remaining</h3>
              <h3><span id="currentPrice"><%=rs.getInt("price") %></span>&#8361; </h3>
              <p>Seller: <%=rs.getString("sid") %></p>
              <p>Phone number: <%=rs.getString("contacts") %></p>
              <p><%=rs.getString("category") %></p>
              <p>Registered time: <%=rs.getDate("registered_time")+" "+rs.getTime("registered_time") %></p>
              <p>Trading place:  <%=rs.getString("trading_place") %></p>
              <hr>
              
              <form action=<%="product_info_auction.jsp?sid="+sid+"&pid="+pid %> method="post">
              <input type="text" id="bidPrice" name="bidPrice" placeholder="Enter bidding price" onchange="checkBidPrice(this)">&#8361; <span id="bidAlertText"></span>
              <br>
<% 
if(sid != -1){
%>
              <button type="submit" id="bid">Bid</button>
              <button type="button" id="wishlist" onclick="addToWishlist();">Add to wishlist</button>
              <%} %>
              </form>
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
<%
String bidPrice = request.getParameter("bidPrice");
if(bidPrice != null){
	try{
		int price = Integer.parseInt(bidPrice);
		if(price <= rs.getInt("price")){
			%> <script>alert("Bid failed. Please enter higher price than current price.")</script><%
		} else{
			%> <script>alert("Bid success!")</script><%
			pst = conn.prepareStatement("update products set price="+price+" where pid="+pid);
			pst.executeUpdate();
			%><script> window.location.href = "product_info_auction.jsp?sid="+sid+"&pid="+pid;</script><%
		}
	} catch(Exception e){
		%> <script>
		alert("Bid failed. Please make sure the input is correct.");
		window.location.href = "product_info_auction.jsp?sid="+sid+"&pid="+pid;
		</script><%
	}	
}
%>