<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Product register</title>
<link rel="stylesheet" href="./css/product_register.css">
</head>
<body> 
  <div class="content-wrapper">
    <h1>Product Resigster</h1> <hr>
    <form class="product_register_form" action="" method="post">
      <h3>Please select the sell type.</h3>
      <div id="sell_type">
      <input type="radio" name="sell_type" id="sell_type_flea" value="flea"> Flea
      <input type="radio" name="sell_type" id="sell_type_auction" value="auction"> Auction 
      <button type="button" id="sell_type_button">Ȯ��</button> <br>
      </div>
      
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
      <p><label>Product price</label> <input type="text" name="" value=""> </p>
      <p><label>Due date</label><input type="date" name="" value=""> </p>
      <p>
        <input type="radio" name="send_type" value="direct"> Direct deal
        <input type="radio" name="send_type" value="delivery"> By delivery <br><br>
        <input type="text" name="trading_place" placeholder="Enter trading place">
      </p>
      <p><label>Product image</label> <input type="file" name="file" value=""></p>
        <p><textarea name="details" placeholder="Enter the product detail informations."></textarea></p>
        <br> <input type="submit" name="" value="Submit">
    </form>
  </div>
  <script src="./js/product_register.js"></script>
</body>
</html>
