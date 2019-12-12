<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/login.css">
    <meta charset="EUC-KR">
    <title>Login/Registration</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL database connection
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","0000");

PreparedStatement pst = conn.prepareStatement("Select sid, pw, name from users");
ResultSet rs = pst.executeQuery();
if (rs.next()) out.println(rs.getString("sid") + " " + rs.getString("name"));
else out.println("Query failed...");
}
catch(Exception e){ out.println("Something went wrong !! Please try again");
} 
%>

  <div class="container" id="container">
  	<div class="form-container sign-up-container">
  		<form name="signup" method="post" action="#" onsubmit="return validate_signup()">
  			<h1>Registration</h1>
        <br><br><br>
  			<input type="text" id="signup_ID" name="studentID" placeholder="Student ID" />
        <div id="dup">
          <button id="dup_button">Check</button>
          <span id="dup_text"> Please check ID availability.</span>
        </div>
  			<input type="password" name="password" placeholder="Password" />
        <input type="text" name="name" placeholder="Name" />
        <div id="class_checkbox">
          <input type="checkbox" id="signup_buyer" name="signup_class" value="buyer">
          <label for="signup_buyer">Buyer</label>
          <input type="checkbox" id="signup_seller" name="signup_class" value="seller">
          <label for="signup_seller">Seller</label>
        </div>
        <br>
  			<button>Sign Up</button>
  		</form>
  	</div>
  	<div class="form-container sign-in-container">
  		<form name="signin" method="post" action="#" onsubmit="return validate_signin()">
  			<h1>Sign in</h1>
        <br><br><br>
  			<input type="text" name="studentID" placeholder="Student ID" />
  			<input type="password" name="password" placeholder="Password" />
        <div id="class_radiobutton">
          <input type="radio" id="signin_buyer" name="signin_class" value="buyer" checked>
          <label for="signin_buyer">Buyer</label>
          <input type="radio" id="signin_seller" name="signin_class" value="seller">
          <label for="signin_seller">Seller</label>
          <input type="radio" id="signin_admin" name="signin_class" value="admin">
          <label for="signin_admin">Admin</label>
        </div>
        <br>
  			<button>Sign In</button>
  		</form>
  	</div>
  	<div class="overlay-container">
  		<div class="overlay">
  			<div class="overlay-panel overlay-left">
  				<h1>Already have an account?</h1>
  				<p>Login with your account to start your shopping!</p>
  				<button class="ghost" id="signIn">Sign In</button>
  			</div>
  			<div class="overlay-panel overlay-right">
          <h1>New to <br>Gingko Market?</h1>
  				<p>Create your Gingko Market account and enjoy your shopping!</p>
  				<button class="ghost" id="signUp">Sign Up</button>
  			</div>
  		</div>
  	</div>
  </div>
  <script type="text/javascript" src="js/login.js"></script>
</body>
</html>
