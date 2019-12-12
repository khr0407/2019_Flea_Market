/*https://morioh.com/p/c421bd6a8cff*/
var selectbox = document.getElementById("select_category");
var search_button = document.getElementById("search_button");
var price_lower = 0;
var price_upper = 990000;

(function() {
  var parent = document.querySelector(".price-slider");
  if(!parent) return;

  var
    rangeS = parent.querySelectorAll("input[type=range]"),
    numberS = parent.querySelectorAll("input[type=number]");

  rangeS.forEach(function(el) {
    el.oninput = function() {
      var slide1 = parseFloat(rangeS[0].value),
        	slide2 = parseFloat(rangeS[1].value);

      if (slide1 > slide2) {
		[slide1, slide2] = [slide2, slide1];
      }

      numberS[0].value = slide1;
      numberS[1].value = slide2;
      price_lower = numberS[0].value;
      price_upper = numberS[1].value;
    }
  });

  numberS.forEach(function(el) {
    el.oninput = function() {
		var number1 = parseFloat(numberS[0].value),
		number2 = parseFloat(numberS[1].value);

      if (number1 > number2) {
        var tmp = number1;
        numberS[0].value = number2;
        numberS[1].value = tmp;
      }

      rangeS[0].value = number1;
      rangeS[1].value = number2;
      price_lower = numberS[0].value;
      price_upper = numberS[1].value;
    }
  });

})();

search_button.addEventListener('click', () => {
  var category = selectbox.options[selectbox.selectedIndex].value;
  var keyword = document.getElementById("search_keyword").value;
  
  if(keyword=="")
  {
    alert("Please enter keyword!");
  }
  else if(price_lower<0 || price_upper>990000 || price_lower>price_upper)
  {
    alert("Please enter valid price range! (0~990000)");
  }
  else
  {
	  /*데이터베이스에서 검색*/
  }
});
/*
$(document).ready(function(){
	$(.'item').click(function(){
		alert("Clicked!");
	});
});

*/