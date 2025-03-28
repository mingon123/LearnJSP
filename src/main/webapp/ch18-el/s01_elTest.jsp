<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
<!-- M1은 2/3정도 사용되는데 EL은 spring에서도 사용됨 -->
<!-- EL의 +는 연결하는 능력없고 무조건 연산함 -->
<!-- EL에서는 연산하지 않고 자바에서 연산하고 출력만 함(덧셈,나눗셈은 생각해야함) -->
<table border="1" style="width:40%;">
	<tr>
		<th>표현식</th>
		<th>값</th>
	</tr>
	<tr>
		<td>\${2 + 5}</td>
		<td>${2 + 5}</td>
	</tr>
	<tr>
		<td>\${"10" + 5}</td>	
		<td>${"10" + 5}</td>
	</tr>
	<tr>
		<td>\${"10" + "5"}</td>	
		<td>${"10" + "5"}</td>
	</tr>
	<tr>
		<td>\${"십" + "5"}</td>	
		<td>에러발생(EL에서의 +는 연산만 가능)</td>
	</tr>
	<tr>
		<td>\${2 += 5}</td>	
		<td>${2 += 5}(문자열로 연결)</td>
	</tr>
	<tr>
		<td>\${"한국"+="서울"}</td>
		<td>${"한국"+="서울"}(문자열로 연결)</td>
	</tr>
	<tr>
		<td>\${4/5}</td>
		<td>${4/5}</td><!-- (정수체계를 유지하지 않음(JS와 같음)) : 절삭해서 정수체계 유지하도록 해야함 -->
	</tr>
	<tr>
		<td>\${5/0}</td>
		<td>${5/0}</td><!-- (JS와 같음) -->
	</tr>
</table>
</body>
</html>