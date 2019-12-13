<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/productList_seller.css">
    <meta charset="EUC-KR">
    <title>productList_seller</title>
</head>
<body>


<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sid = request.getParameter("sid"); 
	String query = "select * from 2019_flea_market.deals where sid_seller='"+sid+"' and status<>'lose'";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","0000");
	PreparedStatement pst = conn.prepareStatement(query);
	ResultSet rs = pst.executeQuery();
%>


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
						<%
							while(rs.next())
							{
								String pid = rs.getString("pid");
								String sid_buyer = rs.getString("sid_buyer");
								String query1 = "select * from 2019_flea_market.products where pid='"+pid+"'";
								PreparedStatement p1 = conn.prepareStatement(query1);
								ResultSet rs1 = p1.executeQuery();
								rs1.next();
								
								String query2 = "select * from 2019_flea_market.deals where pid='"+pid+"'";
								PreparedStatement p2 = conn.prepareStatement(query2);
								ResultSet rs2 = p2.executeQuery();
								
								String query3 = "select count(*) from 2019_flea_market.wish_list where pid='"+pid+"'";
								PreparedStatement p3 = conn.prepareStatement(query3);
								ResultSet rs3 = p3.executeQuery();
								rs3.next();
						%>
								<tr class="item" onclick="showItem(this)">
									<td class="column1"><%=rs1.getString("registered_date") %></td>
									<td class="column2"><%=rs1.getString("name") %></td>
									<td class="column3"><%=rs.getString("type") %></td>
									<td class="column4"><%=rs.getString("price") %></td>
									<td class="column5"><%=rs.getString("status") %></td>
									<td class="column6"><%=rs.getString("sid_buyer") %></td>
									<td class="column7">
									<%
										while(rs2.next())
										{
									%>
											<%=rs2.getString("sid_buyer") %>:&nbsp;<%=rs2.getString("price") %>&#8361;
											<br>
									<%
										}
									 %>
									 </td>
									<td class="column8"><%=rs3.getInt(1) %></td>
									<td class="pid" style="display:none;"><%=pid%></td>
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
		function showItem(e){
			var pid = e.cells[8].textContent;									
			window.location = 'product_info_flea.jsp?pid='+pid;
		}
  	</script>
</body>
</html>
