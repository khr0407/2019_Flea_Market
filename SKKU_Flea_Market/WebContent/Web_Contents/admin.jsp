<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/admin.css">
    <meta charset="EUC-KR">
    <title>Admin</title>
</head>
<body>
    <div class="limiter">
      <div class="container-table100">
         <div id="search_container">
        <div id="search_title">
          <img id="search_icon" src="src/search_icon.jpg" width="40" height="40">
          <p id="search_p">Smart Search - Administrator</p>
        </div>
         <form id="search_form" method="post" action="#" onsubmit="return search_product()">
           <div id="search_div">
             <div id="search_first">
              <select name="class" id="select_class">
                <option value="all" selected>Class</option>
                <option value="buyer">Buyer</option>
                <option value="seller">Seller</option>
                <option value="buyer/seller">Buyer/Seller</option>
              </select>
             </div>
             <div id="search_second">
                <div id="search_box">
                  <input id="search_keyword" type="text" placeholder=" Enter search keyword" />
               </div>
              <button id="search_button" type="button">
                <img src="src/search_icon.jpg" width="30" height="30">
              </button>
             </div>
            </div>
         </form>
         </div>
         <div class="wrap-table100">
            <div class="table100">
               <table>
                  <thead>
                     <tr class="table100-head">
                        <th class="column1">Student ID</th>
                        <th class="column2">Password</th>
                        <th class="column3">Name</th>
                        <th class="column4">Class</th>
                        <th class="column5">Modify</th>
                        <th class="column6">Delete</th>
                     </tr>
                  </thead>
                  <tbody>
                  <%for(int i=0;i<3;i++){ %>
                        <tr>
                           <td class="column1">2017312498</td>
                           <td class="column2">password!</td>
                           <td class="column3">Juwon Yang</td>
                           <td class="column4">Buyer/Seller</td>
                           <td class="column5"><button id="modify_button">Modify</button></td>
                           <td class="column6"><button id="delete_button">Delete</button></td>
                        </tr>
                  <% }%>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript" src="js/admin.js"></script>
</body>
</html>