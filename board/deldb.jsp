<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>  
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
try {
	sql = "select * from board where id=? ";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, id);
	rs = pstmt.executeQuery();
	if (!(rs.next())) {
		out.println("해당 내용이 없습니다");
	} else {
		String pwd = rs.getString("password");
		if (pwd.equals(request.getParameter("password"))) {
	sql = "delete from board where id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, id);
	int result = pstmt.executeUpdate();
	if (result > 0){
%>
<script>
	alert("삭제되었습니다");
	location.href="list.jsp";
</script>
<%
	}	else{
%>
<script>
	alert("삭제되지않았습니다");
	history.back();
</script>
<%
	}
} 
	else{
%>
<script>
	alert("비밀번호가 틀립니다.");
	history.back();
</script>
<%
	}
rs.close();
pstmt.close();
con.close();
}
	} catch (SQLException e) {
	out.println(e);
}
%>
