<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<script type="text/javascript">
	function check(){
		if(board.name.value==""){
			alert("이름을 입력해주세요");
			return board.name.focus();
		}
		if(board.email.value==""){
			alert("Email을 입력해주세요");
			return board.email.focus();
		}
		if(board.subject.value==""){
			alert("제목을 입력해주세요");
			return board.subject.focus();
		}
		if(board.content.value==""){
			alert("내용을 입력해주세요");
			return board.content.focus();
		}
		if(board.password.value==""){
			alert("암호를 입력해주세요");
			return board.password.focus();
		}
		board.submit();		
	}
	</script>
	<section>
		<div>
			글쓰기
		</div>
			<%
		int id = Integer.parseInt(request.getParameter("id"));
		String p = request.getParameter("page");
		
		try {
			sql = "select * from board where id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (!(rs.next())) {
				out.println("해당 내용이 없습니다");
			} else {

	%>
	<form action="upddb.jsp?id=<%=id %>&page=<%=p %>" method="post" name="board">
		<table border="1" width="700" align="center">
			<tr>
				<th>게시판 번호</th>
				<td><input type="text" name="id" value="<%=id%>" readonly></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="20" value="<%=rs.getString("name")%>"></td>
			</tr>	
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" size="20"value="<%=rs.getString("email")%>"></td>
			</tr>	
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="40"value="<%=rs.getString("subject")%>"></td>
			</tr>	
			<tr>
				<th>내용</th>
				<td><textarea style="resize: none;" cols="80" rows="20" name="content" ><%=rs.getString("content")%></textarea></td>
			</tr>	
			<tr>
				<th>암호</th>
				<td><input type="password" name="password" size="15">
				(암호를 입력하면 수정과 삭제 가능)</td>
			</tr>	
			<tr>
				<th>작성일</th>
				<td><input type="test" name="inputdate" value="<%=rs.getString("inputdate")%>"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" style="width:60pt;"value="수정"  onclick="check();">
					<input type="button" style="width:60pt;;"value="취소" onclick="history.back()">
					<input type="button" style="width:60pt;"value="조회"  onclick="location='list.jsp'">
				</th>
			</tr>
		</table>
	</form>	
		<%
		}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			out.println(e);
		}
	%>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>