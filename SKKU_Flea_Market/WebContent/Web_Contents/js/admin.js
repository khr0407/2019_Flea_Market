/*https://morioh.com/p/c421bd6a8cff*/
var selectbox = document.getElementById("select_category");
var search_button = document.getElementById("search_button");
var modify_button = document.getElementById("modify_button");
var delete_button = document.getElementById("delete_button");

search_button.addEventListener('click', () => {
  var category = selectbox.options[selectbox.selectedIndex].value;
  var keyword = document.getElementById("search_keyword").value;
/*  
  if(keyword=="")
  {
    alert("Please enter keyword!");
  }
  else
  {
  }
*/
});

modify_button.addEventListener('click', () => {
  /*modify 창 링크 연결*/

});

delete_button.addEventListener('click', () => {
  /*db에서 해당정보 지우기*/
  alert("Successfully deleted!");
  window.location = 'admin.jsp';
});