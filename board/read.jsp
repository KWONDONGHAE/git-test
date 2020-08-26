<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 읽기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<div>게시판 읽기</div>
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
				String em = rs.getString("email");
				if ((em != null) && (!(em.equals(""))))
			em = "<A href=mailto:" + em + ">" + rs.getString("name") + "</A>";
				else
			em = rs.getString("name");
				out.println("<table width='700' border='1'>");
				out.println("<tr>");
				out.println("<td width = '150'>제목 : " + rs.getString("subject") + "</td>");
				out.println("<td>글쓴이 : " + em + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>작성일 : " + rs.getString("inputdate") + "</td>");
				out.println("<td>조회 : " + (rs.getInt("readcount") + 1) + "</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td height='200'>내용</td>");
				out.println("<td>" + rs.getString("content") + "</td>");
				out.println("</tr>");
		%>
		<tr>
			<td colspan="2" align="right">
			<input type="button" style="width:60pt;"value="조회"  onclick="location='list.jsp?go=<%=request.getParameter("page")%>'">
			<input type="button" style="width:60pt;"value="수정"  onclick="location='upd.jsp?id=<%=id%>&page=1'">
			<input type="button" style="width:60pt;"value="답변"  onclick="location='rinsert.jsp?id=<%=request.getParameter("id")%>&page=<%=request.getParameter("page")%>'">
			<input type="button" style="width:60pt;"value="삭제"  onclick="location='del.jsp?id=<%=id%>&page=1'">
			</td>
		</tr>
		</table>
	</section>
	<%
		sql = "update board set readcount= readcount + 1 where id= ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, id);
	pstmt.executeUpdate();
	}
	rs.close();
	pstmt.close();
	con.close();
	} catch (SQLException e) {
		out.println(e);
	}
	%>
	<%@ include file="footer.jsp"%>
</body>
</html>