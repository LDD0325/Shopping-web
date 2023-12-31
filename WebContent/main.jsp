<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 라이브러리를 불러올수있게 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>메인페이지</title>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
%>



<nav class="navbar navbar-default"><!-- 네비게이션 -->
<div class="navbar-header"> <!-- 네비게이션 상단 부분 -->
<!-- 네비겡션 상단 박스 영역 -->
<button type="button" class="navbar-toggle collapsed"
data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
aria-expanded="false">
<!-- 이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<!-- 상단 바에 제목이 나타나고 클릭하면 main페이지로 이동한다 -->
<a class="navbar-brand" href="main.jsp"> 게시판 웹 사이트</a>
</div>
<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
<div class="collapse navbar-collapse" id="bs-exqmple-navbar-collapse-1">
<ul class="nav navbar-nav">
<li class="active"><a href="main.jsp">메인</a></li>
<li><a href="bbs.jsp">게시판</a></li>
</ul>
<%
if(userID == null){ //로그인이되어있지않다면
%>
<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle"
data-toggle="dropdown" role="button" aria-haspopup="true"
aria-expanded="false">접속하기<span class="caret"></span></a>
<!-- 드랍다운 아이템 영역 -->
<ul class="dropdown-menu">
<li><a href="login.jsp">로그인</a></li>
<li><a href="join.jsp">회원가입</a></li>
</ul>
</li>
</ul>

<%
}else{ //그렇지않다면 (로그인이되어있다면)
%>
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a href="#" class="dropdown-toggle"
data-toggle="dropdown" role="button" aria-haspopup="true"
aria-expanded="false">회원관리<span class="caret"></span></a>
<!-- 드랍다운 아이템 영역 -->
<ul class="dropdown-menu">
<li><a href="logoutAction.jsp">로그아웃</a></li>
</ul>
</li>
</ul>
<%
}
%>
</div>
</nav>

<!-- 부트스트랩 참조 영역 -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>