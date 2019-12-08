<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/productList_intro.css">
  <meta charset="EUC-KR">
  <title>productList_intro</title>
</head>
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
  <script type="text/javascript" src="js/productList_intro.js"></script>
</body>
</html>
