const wishlistButton = document.getElementById('wishlist');
const buynowButton = document.getElementById('buynow');

buynowButton.addEventListener('click',()=> {
	window.open("move_to_shopping_list_popup.html","a","width=400,height=150,left=200,top=100");
});

wishlistButton.addEventListener('click',()=>{
  alert("The product is added to wishlist.");
});
