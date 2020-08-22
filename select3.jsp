<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스마트공장 공정관리 프로그램</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<section>
			<div>
				<h3>작업공정조회</h3>	
			</div>
			<table border="1" width="900" align="center">
				<tr>
					<th>작업시지번호</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>준비</th>
					<th>인쇄</th>
					<th>코팅</th>
					<th>합지</th>
					<th>접합</th>
					<th>포장</th>
					<th>최종공정일자</th>
					<th>최종공정시간</th>
				</tr>
				<%
					sql = " select substr(w.w_workno,0,4)||'-'||substr(w.w_workno,5,4) as w_workno, p.p_code, p.p_name,"
							+ " decode(p_p1,'Y','완료','N','~') as p_p1,decode(p_p2,'Y','완료','N','~') as p_p2,decode(p_p3,'Y','완료','N','~') as p_p3,"
							+ " decode(p_p4,'Y','완료','N','~') as p_p4,decode(p_p5,'Y','완료','N','~') as p_p5,decode(p_p6,'Y','완료','N','~') as p_p6,"
							+ " substr(r.w_lastdate,0,4)||'-'||substr(r.w_lastdate,5,2)||'-'||substr(r.w_lastdate,7,2) as w_lastdate,"
							+ " substr(r.w_lasttime,0,2)||':'||substr(r.w_lasttime,3,2) as w_lasttime from tbl_product p join tbl_worklist w on (p.p_code=w.p_code) join tbl_process r"
							+ " on w.w_workno = r.w_workno";
					rs = stmt.executeQuery(sql);			
				while(rs.next()){ %>
				
				<tr align="center">
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
					<td><%=rs.getString(11)%></td>
				</tr>
				<%
					} 
				%>
			</table>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>