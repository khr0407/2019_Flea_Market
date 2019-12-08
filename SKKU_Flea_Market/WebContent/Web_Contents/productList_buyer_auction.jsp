<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/productList_buyer_auction.css">
    <meta charset="EUC-KR">
    <title>productList_buyer_auction</title>
</head>
<body>
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
								<tr>
									<td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">2019-12-25</td>
								</tr>
								<tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">2019-12-25</td>
								</tr>
								<tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">2019-12-25</td>
								</tr>
                <tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">2019-12-25</td>
                </tr>
                <tr>
                  <td class="column1">iPhone X 64Gb Grey</td>
									<td class="column2">Electronics</td>
									<td class="column3">\99900</td>
									<td class="column4">SKKU Domitory Shin-gwan-A</td>
									<td class="column5">On Sale</td>
									<td class="column6">Hera</td>
									<td class="column7">2019-12-25</td>
                </tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
  <script type="text/javascript" src="js/productList_buyer_auction.js"></script>
</body>
</html>
