<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 
<title>로그인페이지</title>
<link rel="stylesheet" href="style2.css">
<script src="jquery-3.4.1.js"></script>
</head>
<body>


<section class="login-form">
<form method="post" action="loginAction.jsp">
<h1>LOGIN</h1>
<form action="">
<div class="form-group">
<div class="int-area">
<input type="text"  class="form-control" name="userID" id="id"
autocomplete="off" required>
<label for="id">USER ID</label>
</div>
</div>

<div class="form-group">
<div class="int-area">
<input type="password"  class="form-control" name="userPassword" id="pass"
autocomplete="off" required>
<label for="pw">PASSWORD</label>
</div>
</div>

<div class="btn-area">
<input type="submit" class="btn btn-primary form-control" value="LOGIN">
</div>
</form>

<div class="caption">
<a href="">forgot Password?</a>
<div class="caption">
<a href="join.jsp">join to be a member</a>
<div class="caption">
<a href="home.jsp">Go back to the main page</a>
</div>
</div>
</div>
</form>

</FORM>
</body>
</html>