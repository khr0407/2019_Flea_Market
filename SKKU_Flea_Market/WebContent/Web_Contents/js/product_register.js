var sellTypeButton = document.getElementById('sell_type_button');
var flea = document.getElementById('sell_type_flea');

sellTypeButton.addEventListener('click',()=>{
	if(flea.checked == true) alert("sellTypeButton");
});