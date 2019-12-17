<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/productList_buyer_auction.css">
    <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="EUC-KR">
    <title>productList_buyer_auction</title>
</head>

<%@ page import ="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");

//get sid, pid
int sid = -1;
String sidString = request.getParameter("sid"); String pidString = request.getParameter("pid");
if(sidString != null) sid = Integer.parseInt(sidString); 

%>

<body>
<%
	request.setCharacterEncoding("euc-kr");
	String category = request.getParameter("category");
	String keyword = request.getParameter("keyword");
	String price_lower = request.getParameter("price_lower");
	String price_upper = request.getParameter("price_upper");
	String query="select * from 2019_flea_market.products where type='Auction' and status='On Sale'";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	
	if(category!=null) // clicked button
	{
		if(category.equals("all")) // categoryX
		{
			if(price_lower==null && price_upper==null) // priceX
			{
				if(keyword==null) // keyword X
					query="select * from 2019_flea_market.products where type='Auction' and status='On Sale'";
				else // keyword O
					query = "select * from 2019_flea_market.products where type='Auction' and status='On Sale' and name like '%"+keyword+"%'";
			}
			else // priceO
			{
				if(keyword==null) // keyword X
					query="select * from 2019_flea_market.products where type='Auction' and status='On Sale' and price>='"+price_lower+"' and price<='"+price_upper+"'";
				else // keyword O
					query = "select * from 2019_flea_market.products where type='Auction' and status='On Sale' and name like '%"+keyword+"%' and price>='"+price_lower+"' and price<='"+price_upper+"'";
			}			
		}
		else // categoryO
		{
			if(price_lower==null && price_upper==null) // priceX
			{
				if(keyword==null) // keyword X
					query="select * from 2019_flea_market.products where type='Auction' and status='On Sale' and category='"+category+"'";
				else // keyword O
					query = "select * from 2019_flea_market.products where type='Auction' and status='On Sale' and category='"+category+"' and name like '%"+keyword+"%'";
			}
			else // priceO
			{
				if(keyword==null) // keyword X
					query="select * from 2019_flea_market.products where type='Auction' and status='On Sale' and category='"+category+"' and price>='"+price_lower+"' and price<='"+price_upper+"'";
				else // keyword O
					query = "select * from 2019_flea_market.products where type='Auction' and status='On Sale' and category='"+category+"' and name like '%"+keyword+"%' and price>='"+price_lower+"' and price<='"+price_upper+"'";
			}			
		}
	}
	PreparedStatement pst = conn.prepareStatement(query);
	ResultSet rs = pst.executeQuery();
%>

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
 	<div class="limiter">
		<div class="container-table100">
			<div id="search_container">
        <div id="search_title">
          <img id="search_icon" src="src/search_icon.jpg" width="40" height="40">
          <p id="search_p">Smart Search - Auction</p>
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
								<th class="column7">Deadline</th>
							</tr>
						</thead>
						<tbody>
						<%
							while(rs.next())
							{
						%>
								<tr class="item" onclick="showItem(this)">
									<td class="column1"><%=rs.getString("name") %></td>
									<td class="column2"><%=rs.getString("category") %></td>
									<td class="column3"><%=rs.getString("price") %>&#8361;</td>
									<td class="column4"><%=rs.getString("trading_place") %></td>
									<td class="column5"><%=rs.getString("status") %></td>
									<td class="column6"><%=rs.getString("sid") %></td>
									<td class="column7"><%=rs.getString("auction_time") %></td>
									<td class="pid" style="display:none;"><%=rs.getString("pid") %></td>
								</tr>	
						<%
							}
						%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		var selectbox = document.getElementById("select_category");
		var search_button = document.getElementById("search_button");
		var price_lower = 0;
		var price_upper = 990000;
	
		(function() {
		  var parent = document.querySelector(".price-slider");
		  if(!parent) return;
	
		  var
		    rangeS = parent.querySelectorAll("input[type=range]"),
		    numberS = parent.querySelectorAll("input[type=number]");
	
		  rangeS.forEach(function(el) {
		    el.oninput = function() {
		      var slide1 = parseFloat(rangeS[0].value),
		        	slide2 = parseFloat(rangeS[1].value);
	
		      if (slide1 > slide2) {
				[slide1, slide2] = [slide2, slide1];
		      }
	
		      numberS[0].value = slide1;
		      numberS[1].value = slide2;
		      price_lower = numberS[0].value;
		      price_upper = numberS[1].value;
		    }
		  });
	
		  numberS.forEach(function(el) {
		    el.oninput = function() {
				var number1 = parseFloat(numberS[0].value),
				number2 = parseFloat(numberS[1].value);
	
		      if (number1 > number2) {
		        var tmp = number1;
		        numberS[0].value = number2;
		        numberS[1].value = tmp;
		      }
	
		      rangeS[0].value = number1;
		      rangeS[1].value = number2;
		      price_lower = numberS[0].value;
		      price_upper = numberS[1].value;
		    }
		  });
	
		})();
	
		search_button.addEventListener('click', () => {
		  var category = selectbox.options[selectbox.selectedIndex].value;
		  var keyword = document.getElementById("search_keyword").value;
		  
		  if(price_lower<0 || price_upper>990000 || price_lower>price_upper)
		  {
		    alert("Please enter valid price range! (0~990000)");
		  }
		  else
		  {
			if(category=="all") // categoryX
			{
				if(price_lower==0 && price_upper==990000) // priceX
				{
					if(keyword=="") // keywordX
						window.location = "productList_buyer_auction.jsp";
					else // keywordO
						window.location.href="productList_buyer_auction.jsp?category=all&keyword="+keyword;
				}
				else // priceO
				{
					if(keyword=="") // keywordX
						window.location.href="productList_buyer_auction.jsp?category=all&price_lower="+price_lower+"&price_upper="+price_upper;
					else // keywordO
						window.location.href="productList_buyer_auction.jsp?category=all&keyword="+keyword+"&price_lower="+price_lower+"&price_upper="+price_upper;					
				}
			}
			else // categoryO
			{
				if(price_lower==0 && price_upper==990000) // priceX
				{
					if(keyword=="") // keywordX
						window.location.href="productList_buyer_auction.jsp?category="+category;
					else // keywordO
						window.location.href="productList_buyer_auction.jsp?category="+category+"&keyword="+keyword;
				}
				else // priceO
				{
					if(keyword=="") // keywordX
						window.location.href="productList_buyer_auction.jsp?category="+category+"&price_lower="+price_lower+"&price_upper="+price_upper;
					else // keywordO
						window.location.href="productList_buyer_auction.jsp?category="+category+"&keyword="+keyword+"&price_lower="+price_lower+"&price_upper="+price_upper;					
				}				
			}
		  }
		});
		
		function showItem(e){
			var pid = e.cells[7].textContent;									
			window.location = 'product_info_auction.jsp?pid='+pid;
		}

	</script>
</body>
</html>
