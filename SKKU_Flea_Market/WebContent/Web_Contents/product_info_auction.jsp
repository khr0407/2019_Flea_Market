<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <link rel="stylesheet" href="./css/product_info_auction.css">

    <div class="container-fluid">
        <div class="content-wrapper">
    		<div class="item-container">
    				<div class="product_image">
    						<center>
    							<img id="item-display" src="./image_src/product.png" alt=""></img>
    						</center>
    				</div>

    				<div class="product_basic_info">
              </h2><span id="views">00 views</span>
    					<h2>Product title</h2>
              <h3>Time remaining</h3>
              <h3>$ <span id="currentPrice">80000</span> </h3>
              <p>Seller: sellerID</p>
              <p>phone number</p>
              <p>Product category</p>
              <p>Prodcut register date</p>
              <p>Trading place / By delivery</p>
    					<hr>
              <input type="text" id="bidPrice" placeholder="Enter bidding price"> <span id="bidAlertText"></span>
              <br>
              <button type="button" id="bid">Bid</button>
              <button type="button" id="wishlist">Add to wishlist</button>
    				</div>
    			</div>
<hr>

  <div class="product_detil">
    <h2>Product Details</h2>

    <section class="container product-info">
      product detail info <br>
      The Corsair Gaming Series GS600 power supply is the ideal price-performance solution for building or upgrading a Gaming PC. A single +12V rail provides up to 48A of reliable, continuous power for multi-core gaming PCs with multiple graphics cards. The ultra-quiet, dual ball-bearing fan automatically adjusts its speed according to temperature, so it will never intrude on your music and games. Blue LEDs bathe the transparent fan blades in a cool glow. Not feeling blue? You can turn off the lighting with the press of a button.

      <h3>Corsair Gaming Series GS600 Features:</h3>
      <li>It supports the latest ATX12V v2.3 standard and is backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
      <li>An ultra-quiet 140mm double ball-bearing fan delivers great airflow at an very low noise level by varying fan speed in response to temperature</li>
      <li>80Plus certified to deliver 80% efficiency or higher at normal load conditions (20% to 100% load)</li>
      <li>0.99 Active Power Factor Correction provides clean and reliable power</li>
      <li>Universal AC input from 90~264V no more hassle of flipping that tiny red switch to select the voltage input!</li>
      <li>Extra long fully-sleeved cables support full tower chassis</li>
      <li>Over Current/Voltage/Power Protection, Under Voltage Protection and Short Circuit Protection provide complete component safety</li>
      <li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
      <li>MTBF: 100,000 hours</li>
    </section>
  </div>


    	</div>
    </div>

    <script src="./js/product_info_auction.js"></script>
