<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JSP 웹사이트</title>
</head>
<body>
<%
session.invalidate(); //세션을 빼앗기(로그아웃)
%>
<script>
location.href='home.jsp'; //세션뺏고 메인페이지로이동?
</script>

 
 </body>
 </html>