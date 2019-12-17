<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/shoppingList.css">
    <meta charset="EUC-KR">
    <title>Shopping List</title>
</head>
<body>


<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sidString = request.getParameter("sid");
	String query="select * from 2019_flea_market.deals where sid_buyer='"+sidString+"' and status<>'lose'";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	PreparedStatement pst = conn.prepareStatement(query);
	ResultSet rs = pst.executeQuery();
	
	//get sid, pid
		int sid = -1;
		if(sidString != null) sid = Integer.parseInt(sidString);
%>


<div class="wrap cf">
  <h1 class="projTitle">Shopping List</h1>
  <div class="heading cf" id="heading">
    <h1>My shopping list</h1>
    <a href="<%="productlist_intro_temp.jsp?sid="+sid%>" class="continue">Continue Shopping</a>
  </div>
  <div class="cart">
    <ul class="cartWrap">
   	<%
   		int subtotal = 0;
   		int in_progress = 0;
    	while(rs.next())
    	{
    		String pid = rs.getString("pid");
    		String query1 = "select * from 2019_flea_market.products where pid='"+pid+"'";
    		PreparedStatement p1 = conn.prepareStatement(query1);
			ResultSet rs1 = p1.executeQuery();
			rs1.next();
    %>
	      <li class="items odd">
	        <div class="infoWrap">
	          <div class="cartSection">
	            <img src="<%=rs1.getString("url") %>" alt="" class="itemImg" />
	            <p class="itemNumber"><%=rs.getString("pid") %></p>
	            <h3><%=rs1.getString("name") %></h3>
	            <p class="stockStatus"><%=rs.getString("status") %></p>
	          </div>
	          <div class="prodTotal cartSection">
	            <p><%=rs1.getString("price") %>&#8361;</p>
	          </div>
	        </div>
	      </li>
      <%
      		String status = rs.getString("status");
      		int value = Integer.parseInt(rs1.getString("price"));
      		
      		if(status.equals("Bidding"))
      		{
      			subtotal += value;
      			in_progress += value;
      			
      		}
      		else if(status.equals("Dealing") || status.equals("Purchased"))
      			subtotal += value;
     	 }
      %>
    </ul>
  </div>
  <div class="subtotal cf">
    <ul>
      <li class="totalRow">
      	<span class="label">Subtotal</span>
      	<span class="value"><%=subtotal %>&#8361;</span>
      </li>
      <li class="totalRow">
      	<span class="label">- In Progress</span>
      	<span class="value"><%=in_progress %>&#8361;</span>
      </li>
      <li class="totalRow final">
      	<span class="label">Total</span>
      	<span class="value"><%=subtotal - in_progress %>&#8361;</span>
      </li>
    </ul>
  </div>  
</div>
</body>
<script type="text/javascript" src="js/shoppingList.js"></script>
</html>
