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
				<h3>제품조회</h3>	
			</div>
			<table border="1" width="900" align="center">
				<tr>
					<th>제품코드</th>
					<th>제품명</th>
					<th>제품규격</th>
					<th>제품구분</th>
					<th>제품단가</th>
				</tr>
				<%
		
				sql ="select p_code, p_name, p_size, p_type, to_char(p_price,'L999,999') as p_price from tbl_product ";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					
				%>
				
				<tr align = "center">
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>			
				</tr>
				<%
				}
				%>
			</table>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>