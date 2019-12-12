<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/productList_buyer_flea.css">
    <meta charset="EUC-KR">
    <title>productList_buyer_flea</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
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
						<%
							String query = "select * from 2019_flea_market.products where type='Flea' and status='On Sale'";
							try{
								Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
								Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","0000");

								PreparedStatement pst = conn.prepareStatement(query);
							
								ResultSet rs = pst.executeQuery();
								
								if (rs.next())
								{
									do
									{
									%>
										<tr class="item">
											<td class="column1"><%=rs.getString("name") %></td>
											<td class="column2"><%=rs.getString("category") %></td>
											<td class="column3"><%=rs.getString("price") %>&#8361;</td>
											<td class="column4"><%=rs.getString("trading_place") %></td>
											<td class="column5"><%=rs.getString("status") %></td>
											<td class="column6"><%=rs.getString("sid") %></td>
											<td class="column7"><%=rs.getString("contacts") %></td>
										</tr>
									<%
									}while(rs.next());
								}
								else
								{
									out.println("Query failed...");
								}
							}
							catch(Exception e){ out.println("Something went wrong !! Please try again");
							} 
						
						%>

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
