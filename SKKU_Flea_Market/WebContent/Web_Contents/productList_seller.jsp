<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/productList_seller.css">
    <meta charset="EUC-KR">
    <title>productList_seller</title>
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
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">Registration Time</th>
								<th class="column2">Product Name</th>
								<th class="column3">Type</th>
								<th class="column4">Current Price</th>
								<th class="column5">Status</th>
								<th class="column6">Buyer</th>
								<th class="column7">History</th>
                <th class="column8">Wishlist</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td class="column1">2019-11-29 01:22</td>
									<td class="column2">iPhone X 64Gb Grey</td>
									<td class="column3">auction</td>
									<td class="column4">\99900</td>
									<td class="column5">Bidding</td>
									<td class="column6">Hera</td>
									<td class="column7">Hera: \99000 <br>Yujin: \88000</td>
                  <td class="column8">1</td>
								</tr>
								<tr>
                  <td class="column1">2019-11-29 01:22</td>
									<td class="column2">iPhone X 64Gb Grey</td>
									<td class="column3">flea market</td>
									<td class="column4">\99900</td>
									<td class="column5">Purchased</td>
									<td class="column6">Hera</td>
									<td class="column7">Hera: \99000</td>
                  <td class="column8">1</td>
								</tr>
								<tr>
                  <td class="column1">2019-11-29 01:22</td>
									<td class="column2">iPhone X 64Gb Grey</td>
									<td class="column3">flea market</td>
									<td class="column4">\99900</td>
									<td class="column5">Purchased</td>
									<td class="column6">Hera</td>
									<td class="column7">Hera: \99000</td>
                  <td class="column8">1</td>
								</tr>
                <tr>
                  <td class="column1">2019-11-29 01:22</td>
                  <td class="column2">iPhone X 64Gb Grey</td>
                  <td class="column3">flea market</td>
                  <td class="column4">\99900</td>
                  <td class="column5">Purchased</td>
                  <td class="column6">Hera</td>
                  <td class="column7">Hera: \99000</td>
                  <td class="column8">1</td>
                </tr>
                <tr>
                  <td class="column1">2019-11-29 01:22</td>
                  <td class="column2">iPhone X 64Gb Grey</td>
                  <td class="column3">flea market</td>
                  <td class="column4">\99900</td>
                  <td class="column5">Purchased</td>
                  <td class="column6">Hera</td>
                  <td class="column7">Hera: \99000</td>
                  <td class="column8">1</td>
                </tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
  <script type="text/javascript" src="js/productList_seller.js"></script>
</body>
</html>
