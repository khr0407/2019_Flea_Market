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
<div class="wrap cf">
  <h1 class="projTitle">Wishlist</h1>
  <div class="heading cf" id="heading">
    <h1>My wishlist</h1>
    <a href="productList_intro.jsp" class="continue">Continue Shopping</a>
  </div>
  <div class="cart">
    <ul class="cartWrap">
      <li class="items odd">
        <div class="infoWrap">
          <div class="cartSection">
            <img src="http://lorempixel.com/output/technics-q-c-300-300-4.jpg" alt="" class="itemImg" />
            <p class="itemNumber">#QUE-007544-002</p>
            <h3>Item Name 1</h3>
            <p class="stockStatus"> In Stock</p>
          </div>
          <div class="prodTotal cartSection">
            <p>$15.00</p>
          </div>
          <div class="cartSection removeWrap">
             <a href="#" class="remove">x</a>
          </div>
        </div>
      </li>
      <li class="items even">
       <div class="infoWrap">
        <div class="cartSection">
          <img src="http://lorempixel.com/output/technics-q-c-300-300-4.jpg" alt="" class="itemImg" />
          <p class="itemNumber">#QUE-007544-002</p>
          <h3>Item Name 1</h3>
          <p class="stockStatus out"> Out of Stock</p>
        </div>
        <div class="prodTotal cartSection">
          <p>$15.00</p>
        </div>
        <div class="cartSection removeWrap">
          <a href="#" class="remove">x</a>
        </div>
       </div>
     </li>
     <li class="items odd">
      <div class="infoWrap">
       <div class="cartSection">
         <img src="http://lorempixel.com/output/technics-q-c-300-300-4.jpg" alt="" class="itemImg" />
         <p class="itemNumber">#QUE-007544-002</p>
         <h3>Item Name 1</h3>
         <p class="stockStatus"> In Stock</p>
       </div>
       <div class="prodTotal cartSection">
         <p>$15.00</p>
       </div>
       <div class="cartSection removeWrap">
         <a href="#" class="remove">x</a>
       </div>
      </div>
     </li>
    </ul>
  </div>
</div>
</body>
<script type="text/javascript" src="js/wishlist.js"></script>
</html>
