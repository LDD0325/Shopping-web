<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 라이브러리를 불러올수있게 -->
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
<title>게시판글보기</title>
</head>
<body>
<%
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}

//게시판글보이게하기
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
<li><a  onclick="return confirm('로그아웃 하시겠습니까?')" href="logoutAction.jsp">로그아웃</a></li>
</ul>
</li>
</ul>
<%
}
%>
</div>
</nav>

<div class="container">
<div class="row">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead> <!-- 맨윗줄 -->
<tr> <!-- 한줄 -->
<th  colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글보기 양식</th> <!-- colspan="2"총두개만큼의 열을잡아먹음 -->
</tr>
</thead>
<tbody>
<tr>
<td style="width:20%;">글 제목</td> <!-- 본문은 특수문자방지, 글제목에는 스크립트해킹방지 -->
<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
</tr>
<tr>
<td>작성자</td>
<td colspan="2"><%= bbs.getUserID() %></td>
</tr>
<tr>
<td>작성일자</td>
<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
</tr>
<tr>
<td>내용</td> <!-- 밑줄은 특수문자 쓸수있게 넣어줬음 ! -->
<td colspan="2" style="min-height: 200px; text-align:left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
</tr>
</tbody>
</table>
<a href="bbs.jsp" class="btn btn-primary">목록</a>
<%
if(userID != null && userID.equals(bbs.getUserID())){ //작성자가 본인이라면
%>
<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
<%
}
%>

</div>
</div>


<!-- 부트스트랩 참조 영역 -->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>