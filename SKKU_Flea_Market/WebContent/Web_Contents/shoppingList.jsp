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
<div class="wrap cf">
  <h1 class="projTitle">Shopping List</h1>
  <div class="heading cf" id="heading">
    <h1>My shopping list</h1>
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
      </div>
     </li>
    </ul>
  </div>
  <div class="subtotal cf">
    <ul>
      <li class="totalRow">
      	<span class="label">Subtotal</span>
      	<span class="value">$35.00</span>
      </li>
      <li class="totalRow">
      	<span class="label">- In Progress</span>
      	<span class="value">$5.00</span>
      </li>
      <li class="totalRow final">
      	<span class="label">Total</span>
      	<span class="value">$30.00</span>
      </li>
    </ul>
  </div>  
</div>
</body>
<script type="text/javascript" src="js/shoppingList.js"></script>
</html>
