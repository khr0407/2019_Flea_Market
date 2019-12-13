var sellType = document.getElementsByName('sell_type');
var informationDiv = document.getElementById('informations');
informationDiv.style.display="none";

function GetSellType(){
	if(sellType[0].checked) displayFlea();
	else if (sellType[1].checked) displayAuction();
	else alert("select one");
}

function displayFlea(){
	informationDiv.style.display="block";
	document.getElementById('price').innerHTML = "Product price";
	document.getElementById('date').style.display="none";
}

function displayAuction(){
	informationDiv.style.display="block";
	document.getElementById('price').innerHTML = "Auction start price";
	document.getElementById('date').style.display="block";
}
