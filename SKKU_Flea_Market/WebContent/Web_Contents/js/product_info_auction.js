var wishlistButton = document.getElementById('wishlist');
var bidAlertText = document.getElementById('bidAlertText');
var bidPrice = document.getElementById('bidPrice');
var currentPrice = document.getElementById('currentPrice');
var bidButton = document.getElementById('bid');
var bidPossible = false;

wishlistButton.addEventListener('click',()=>{
  alert("The product is added to wishlist.");
});

bidButton.addEventListener('click',()=>{
	if(bidPossible) alert("Bid success!");
	else alert("Bid failed");
})

function checkBidPrice(obj){
  var price = currentPrice.innerHTML; price *= 1;
  var myprice = bidPrice.value; myprice *= 1;
  var isNumber = !isNaN(myprice);
  if(!isNumber){
	  bidPossible=false;
	  bidAlertText.innerHTML = "Enter the number.";
  }else if(price >= myprice){
	  bidPossible = false;
	  bidAlertText.innerHTML = "Bid price must larger than current price.";
  } else{
	  bidPossible = true;
	  bidAlertText.innerHTML = "";
  }

}


