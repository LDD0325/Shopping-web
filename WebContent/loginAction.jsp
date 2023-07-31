<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인액션페이지</title>
</head>
<body>
 
 <%
 
 String userID=null; //로그인된사람은 또다시 로그인할수없게 막아줌 
 if(session.getAttribute("userID") !=null){
	 userID=(String) session.getAttribute("userID");
 }
 if(userID !=null){ //유저아이디가 널값이 아닌경우
	 PrintWriter script = response.getWriter();
	 script.println("<script>");
     script.println("alert('이미 로그인이 되어있습니다.')");
     script.println("location.href = 'home.jsp'");
     script.println("</script>");
 }
 
 
  UserDAO userDAO = new UserDAO();
  int result = userDAO.login(user.getUserID(), user.getUserPassword());
  if (result ==1){ //result와 UserDAO에 return과 일치해야함
	  session.setAttribute("userID", user.getUserID()); //로그인이 맞았을때 
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('환영합니다!')");
      script.println("location.href = 'home.jsp'");
      script.println("</script>");  
  }
  else if(result ==0){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('비밀번호가 틀립니다')");
   script.println("history.back()");
   script.println("</script>");  
  }
  else if(result == -1){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('존재하지 않는 아이디 입니다.')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
  else if(result == -2){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('데이터 베이스 오류가 발생하였습니다. ')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
 %>
 
 </body>
 </html>