<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>    
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String password = request.getParameter("password");
	String inputdate = request.getParameter("inputdate");
	String id = request.getParameter("id");
	
	sql="insert into board values('"+id+"','"+name+"','"+password+"','"+email+"','"+subject+"',"
			+" '"+content+"','"+inputdate+"','"+id+"', 0,0,0)";
	int result=stmt.executeUpdate(sql);
	
	if(result > 0){
	%>
	<script>
		alert("게시글이 등록이 완료되었습니다.")
		location.href = "list.jsp";
	</script>	
	<% }	
	else{
	%>
	<script>
		alert("게시글이 등록이 완료되지 않았습니다.")
		history.back();
	</script>
	<% 
	}	
	%>
