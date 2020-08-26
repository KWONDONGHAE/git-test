<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.*,java.text.*"%>
<%@ include file="header.jsp"%>
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
int rid =  Integer.parseInt(request.getParameter("rid"));
int mid = Integer.parseInt(request.getParameter("mid"));
int rnum = Integer.parseInt(request.getParameter("rnum"));
int step = Integer.parseInt(request.getParameter("step")) + 1;

try {
	if (step == 1) {
		sql = "select max(replynum) from board where masterid=" + mid;
		rs = stmt.executeQuery(sql);
		if (!(rs.next()))
	rnum = 1;
		else
	rnum = rs.getInt(1) + 1;
	}
	sql = "insert into board(id,name,password,email,subject,";
	sql = sql + "content,inputdate,masterid,readcount,replynum,step)";
	sql= sql + "values('"+rid+"','"+name+"','"+password+"','"+email+"','"+subject+"',"
			+" '"+content+"','"+inputdate+"'," + mid + ","
			+ "0," + rnum + "," + step + ")";

	int result = stmt.executeUpdate(sql);
	if(result > 0){
	%>
	<script>
		alert("답변등록이 완료되었습니다.")
		location.href = "list.jsp";
	</script>	
	<% }	
	else{
	%>
	<script>
		alert("답변등록이 완료되지 않았습니다.")
		history.back();
	</script>
	<% 
	}	
	stmt.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}
%>