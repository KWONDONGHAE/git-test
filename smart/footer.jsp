<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
</head>
<body>
	<footer>
		스마트공장 공정관리프로그램 저작권관련 정보
	</footer>
</body>
</html>
<%
	if(con != null)con.close();
	if(stmt != null)stmt.close();
	if(rs != null)rs.close();
%>