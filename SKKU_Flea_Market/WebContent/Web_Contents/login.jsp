<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/login.css">
    <meta charset="EUC-KR">
    <title>Login/Registration</title>
</head>
<%@ page import ="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
String sidString = request.getParameter("studentID");
String pwdString = request.getParameter("password");
String classString = request.getParameter("signin_class");
String check = request.getParameter("login");

String sidRegister = request.getParameter("studentIDR");
String pwdRegister = request.getParameter("passwordR");
String nmRegister = request.getParameter("nameR");
String classRegister = request.getParameter("signup_class");
String register = request.getParameter("signup");

//MySQL database connection
ResultSet rs = null; PreparedStatement pst = null; Connection conn= null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/2019_flea_market?characterEncoding=UTF-8&serverTimezone=UTC","root","jyj980815#");
} catch(Exception e){ 
	%><script>alert("Something went wrong !! Please try again");</script><%
} 

if(check != null && check.equals("true")){
	try{
		pst = conn.prepareStatement("Select * from users where sid="+sidString+" and pw='"+pwdString+"' and class='"+classString+"'");
		rs = pst.executeQuery();	
		if (!rs.next()) %> <script>alert("입력한 정보와 일치하는 사용자가 없습니다.")</script> <%
		else { %><script>window.location.href="<%="main.jsp?sid="+sidString%>";</script><%}
	}catch(Exception e){}
}

if (register != null && register.equals("true")) {
	try {
		pst = conn.prepareStatement("Select * from users where sid=" + sidRegister + " and class='" + classRegister + "'");
		rs = pst.executeQuery();
		if (rs.next()) { %> <script> alert("중복되는 아이디 입니다.") </script> <% }
		else {
			pst = conn.prepareStatement("Insert into users values ("+sidRegister+",'"+pwdRegister+"','"+nmRegister+"','"+classRegister+"',0)");
			pst.executeUpdate();
			%> <script> alert("회원가입을 완료했습니다.") </script> <%
		}
		
	} catch (Exception e) { }
}

%>

<script>

function validate_signin(){
	var studentID = document.forms['signin']['studentID'].value;
	var password = document.forms['signin']['password'].value;

	// 빈칸 확인
	if(studentID==""){
		alert("Please enter your Student ID!");
	}
	else if(password=="")
		alert("Please enter your password!");
	else {
		return true;
	}
	return false;
}

function validate_signup(){
	var studentID = document.forms['signup']['studentIDR'].value;
	var password = document.forms['signup']['passwordR'].value;
	var name = document.forms['signup']['nameR'].value;
	
	// 빈칸 확인
	if(studentID=="")
		alert("Please enter your Student ID!");
	else if(password=="")
		alert("Please enter your password!");
	else if(name=="")
		alert("Please enter your name!");
	else if(signup_class=="")
		alert("Please check your user type!");
	else
	{
		// 데이터베이스 정보와 비교
		return true;
	}
	return false;
}

</script>

<body>
  <div class="container" id="container">
  	<div class="form-container sign-up-container">
  		<form name="signup" method="post" action="login.jsp?signup=true" onsubmit="return validate_signup()">
  			<h1>Registration</h1>
        <br><br><br>
  			<input type="text" id="signup_ID" name="studentIDR" placeholder="Student ID" />
  			<input type="password" name="passwordR" placeholder="Password" />
        <input type="text" name="nameR" placeholder="Name" />
        <div id="class_checkbox">
          <input type="radio" id="signup_buyer" name="signup_class" value="buyer" checked>
          <label for="signup_buyer">Buyer</label>
          <input type="radio" id="signup_seller" name="signup_class" value="seller">
          <label for="signup_seller">Seller</label>
        </div>
        <br>
  			<button>Sign Up</button>
  		</form>
  	</div>
  	<div class="form-container sign-in-container">
  		<form name="signin" method="post" action="login.jsp?login=true" onsubmit="return validate_signin()">
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
  			<button type="submit">Sign in</button>
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
