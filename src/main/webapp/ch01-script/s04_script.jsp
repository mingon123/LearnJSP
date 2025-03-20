<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]성적처리</title>
</head>
<body>
<%--
배열 생성(score) 국어, 영어, 수학
출력 예시
국어 : 88
영어 : 99
수학 : 86
총점 : 273
평균 : 91
--%>
<%!
	// 선언부 : 변수(멤버변수) 선언, 메서드 선언
	String[] cours = {"국어","영어","수학"};
	int[] score = {88,99,86};
%>
<%
	// 스크립트릿 : 변수(지역변수) 선언, 연산자,제어문,출력
	int sum = 0;	// 상수아니면 선언부에 넣으면 안됨(공유데이터는 초기화되지 않고 누적됨)
	int avg = 0;
	for(int i=0;i<score.length;i++){
%>
	<%= cours[i] %> : <%= score[i] %><br>
<%
		// 총점 구하기
		sum += score[i];
	}
	// 평균 구하기
	avg = sum / score.length;
%>
총점 : <%= sum %><br>
평균 : <%= avg %>
</body>
</html>