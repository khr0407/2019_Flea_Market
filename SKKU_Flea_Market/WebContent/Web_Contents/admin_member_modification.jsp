<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member Modification</title>
<link rel="stylesheet" href="./css/admin_member_modification.css">
</head>
<body>

<header>
    	<div class="wrapper">
    		<h1>Gingko Market</h1>
    			<ul class="menu">
    				<li><a href="#">Home</a></li>
    				<li><a href="#">About</a></li>
    				<li><a href="#">Board</a></li>
    				<li><a href="#">Reference</a></li>
    				<li><a href="#">Contact</a></li>
    			</ul>
    	</div>
    </header>
   
<div class="content-wrapper">
<h1>Member Modification</h1><hr>

<p><label>Student ID</label> <input type="text" value="2017314888"></p>
<p><label>Password</label> <input type="text" value="1234"></p>
<p><label>Name</label> <input type="text" value="yujin"></p>
<input type="button" value="�Ϸ�" onClick="Submit();">

</div>
<script type="text/javascript" src="./js/admin_member_modification.js"></script>
</body>
</html>