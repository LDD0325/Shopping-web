<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update action page</title>
</head>
<body>
	<%
	String userID = null;
	User user = new User();
	if(session.getAttribute("userID")!=null);{
	user.setUserID((String)session.getAttribute("userID"));
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} 
	String userName = null;
	if (request.getParameter("userName") != null) {
		//userName = Integer.parseInt(request.getParameter("bbsID"));
		
		user.setUserName(request.getParameter("userName"));
	}
	if (request.getParameter("userPassword") != null) {
		//userName = Integer.parseInt(request.getParameter("bbsID"));
		
		user.setUserPassword(request.getParameter("userPassword"));
	}
	if (request.getParameter("userGender") != null) {
		//userName = Integer.parseInt(request.getParameter("bbsID"));
		
		user.setUserGender(request.getParameter("userGender"));
	}
	if (request.getParameter("userEmail") != null) {
		//userName = Integer.parseInt(request.getParameter("bbsID"));
		
		user.setUserEmail(request.getParameter("userEmail"));
	}
	
	
	if (!userID.equals(user.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		//script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		if(request.getParameter("userPassword") == null || request.getParameter("userName") == null || request.getParameter("userGender") == null || request.getParameter("userEmail") == null
				||request.getParameter("userPassword").equals("") || request.getParameter("userName").equals("")||request.getParameter("userGender").equals("") || request.getParameter("userEmail").equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.modify(user);
			
			System.out.println("update for result int : " + result);
			if (result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else{
				System.out.println("update user href");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	}
	%>	
</body>
</html>