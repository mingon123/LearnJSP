<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 모듈화</title>
<style type="text/css">
	table{
		border-collapse: collapse;
		border: solid 1px #000;
		width: 500px;
		margin: 0 auto;
	}
	td{
		border: solid 1px #000;
		text-align: center;
		vertical-align: middle;
		height: 40px;
	}
	td.td-middle{
		text-align: left;
		vertical-align: top;
		height: 200px;
	}
	td.td-width{
		width: 100px
	}
</style>
</head>
<body>
<table>
	<tr>
		<td colspan="2">
			<jsp:include page="/ch04-actionTag/module/top.jsp">	<%-- <jsp:include> 액션태그 : 모듈화할 때 사용 --%>
				<jsp:param value="국제상사" name="company"/><%-- 변수에 값 지정 --%>
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td class="td-middle td-width">
			<jsp:include page="/ch04-actionTag/module/left.jsp"/>	<%-- 내용이 없으면 ""/로 닫는 태그 생략가능 --%>
		</td>
		<td class="td-middle">
			<!-- 내용 시작 -->
			레이아웃1
			<!-- 내용 끝 -->
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/ch04-actionTag/module/bottom.jsp"/>
		</td>
	</tr>
</table>
</body>
</html>