<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입페이지</title>
<link rel="stylesheet" href="style2.css">
<script src="jquery-3.4.1.js"></script>
</head>
<body>


<section class="login-form">
<form method="post" action="joinAction.jsp">

<h1>JOIN</h1>


<div class="form-group">
<div class="int-area">
<input type="text"  class="form-control" name="userID" id="id"
autocomplete="off" required>
<label for="id">USER ID</label>
<button type="submit" OnClick='Check_id()' value='ID 중복검사'>확인</button>
</div>
</div>

<div class="form-group">
<div class="int-area">
<input type="password"  class="form-control" name="userPassword" id="pass"
autocomplete="off" required>
<label for="pw">PASSWORD</label>
</div>
</div>


<br>
<div class="form-group" style="text-align:center;">
<div class="btn-group" data-toggle="buttons">
<label class="btn btn-primary active"><!-- 여자에 미리 체크되어있게하는거 -->
<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자  <!-- radio버튼은 둘중 한가지만 선택할수있게해줌 -->
</label>
<label class="btn btn-primary">
<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
</label>
</div>
</div>


<div class="form-group">
<div class="int-area">
<input type="text" class="form-control" name="userName" autocomplete="off" required> <!-- 오토컴프레트 요부분 이거없으면 파랑색으로 스슥바뀌는 그 효과가 사라짐 -->
<label for="text">NAME</label>
</div>
</div>

<div class="form-group">
<div class="int-area">
<input type="email" class="form-control" name="userEmail" autocomplete="off" required> <!-- type을 email로 해서 이메일양식을 지켜야함 -->
<label for="text">EMAIL</label>
</div>
</div>


<div class="btn-area">
<input type="submit" class="btn btn-primary form-control" value="JOIN">
</div>
</form>

<div class="caption">
<a href="">forgot Password?</a>
<div class="caption">
<a href="login.jsp">Go back to the login page</a>
<div class="caption">
<a href="home.jsp">Go back to the main page</a>
</div>
</div>
</div>

</section>

</body>
</html>