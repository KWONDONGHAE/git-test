<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변달기</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
		int pos = 0;
	int step = 0;
	int rnum = 0;
	int mid = 0;
	int rid= 0;
	String cont = null;
	String sub = null;

	sql = "select to_char(sysdate, 'yyyy-mm-dd') as inputdate from dual";
	rs = stmt.executeQuery(sql);
	rs.next();
	String inputdate = rs.getString("inputdate");

	int id = Integer.parseInt(request.getParameter("id"));
	sql = "select max(id) from  board";
	rs = stmt.executeQuery(sql);
	if (!(rs.next()))
		rid = 1;
	else {
		rid = rs.getInt(1) + 1;
		rs.close();
		}
	
	try {
		sql = "select * from board where id=" + id;
		rs = stmt.executeQuery(sql);
		if (!(rs.next())) {
			out.println("해당 내용이 없습니다");
		} else {
			cont = ">" + rs.getString("content");
			while ((pos = cont.indexOf("\n", pos)) != -1) {
		String left = cont.substring(0, pos + 1);
		String right = cont.substring(pos + 1, cont.length());
		cont = left + ">" + right;
		pos += 2;
			}

			step = rs.getInt("step");
			mid = rs.getInt("masterid");
			rnum = rs.getInt("replynum");
			
			}


	%>
	<script type="text/javascript">
		function check() {
			if (board.name.value == "") {
				alert("이름을 입력해주세요");
				return board.name.focus();
			}
			if (board.email.value == "") {
				alert("Email을 입력해주세요");
				return board.email.focus();
			}
			if (board.subject.value == "") {
				alert("제목을 입력해주세요");
				return board.subject.focus();
			}
			if (board.content.value == "") {
				alert("내용을 입력해주세요");
				return board.content.focus();
			}
			if (board.password.value == "") {
				alert("암호를 입력해주세요");
				return board.password.focus();
			}
			board.submit();
		}
	</script>
	<section>
		<div>답변 글쓰기</div>
		<form
			action="rsave.jsp?id=<%=id%>&page=<%=request.getParameter("page")%>"
			method="post" name="board">
			<table border="1" width="700" align="center">
				<tr>
					<th>게시판 번호</th>
					<td><input type="text" name="rid" value="<%=rid%>" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" size="20"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email" size="20"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" size="40"
						value="RE :<%=rs.getString("subject")%>"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea style="resize: none;" cols="80" rows="20"
							name="content">
							
-----------------------------------------------------------------------------------<%=cont%></textarea></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="password" size="15">
						(암호를 입력하면 수정과 삭제 가능)</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><input type="text" name="inputdate" value="<%=inputdate%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="button"
						style="width: 60pt;" value="등록" onclick="check();"> <input
						type="button" style="width: 60pt;" value="조회"
						onclick="location='list.jsp'"></td>
				</tr>
			</table>
			<INPUT type="hidden" name="step" value="<%=step%>"> <INPUT
				type="hidden" name="mid" value="<%=mid%>"> <INPUT
				type="hidden" name="rnum" value="<%=rnum%>">
		</form>
		<%

		stmt.close();
		con.close();
		} catch (SQLException e) {
			out.println(e);
		}
		%>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>