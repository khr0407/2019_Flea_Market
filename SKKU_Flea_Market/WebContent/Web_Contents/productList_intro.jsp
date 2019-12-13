<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/productList_intro.css">
  <meta charset="EUC-KR">
  <title>productList_intro</title>
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
} catch(Exception e){} 

%>
<body>
  <div id="card_left">
    <div id="card_flea" class="cardContainer inactive">
      <div class="card">
        <div class="side front">
          <div class="img">
            <img id="image1" src="src/flea_market.png" alt="">
          </div>
          <div class="info">
            <div id="info_title">
              <h2>Flea Market</h2>
            </div>
            <p>Click to see flea market products.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="card_right">
    <div id="card_auction" class="cardContainer inactive">
      <div class="card">
        <div class="side front">
          <div class="img">
          	<img id="image2" src="src/auction.png" alt="">
          </div>
          <div class="info">
            <div id="info_title">
              <h2>Auction</h2>
            </div>
            <p>Cilck to see auction products.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<script>
var card_flea = document.getElementById("card_flea");
var card_auction = document.getElementById("card_auction");

card_flea.addEventListener('click', () => {
	window.location = '<%="productList_buyer_flea.jsp?sid="+sid%>';
});

card_auction.addEventListener('click', () => {
	window.location = '<%="productList_buyer_auction.jsp?sid="+sid%>';
});
</script>

</html>
