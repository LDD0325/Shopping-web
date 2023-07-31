<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 라이브러리를 불러올수있게 -->
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %> <!-- 게시판의 목록을 추가시키기위해 필요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판</title>
<style type="text/css">
a, a:hover{
color:#000000;
text-decoration:none;
}
</style>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
int pageNumber =1; //현재게시판에 몇번째페이지인지 알려주기위해서
if(request.getParameter("pageNumber") !=null ){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //정수형으로바꿔줌
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
<a class="navbar-brand" href="home.jsp"> Su's shopping</a>
</div>
<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
<div class="collapse navbar-collapse" id="bs-exqmple-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="home.jsp">홈으로</a></li>
<li class="active"><a href="bbs.jsp">Q&A</a></li>
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
<li><a onclick="return confirm('로그아웃 하시겠습니까?')" href="logoutAction.jsp">로그아웃</a></li>
</ul>
</li>
</ul>
<%
}
%>
</div>
</nav>


<form method="post" action="searchedBbs.jsp">
<div class="col-lg-4">
	<input type="text" class="form-control pull-right" placeholder="Search" name="searchWord" />
	</div>
	<button class="btn btn-primary" type="submit" >
	<span class="glyphicon glyphicon-search">
	</span>
	</button>
</form>


<div class="container">
<div class="row">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead> <!-- 맨윗줄 -->
<tr> <!-- 한줄 -->
<th style="background-color:#eeeeee; text-align:center;">번호</th> <!-- 한줄 안에 속성 -->
<th style="background-color:#eeeeee; text-align:center;">제목</th>
<th style="background-color:#eeeeee; text-align:center;">작성자</th>
<th style="background-color:#eeeeee; text-align:center;">작성일</th>
</tr>
</thead>
<tbody>
<%
BbsDAO bbsDAO = new BbsDAO();
ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
for(int i = 0; i < list.size(); i++){
%>

<tr>
<td><%=list.get(i).getBbsID() %></td>
<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
<td><%=list.get(i).getUserID() %></td>
<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
</tr>

<%
}
%>
</tbody>
</table>

<%
if(pageNumber !=1){
%>
<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
<%
} if(bbsDAO.nextPage(pageNumber + 1)){
%>
<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
<%
}
%>
<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> <!-- rigth 오른쪽 -->
</div>
</div>


<!-- 부트스트랩 참조 영역 -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>