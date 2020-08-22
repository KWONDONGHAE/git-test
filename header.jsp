<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbcon.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="style.css", rel="stylesheet", type="text/css">
</head>
<body>
	<header>
		<h1>스마트공장관리 프로그램</h1>	
	</header>
	<nav>
		<a href ="select.jsp">제품조회</a>
		<a href ="select2.jsp">작업지시서조회</a>
		<a href ="insert.jsp">작업공정등록</a>
		<a href ="select3.jsp">작업공정조회</a>
		<a href ="index.jsp">홈으로</a>	
	</nav>
</body>
</html>