<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/wishlist.css">
    <meta charset="EUC-KR">
    <title>Wishlist</title>
</head>
<body>


<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sidString = request.getParameter("sid"); 
	String query = "select * from 2019_flea_market.wish_list where sid='"+sidString+"'";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
	PreparedStatement pst = conn.prepareStatement(query);
	ResultSet rs = pst.executeQuery();


//get sid, pid
	int sid = -1;
	if(sidString != null) sid = Integer.parseInt(sidString);
%>


<div class="wrap cf">
  <h1 class="projTitle">Wishlist</h1>
  <div class="heading cf" id="heading">
    <h1>My wishlist</h1>
    <a href="<%="productlist_intro_temp.jsp?sid="+sid%>" class="continue">Continue Shopping</a>
  </div>
  <div class="cart">
    <ul class="cartWrap">
    <%
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
	            <p class="stockStatus"><%=rs1.getString("status") %></p>
	          </div>
	          <div class="prodTotal cartSection">
	            <p><%=rs1.getString("price") %>&#8361;</p>
	          </div>
	          <div class="cartSection removeWrap">
	             <a href="wishlist_deletion.jsp?sid=<%=sid %>&pid=<%=rs.getString("pid")%>" class="remove">x</a>
	          </div>
	        </div>
	      </li>
      <%
     	 }
      %>
    </ul>
  </div>
</div>
</body>
</html>
