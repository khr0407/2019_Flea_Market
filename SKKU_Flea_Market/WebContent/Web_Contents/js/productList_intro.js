
var card_flea = document.getElementById("card_flea");
var card_auction = document.getElementById("card_auction");

card_flea.addEventListener('click', () => {
	window.location = 'productList_buyer_flea.jsp';
});

card_auction.addEventListener('click', () => {
	window.location = '../productList_buyer_auction.jsp';
});

/*
const cards = document.querySelectorAll('.card');

function transition() {
  if (this.classList.contains('active')) {
    this.classList.remove('active')
  } else {
    this.classList.add('active');
  }
}

cards.forEach(card => card.addEventListener('click', transition));
*/
