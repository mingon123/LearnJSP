<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
<form action="s03_elTest.jsp" method="post">
	좋아하는 계절
	<input type="checkbox" name="season" value="봄">봄
	<input type="checkbox" name="season" value="여름">여름
	<input type="checkbox" name="season" value="가을">가을
	<input type="checkbox" name="season" value="겨울">겨울
	<input type="submit" value="전송">
</form>
<br>
${paramValues.season[0]}<br><!-- 없는 인덱스를 만들어서 처리, Java는 오류나지만 EL은 오류나지 않음 (기본적으로 자리를 차지함) -->
${paramValues.season[1]}<br>
${paramValues.season[2]}<br>
${paramValues.season[3]}<br>
------------------------<br>
${paramValues["season"][0]}<br>
${paramValues["season"][1]}<br>
${paramValues["season"][2]}<br>
${paramValues["season"][3]}<br>
</body>
</html>