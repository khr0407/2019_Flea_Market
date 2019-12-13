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

<%@ page import ="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String sid = request.getParameter("sid");
	String userclass = request.getParameter("class");
	String keyword = request.getParameter("keyword");
	String userdelete = request.getParameter("delete");
	String query="select * from 2019_flea_market.users";
	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","0000");

	if(userclass!=null) // clicked button
	{
		if(userclass.equals("all")) // categoryX
		{
			if(keyword==null) // keywordX
				query="select * from 2019_flea_market.users";
			else // keyword O
				query="select * from 2019_flea_market.users where name like '%"+keyword+"%'";		
		}
		else // categoryO
		{
			if(keyword==null) // keyword X
				query="select * from 2019_flea_market.users where class='"+userclass+"'";
			else // keyword O
				query="select * from 2019_flea_market.users where class='"+userclass+"' and name like '%"+keyword+"%'";		
		}
	}
	
	PreparedStatement pst = conn.prepareStatement(query);
	ResultSet rs = pst.executeQuery();

%>


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
				<%
					int i=0;
					while(rs.next())
					{
				%>
						<tr class="item">
							<td class="column1" id="sid<%=i %>" value="!"><%=rs.getString("sid") %></td>
							<td class="column2"><%=rs.getString("pw") %></td>
							<td class="column3"><%=rs.getString("name") %></td>
							<td class="column4"><%=rs.getString("class") %></td>
                           <td class="column5"><button id="modify_button" value="sid<%=i %>" onclick="user_modify(this.value)">Modify</button></td>
                           <td class="column6"><button id="delete_button" value="sid<%=i %>" onclick="user_delete(this.value)">Delete</button></td>
						</tr>				
				<%
						i++;
					}
				%>                  
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   
	<script>
		var selectbox = document.getElementById("select_class");
		var search_button = document.getElementById("search_button");
	
		search_button.addEventListener('click', () => {
		  var userclass = selectbox.options[selectbox.selectedIndex].value;
		  var keyword = document.getElementById("search_keyword").value;

			if(userclass=="all") // classX
			{
				if(keyword=="") // keywordX
					window.location = "admin.jsp";
				else // keywordO
					window.location.href="admin.jsp?class=all&keyword="+keyword;
			}
			else // classyO
			{
				if(keyword=="") // keywordX
					window.location.href="admin.jsp?class="+userclass;
				else // keywordO
					window.location.href="admin.jsp?class="+userclass+"&keyword="+keyword;
		  }
		});
	
		function user_modify(value){
			var sid = document.getElementById(value).innerHTML;
			window.location.href = 'admin_member_modification.jsp?sid='+sid;
		}
		
		function user_delete(value){
			var sid = document.getElementById(value).innerHTML;
			window.location.href = 'admin_member_deletion.jsp?sid='+sid;
		}
			
	</script>
</body>
</html>