<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/productList_buyer_flea.css">
    <meta charset="EUC-KR">
    <title>productList_buyer_flea</title>
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
 	<div class="limiter">
		<div class="container-table100">
			<div id="search_container">
        <div id="search_title">
          <img id="search_icon" src="src/search_icon.jpg" width="40" height="40">
          <p id="search_p">Smart Search - Flea Market</p>
        </div>
	      <form id="search_form" method="post" action="#" onsubmit="return search_product()">
	        <div id="search_div">
	          <div id="search_first">
              <select name="category" id="select_category">
                <option value="all" selected>Category</option>
                <option value="grocery">Grocery</option>
                <option value="clothing">Clothing</option>
                <option value="cosmetics">Cosmetics</option>
                <option value="books">Books</option>
                <option value="electronics">Electronics</option>
                <option value="furniture">Furniture</option>
                <option value="others">Others</option>
              </select>
	          </div>
	          <div id="search_second">
	          	<div id="search_box">
	            	<input id="search_keyword" type="text" placeholder=" Enter search keyword" />
	            </div>
              <button id="search_button" type="button">
                <img src="src/search_icon.jpg" width="30" height="30">
              </button>
	          </div>
            <div id="search_third">
              <div class="price-slider">
                <div id="price_input">
                  <p id="price1">price:</p>
                  <div id="price_lower">
                    <input type="number" value="0" min="0" max="990000"/>
                  </div>
                  <p id="won">&#8361;</p>
                  <p id="price2">~</p>
                  <div id="price_upper">
                    <input type="number" value="990000" min="0" max="990000"/>
                  </div>
                  <p id="won">&#8361;</p>
                </div>
                <input value="0" min="0" max="200000" step="1000" type="range"/>
                <input value="200000" min="0" max="200000" step="1000" type="range"/>
              </div>
            </div>
          </div>
	      </form>
			</div>
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">Product Name</th>
								<th class="column2">Category</th>
								<th class="column3">Current Price</th>
								<th class="column4">Trading Place</th>
								<th class="column5">Status</th>
								<th class="column6">Seller</th>
								<th class="column7">Phone Number</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">010-1234-5678</td>
								</tr>
								<tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">010-1234-5678</td>
								</tr>
								<tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">010-1234-5678</td>
								</tr>
                <tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">010-1234-5678</td>
                </tr>
                <tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">010-1234-5678</td>
                </tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
  <script type="text/javascript" src="js/productList_buyer_flea.js"></script>
</body>
</html>
