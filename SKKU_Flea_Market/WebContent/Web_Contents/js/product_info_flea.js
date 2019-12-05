const wishlistButton = document.getElementById('wishlist');
const buynowButton = document.getElementById('buynow');

buynowButton.addEventListener('click',()=> {
  window.location.href="Main.jsp"; // 나중에 상품 구매 페이지로 이동하기
});

wishlistButton.addEventListener('click',()=>{
  alert("The product is added to wishlist.");
});
