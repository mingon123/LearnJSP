<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 확인</title>
</head>
<body>
<%--
짜장면 4,000원, 짬뽕 5,000원, 볶음밥 6,000원
출력예시
[주문 음식]
짜장면 : 2개
짬뽕 : 1개
총 지불금액 : 13,000원

최소 1개이상 주문
 --%>
 <%
 	int[] orderArray = {4000,5000,6000};
 %>
[주문음식]<br>
짜장면 : <%= request.getParameter("food_c0") %>개<br>
짬뽕 : <%= request.getParameter("food_c1") %>개<br>
볶음밥 : <%= request.getParameter("food_c2") %>개<br>
총 지불금액 :

</body>
</html>