<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
		function check(){
			if(search.search1.value.length == 0){
				alert("검색어를 입력해주세요")
				return search1.focus();
			}
			search.submit();
		}			
	</script>
	<section>
		<div>
			<b>게시판 
		</div>
		<table border="1" width="700">
			<tr align="center">
				<th>번호</th>
				<th width="400">제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<%
				Vector name = new Vector();
			Vector inputdate = new Vector();
			Vector email = new Vector();
			Vector subject = new Vector();
			Vector rcount = new Vector();
			Vector keyid = new Vector();
			Vector step = new Vector();

			int where = 1;

			int totalgroup = 0;
			int maxpages = 2;
			int startpage = 1;
			int endpage = startpage + maxpages - 1;
			int wheregroup = 1;

			if (request.getParameter("go") != null) {
				where = Integer.parseInt(request.getParameter("go"));
				wheregroup = (where - 1) / maxpages + 1;
				startpage = (wheregroup - 1) * maxpages + 1;
				endpage = startpage + maxpages - 1;
			} else if (request.getParameter("gogroup") != null) {
				wheregroup = Integer.parseInt(request.getParameter("gogroup"));
				startpage = (wheregroup - 1) * maxpages + 1;
				where = startpage;
				endpage = startpage + maxpages - 1;
			}
			int nextgroup = wheregroup + 1;
			int priorgroup = wheregroup - 1;

			int nextpage = where + 1;
			int priorpage = where - 1;
			int startrow = 0;
			int endrow = 0;
			int maxrows = 5;
			int totalrows = 0;
			int totalpages = 0;

			int id = 0;
			String em = null;

			try {
				stmt = con.createStatement();
				sql = "select * from board order by";
				sql = sql + " masterid desc, replynum, step, id";
				rs = stmt.executeQuery(sql);

				if (!(rs.next())) {
			%>
			<script>
						alert("게시글이 없습니다");
						location.href="insert.jsp";
			</script>
			<%
				} else {
				do {
					keyid.addElement(new Integer(rs.getString("id")));
					name.addElement(rs.getString("name"));
					email.addElement(rs.getString("email"));
					String idate = rs.getString("inputdate");
					inputdate.addElement(idate);
					subject.addElement(rs.getString("subject"));
					rcount.addElement(new Integer(rs.getInt("readcount")));
					step.addElement(new Integer(rs.getInt("step")));

				} while (rs.next());
				totalrows = name.size();
				totalpages = (totalrows - 1) / maxrows + 1;
				startrow = (where - 1) * maxrows;
				endrow = startrow + maxrows - 1;
				if (endrow >= totalrows)
					endrow = totalrows - 1;

				totalgroup = (totalpages - 1) / maxpages + 1;
				if (endpage > totalpages)
					endpage = totalpages;

				for (int j = startrow; j <= endrow; j++) {
					String temp = (String) email.elementAt(j);
					if ((temp == null) || (temp.equals("")))
				em = (String) name.elementAt(j);
					else
				em = "<A href=mailto:" + temp + ">" + name.elementAt(j) + "</A>";

					id = totalrows - j;
					if (j % 2 == 0) {
				out.println("<TR bgcolor='#FFFFFF' onMouseOver=\" bgColor= '#DFEDFF'\" onMouseOut=\"bgColor=''\">");
					} else {
				out.println("<TR bgcolor='#F4F4F4' onMouseOver=\" bgColor= '#DFEDFF'\" onMouseOut=\"bgColor='#F4F4F4'\">");
					}
					out.println("<TD align=center>");
					out.println(id + "</TD>");
					out.println("<TD>");
					int stepi = ((Integer) step.elementAt(j)).intValue();
					if (stepi > 0) {
				for (int count = 0; count < stepi; count++)
					out.print("&nbsp;&nbsp;");
					}
					String clink = "<A href=read.jsp?id=" + keyid.elementAt(j);
					clink = clink + "&page=" + where + ">" + subject.elementAt(j) + "</A>";
					out.print(clink + "</TD>");
					out.println("<TD align=center>");
					out.println(em + "</TD>");
					out.println("<TD align=center>");
					out.println(inputdate.elementAt(j) + "</TD>");
					out.println("<TD align=center>");
					out.println(rcount.elementAt(j) + "</TD>");
					out.println("</TR>");
				}
				rs.close();
			}
			out.println("</TABLE>");
			stmt.close();
			con.close();
			} catch (java.sql.SQLException e) {
				out.println(e);
			}
			%>
			<div>
				<%
					if (wheregroup > 1) {
					out.println("[<A href=list.jsp?gogroup=1>처음</A>]");
					out.println("[<A href=list.jsp?gogroup=" + priorgroup + ">이전</A>]");
				} else {
					out.println("[처음]");
					out.println("[이전]");
				}
				if (name.size() != 0) {
					for (int jj = startpage; jj <= endpage; jj++) {
						if (jj == where)
					out.println("[" + jj + "]");
						else
					out.println("[<A href=list.jsp?go=" + jj + ">" + jj + "</A>]");
					}
				}
				if (wheregroup < totalgroup) {
					out.println("[<A href=list.jsp?gogroup=" + nextgroup + ">다음</A>]");
					out.println("[<A href=list.jsp?gogroup=" + totalgroup + ">마지막</A>]");
				} else {
					out.println("[다음]");
					out.println("[마지막]");
				}
				out.println("전체 글수 :" + totalrows);
				%>
			</div>
			<form action="search.jsp" method="post" name="search">
				<table border="0" width="600" >
					<tr>
						<td><select name=stype>
								<option value=1>이름</option>
								<option value=2>제목</option>
								<option value=3>내용</option>
								<option value=4>이름+제목</option>
								<option value=5>이름+내용</option>
								<option value=6>제목+내용</option>
								<option value=7>이름+제목+내용</option>
							</select>
								<input type="text" name="search1" size="40">
								<input type="button"  style="width:60pt;" value ="검색" onClick="check();">
						</td>
					</tr>
				</table>
			</form>
			</section>
			<%@ include file="footer.jsp"%>
</body>
</html>