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
 
 	int total = 0;
 	String orderName = "";
 	
 	int food_c0 = Integer.parseInt(request.getParameter("food_c0"));
 	int food_c1 = Integer.parseInt(request.getParameter("food_c1"));
 	int food_c2 = Integer.parseInt(request.getParameter("food_c2"));
 	
 	if(food_c0 > 0){
 		total += orderArray[0] * food_c0;
 		orderName += "짜장면 : " + food_c0 + "개<br>";
 	}
 	if(food_c1 > 0){
 		total += orderArray[1] * food_c1;
 		orderName += "짬뽕 : " + food_c1 + "개<br>";
 	}
 	if(food_c2 > 0){
 		total += orderArray[2] * food_c2;
 		orderName += "볶음밥 : " + food_c2 + "개<br>";
 	}
%>
[주문음식]<br>
<%= orderName %>
총지불금액 : <%= String.format("%,d원",total) %>

</body>
</html>