<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스마트공장 공정관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
		function check(index) {
			if (f.w_workno.value == "") {
				alert("작업지시번호가 입력되지않았습니다.")
				return f.w_workno.focus();
			}
			if (f.p_p1[0].checked == false && f.p_p1[1].checked == false) {
				alert("재료준비가 선택되지않았습니다.")
				return f.p_p1[0].focus();
			}
			if (f.p_p2[0].checked == false && f.p_p2[1].checked == false) {
				alert("인쇄공정이 선택되지않았습니다.")
				return f.p_p2[0].focus();
			}
			if (f.p_p3[0].checked == false && f.p_p3[1].checked == false) {
				alert("코팅공정이 선택되지않았습니다.")
				return f.p_p3[0].focus();
			}
			if (f.p_p4[0].checked == false && f.p_p4[1].checked == false) {
				alert("합지공정이 선택되지않았습니다.")
				return f.p_p4[0].focus();
			}
			if (f.p_p5[0].checked == false && f.p_p5[1].checked == false) {
				alert("접합공정이 선택되지않았습니다.")
				return f.p_p5[0].focus();
			}
			if (f.p_p6[0].checked == false && f.p_p6[1].checked == false) {
				alert("포장적재가 선택되지않았습니다.")
				return f.p_p6[0].focus();
			}
			if (f.w_lastdate.value == "") {
				alert("최종작업일자가 입력되지않았습니다.")
				return f.w_lastdate.focus();
			}
			if (f.w_lasttime.value == "") {
				alert("최종작업시간이 입력되지않았습니다.")
				return f.w_lasttime.focus();
			}
			if(index ==1){
			document.getElementById("pro").value = 'insert';}
			if(index ==2){
			document.getElementById("pro").value = 'update';
			}
			f.submit();
		}
		function rewrite() {
			alert("정보를 지우고 처음부터 다시 입력합니다!")
			f.reset();
			f.w_workno.focus();
		}
	</script>
	<section>
		<div>
			<h3>작업공정등록</h3>
		</div>
		<form action="pro.jsp" method="post" name="f">
		<input type="hidden" name="pro" id= "pro" value="">
			<table border="1" width="500" align="center">
				<tr>
					<th>작업지시번호</th>
					<td><input type="text" size="20" name="w_workno">예)20190001</td>
				</tr>
				<tr>
					<th>재료준비</th>
					<td><input type="radio" size="20" name="p_p1" value="Y">완료
						<input type="radio" size="20" name="p_p1" value="N">작업중</td>
				</tr>
				<tr>
					<th>인쇄공정</th>
					<td><input type="radio" size="20" name="p_p2" value="Y">완료
						<input type="radio" size="20" name="p_p2" value="N">작업중</td>
				</tr>
				<tr>
					<th>코팅공정</th>
					<td><input type="radio" size="20" name="p_p3" value="Y">완료
						<input type="radio" size="20" name="p_p3" value="N">작업중</td>
				</tr>
				<tr>
					<th>합지공정</th>
					<td><input type="radio" size="20" name="p_p4" value="Y">완료
						<input type="radio" size="20" name="p_p4" value="N">작업중</td>
				</tr>
				<tr>
					<th>접합공정</th>
					<td><input type="radio" size="20" name="p_p5" value="Y">완료
						<input type="radio" size="20" name="p_p5" value="N">작업중</td>
				</tr>
				<tr>
					<th>포장적제</th>
					<td><input type="radio" size="20" name="p_p6" value="Y">완료
						<input type="radio" size="20" name="p_p6" value="N">작업중</td>
				</tr>
				<tr>
					<th>최종작업일자</th>
					<td><input type="text" size="20" name="w_lastdate">예)20190101</td>
				</tr>
				<tr>
					<th>최종작업시간</th>
					<td><input type="text" size="20" name="w_lasttime">예)1300</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="공정등록" onclick="check(1); return false">
						<input type="button" value="공정수정" onclick="check(2); return false"><input
						type="button" value="다시쓰기" onclick="rewrite();"></th>
				</tr>
			</table>
		</form>
		<br />
		<div>
			<b>[참고] 공정정보입력은 작업지시서에 등록된 작업지시번호를 참조하여 저장</b>
		</div>
	</section>

	<%@ include file="footer.jsp"%>
</body>
</html>