<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
%>

<div class="wrap">
<div class="intro_bg">
<div class="header">
<div class="searchArea">

<form>
<input type="search" placeholder="Search"> <!--input타입은form으로 감싸줘야함-->
<span>검색</span>
</form>
</div>


<ul class="nav">

<div class="dropdown">
      <span class="dropbtn_icon"><a href="#">MY PAGE</a></span>
      <div class="dropdown-content">
        <a href="#">장바구니</a>
        <a href="#">회원수정</a>
        <a href="deleteTestForm.jsp">회원탈퇴</a>
      </div>
    </div>

<li><a href="#">CART</a></li>
<li><a href="bbs.jsp">Q&A</a></li>

<%
if(userID == null){ //로그인이되어있지않다면
%>

<li><a href="login.jsp">LOGIN</a></li>


<%
}else{ //그렇지않다면 (로그인이되어있다면)
%>

<li><a onclick="return confirm('로그아웃 하시겠습니까?')" href="logoutAction.jsp">LOGOUT</a></li>


<%
}
%>
</div>
</nav>

<div class="intro_text">
<h1>Su's Shopping</h1>
<h4 class="contents1">welcome to su's shopping mall</h4>
</div>
</div>
</div>


<ul class="amount">
<li>
<div>
<div class="contents1"><a href="#">상의</a></div>
</div>
</li>
<li>
<div>
<div class="contents1"><a href="#">하의</a></div>
</div>
</li>
<li>
<div>
<div class="contents1"><a href="#">신발</a></div>
</div>
</li>
<li>
<div>
<div class="contents1"><a href="#">액세사리</a></div>
</div>
</li>
</ul>

<div class="main_text0">
<h3>WEEKLY BEST ITEM</h3>

<ul class="icons">
<li>
<div class="icon_img">
<a href="http://j-blin.com/product/detail.html?product_no=8311&cate_no=86&display_group=1"><img src="img/1.jpg" width="250" height="250"></a>
<div class="contents1_bold">
니트
</div>
<div class="contents3">
16,900won
</div>
</div>
</li>

<li>
<div class="icon_img">
<a href="http://j-blin.com/product/detail.html?product_no=8105&cate_no=82&display_group=1"><img src="img/6.jpg" width="250" height="250"></a>
<div class="contents1_bold">
청바지
</div>
<div class="contents3">
20,900won
</div>
</div>
</li>

<li>
<div class="icon_img">
<a href="http://j-blin.com/product/detail.html?product_no=7903&cate_no=113&display_group=1"><img src="img/12.jpg" width="250" height="250"></a>
<div class="contents1_bold">
워커
</div>
<div class="contents3">
19,900won
</div>
</div>
</li>

<li>
<div class="icon_img">
<a href="http://j-blin.com/product/detail.html?product_no=8142&cate_no=113&display_group=1"><img src="img/11.jpg" width="250" height="250"></a>
<div class="contents1_bold">
거실슬리퍼
</div>
<div class="contents3">
9,900won
</div>
</div>
</li>
</ul>
</div>

<footer>
<div>
Su's<br>
Shopping
</div>
<div>
tel.010-1234-5678 / open pm12:30-pm6:00 <br>
농협 352-1234-5678-10 / 예금주 : (주)Su's쇼핑몰 <br>
서울턱별시 강남구 어쩌구저쩌구.
</div>
</footer>


</body>
</html>