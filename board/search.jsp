<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<div>
			<b>게시판 
		</div>
		<CENTER>
			<form action="search.jsp" method="post" name="search">
				<table border="0" width="600">
					<tr>
						<td><select name=stype>
								<%
									String cond = null;
								int what = 1;
								String val = null;
								if (request.getParameter("stype") != null) {
									what = Integer.parseInt(request.getParameter("stype"));
									val = request.getParameter("search1");
									if (what == 1) {
										out.println("<OPTION value=1 selected>이름");
										cond = " where name like '%" + val + "%'";
									} else
										out.println("<OPTION value=1 >이름");
									if (what == 2) {
										out.println("<OPTION value=2 selected>제목");
										cond = " where subject like '%" + val + "%'";
									} else
										out.println("<OPTION value=2>제목");
									if (what == 3) {
										out.println("<OPTION value=3 selected>내용");
										cond = " where content  like '%" + val + "%'";
									} else
										out.println("<OPTION value=3>내용");
									if (what == 4) {
										out.println("<OPTION value=4 selected>이름/제목");
										cond = " where name  like '%" + val + "%'";
										cond = cond + " or  subject  like '%" + val + "%'";
									} else
										out.println("<OPTION value=4>이름/제목");
									if (what == 5) {
										out.println("<OPTION value=5 selected>이름/내용");
										cond = " where name  like '%" + val + "%'";
										cond = cond + " or  content  like '%" + val + "%'";
									} else
										out.println("<OPTION value=5>이름/내용");
									if (what == 6) {
										out.println("<OPTION value=6 selected>제목/내용");
										cond = " where subject  like '%" + val + "%'";
										cond = cond + " or  content  like '%" + val + "%'";
									} else
										out.println("<OPTION value=6>제목/내용");
									if (what == 7) {
										out.println("<OPTION value=7 selected>이름/제목/내용");
										cond = " where name  like '%" + val + "%'";
										cond = cond + " or  subject  like '%" + val + "%'";
										cond = cond + " or  content  like '%" + val + "%'";
									} else
										out.println("<OPTION value=7>이름/제목/내용");
									if (val.trim().equals(""))
										cond = "";
								}
								%>
						</select> <input type="text" name="search1" size="40"
							value="<%=request.getParameter("search1")%>"> <input
							type="button" style="width: 60pt;" value="검색" onClick="check();">
						</td>
					</tr>
				</table>
			</form>
			<TABLE border="1" width="600">
				<tr align="center">
					<td>번호</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>작성일</td>
					<td>조회</td>
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
					sql = "select * from board " + cond;
					sql = sql + " order by id desc";
					rs = stmt.executeQuery(sql);

					if (!(rs.next())) {
				%>
				<script>
					alert("게시글이 없습니다");
					location.href = "list.jsp";
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
							out.print("[<A href=search.jsp?gogroup=1");
							out.print("&stype=" + what + "&search1=" + val + ">처음</A>]");
							out.print("[<A href=search.jsp?gogroup=" + priorgroup);
							out.print("&stype=" + what + "&search1=" + val + ">이전</A>]");
					} else {
						out.println("[처음]");
						out.println("[이전]");
					}
					if (name.size() != 0) {
						for (int jj = startpage; jj <= endpage; jj++) {
							if (jj == where)
								out.println("[" + jj + "]");
							else
								out.print("[<A href=search.jsp?go=" + jj + "&stype=" + what + "&search1=" + val + ">" + jj + "</A>]");
						}
					}
					if (wheregroup < totalgroup) {
						out.print("[<A href=search.jsp?gogroup=" + nextgroup);
						out.print("&stype=" + what + "&search1=" + val + ">다음</A>]");
						out.print("[<A href=search.jsp?gogroup=" + totalgroup);
						out.print("&stype=" + what + "&search1=" + val + ">마지막</A>]");
					} else {
						out.println("[다음]");
						out.println("[마지막]");
					}
					out.println("전체 글수 :" + totalrows);
					%>
				</div>

				</section>
				<%@ include file="footer.jsp"%>
</body>
</html>