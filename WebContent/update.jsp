<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판글작성페이지</title>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
if(userID ==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
}
int bbsID = 0;
if(request.getParameter("bbsID") !=null){
	bbsID = Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID == 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글입니다.')");
	script.println("location.href = 'bbs.jsp'");
	script.println("</script>");
}
Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!userID.equals(bbs.getUserID())){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href = 'bbs.jsp'");
	script.println("</script>");
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
<li><a href="main.jsp">메인</a></li>
<li class="active"><a href="bbs.jsp">게시판</a></li>
</ul>


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

</div>
</nav>

<div class="container">
<div class="row">
<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead> <!-- 맨윗줄 -->
<tr> <!-- 한줄 -->
<th  colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글수정 양식</th> <!-- colspan="2"총두개만큼의 열을잡아먹음 -->
</tr>
</thead>
<tbody>
<tr>
<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td> <!-- input을넣는이유는 특정한정보를 액션페이지에 보내기위해서,  -->
</tr>
<tr>
<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%= bbs.getBbsContent() %></textarea></td> <!-- textarea장문의 글을쓸때사용 -->
</tr>
</tbody>
</table>
<input type="submit" class="btn btn-primary pull-right" value="글수정"> 
</form>
</div>
</div>


<!-- 부트스트랩 참조 영역 -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>