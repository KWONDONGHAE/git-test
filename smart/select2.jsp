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
				<h3>작업지시서조회</h3>	
			</div>
			<table border="1" width="900" align="center">
				<tr>
					<th>작업시지번호</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>제품규격</th>
					<th>제품구분</th>
					<th>수량</th>
					<th>작업시작일</th>
				</tr>
				<%
					sql = "select substr(w_workno,0,4)||'-'||substr(w_workno,5,4) as w_workno, w.p_code, p.p_name,p.p_size,p.p_type,"
					+ "w.w_quantity, to_char(w_workdate,'yyyy-mm-dd') as w_workdate from tbl_product p join tbl_worklist w on p.p_code=w.p_code";
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
				</tr>
				<%
					} 
				%>
			</table>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>