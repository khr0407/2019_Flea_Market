<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Product Register</title>
<link rel="stylesheet" href="./css/product_register.css">
<%@ page import ="java.sql.*"%>
<%@ page import = "java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

</head>
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
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","1234");
} catch(Exception e){ 
	%><script>alert("Something went wrong !! Please try again");</script><%
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
  <div class="content-wrapper">
    <h1>Product Register</h1> <hr>
    <form name="register" action=<%="product_register.jsp?next=true&sid="+sid%> method="post" enctype="multipart/form-data">
      <h3>Please select the sell type.</h3>
      <input type="radio" name="sell_type" id="sell_type_flea" value="flea"> Flea
      <input type="radio" name="sell_type" id="sell_type_auction" value="auction"> Auction 
      <input type="button" onClick="GetSellType();" value="확인"></input> <br>
      
      <div id="informations">
      <h3>Enter the product informations.</h3>
      <p><label>Product title</label> <input type="text" name="product_title" value=""></p>
      <p><label>Phone number</label> <input type="text" name="phone_number" value=""></p>
      <p>
      <label>Category</label> <select name="category" id="select_category">
        <option value="all" selected>Category</option>
        <option value="grocery">Grocery</option>
        <option value="clothing">Clothing</option>
        <option value="cosmetics">Cosmetics</option>
        <option value="books">Books</option>
        <option value="electronics">Electronics</option>
        <option value="furniture">Furniture</option>
        <option value="others">Others</option>
      </select> </p>
      <p><label id="price"></label> <input type="text" name="price" value=""> </p>
      <p id="date"><label>Due date</label><input type="date" name="due_date"> </p>
      <div class="trading_method">
      <p>How to trade</p>
      <p>
        <input type="radio" name="send_type" value="direct"> Direct deal
        <input type="text" id="trading_place" name="trading_place" placeholder="Enter trading place"> <br>
        <input type="radio" name="send_type" value="delivery"> By delivery
      </p>
      </div>
      <p><label>Product image</label> <input type="file" name="file" value=""></p>
        <p><textarea name="details" placeholder="Enter the product detail informations."></textarea></p>
        <br> <input type="submit" name="" value="완료">
        </div>
      
      </form>
  </div>
  <script src="./js/product_register.js"></script>
  <%
  //validate
  if(sid == -1) {
  	%><script>alert("Please sign in first");</script><%
  	%><script> window.location.href = "<%=request.getHeader("referer")%>" </script><%
  } else{
	  String next = request.getParameter("next");
	  if(next != null){
		  // image file
		  String uploadDir = this.getClass().getResource("").getPath();
		  uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"SKKU_Flea_Market/WebContent/Web_Contents/upload_image";
		  int maxSize = 1024 * 1024 * 100;
		  String encoding = "euc-kr";
		  MultipartRequest multi
			= new MultipartRequest(request, uploadDir, maxSize, encoding,
					new DefaultFileRenamePolicy());
		  String fileName = multi.getFilesystemName("file");
		  
		  String sell_type = multi.getParameter("sell_type");
		  String name = multi.getParameter("product_title");
		  String number = multi.getParameter("phone_number");
		  String category = multi.getParameter("category");
		  String price = multi.getParameter("price");
		  String date = multi.getParameter("due_date");
		  String send_type = multi.getParameter("send_type");
		  String place = multi.getParameter("trading_place");
		  String details = multi.getParameter("details");
		  
		  out.println("title: "+name+"\n");
		  out.println("phone number: "+number+"\n");
		  out.println("category: "+category+"\n");
		  out.println("price: "+price+"\n");
		  out.println("due date: "+date+"\n");
		  out.println("send type: "+send_type+"\n");
		  out.println("trading place: "+place);
		  out.println("details: "+details);
		  
		  if(name.equals("")) {%><script>alert("Please enter the product title");</script><%}
		  else if (number.equals("")) %><script>alert("Please enter the phone number");</script><%
		  else if (category.equals("")) %><script>alert("Please select the category");</script><%
		  else if (price.equals("")) %><script>alert("Please enter the price");</script><%
		  else if (sell_type.equals("auction") && date.equals("")) %><script>alert("Please enter the due date");</script><%
		  else if (send_type == null) %><script>alert("Please select send_type");</script><%
		  else if(send_type.equals("direct") && place.equals("")) %><script>alert("Please enter the trading place");</script><%
		  else if(fileName == null) %><script>alert("Please upload product's image file");</script><%
		  else if (details.equals("")) %><script>alert("Please enter the product details");</script><%
		  else{
			  try{
				  int integer_price = Integer.parseInt(price);
				  String query = "insert into products values(";
				  pst = conn.prepareStatement("Select * from products");
				  rs = pst.executeQuery();
				  rs.last();
				  int count=rs.getRow();
				  
				  String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
				  String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
				  
				  query = query+count+",";
				  query = query+sid +",";
				  query = query+"'"+name+"',";
				  query = query+"'"+category +"',";
				  query = query+price+",";
				  query = query+inDate+inTime+","; // time
				  query = query+"'"+place+"',";
				  query = query+"'"+number+"',";
				  query = query+"'"+sell_type+"',";
				  query = query+"'on sale',";
				  query = query+"0,";
				  if(sell_type.equals("flea")) query = query+"'"+fileName+"',null);";
				  else{
					  query = query+"'"+fileName+"',";
					  query = query+"'"+date+" 23:59:59');";
				  }
				  out.println(query);
				  pst=conn.prepareStatement(query);
				  pst.executeUpdate();
				  %><script>alert("Product is registered successfully");</script><%
			  } catch(NumberFormatException e){
				  %><script>alert("Please enter the number in the price");</script><%
			  } catch(Exception e){
				  %><script>alert("Something went wrong !! Please try again");</script><%
			  }
		  }
		  
		  %><script> window.location.href = "<%=request.getHeader("referer")%>" </script><%
		  
	  }  
  }
  %>
</body>
</html>
