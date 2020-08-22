<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbcon.jsp" %>    
<%
	String w_workno =request.getParameter("w_workno");
	String p_p1 =request.getParameter("p_p1");
	String p_p2 =request.getParameter("p_p2");
	String p_p3 =request.getParameter("p_p3");
	String p_p4 =request.getParameter("p_p4");
	String p_p5 =request.getParameter("p_p5");
	String p_p6 =request.getParameter("p_p6");
	String w_lastdate =request.getParameter("w_lastdate");
	String w_lasttime =request.getParameter("w_lasttime");

switch(request.getParameter("pro")){
	case "insert":
	sql = "insert into tbl_process values('"+w_workno+"','"+p_p1+"','"+p_p2+"','"+p_p3+"',"
			+"'"+p_p4+"','"+p_p5+"','"+p_p6+"','"+w_lastdate+"','"+w_lasttime+"')";
		int result=stmt.executeUpdate(sql);
		if(result > 0){
			%>
			<script>
			alert("공정상태가 정상적으로 등록 되었습니다.");
			location.href="insert.jsp";
			</script>
		<% 
		} else {
		%>
		<script>
		alert("작업공정을 등록하지 못했습니다.");	
		histroy.back();
		</script>
		<% }
		break;
	case"update":
		sql = "update tbl_process set w_workno = '"+w_workno+"',p_p1 = '"+p_p1+"',p_p2 = '"+p_p2+"',p_p3 = '"+p_p3+"',"
				+"p_p4 = '"+p_p4+"',p_p5 = '"+p_p5+"',p_p6 = '"+p_p6+"',"
				+"w_lastdate = '"+w_lastdate+"',w_lasttime = '"+w_lasttime+"' where w_workno='"+w_workno+"'";
			result=stmt.executeUpdate(sql);
			if(result > 0){
				%>
				<script>
				alert("공정상태가 정상적으로 수정 되었습니다.");
				location.href="insert.jsp";
				</script>
			<% 
			} else {
			%>
			<script>
			alert("작업공정을 수정하지 못했습니다.");	
			histroy.back();
			</script>
			<% }
			break;
}
if(con != null) con.close();
if(stmt != null) stmt.close();
if(rs != null) rs.close();
%>


