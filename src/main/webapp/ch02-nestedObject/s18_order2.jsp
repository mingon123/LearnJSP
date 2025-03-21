<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 확인</title>
</head>
<body>
[주문음식]<br>
<%
	String[] foodName = {"짜장면","짬뽕","볶음밥"};
	int[] foodCost = {4000,5000,6000};
	int total = 0;
	
	for(int i=0;i<foodName.length;i++){
		int quantity = Integer.parseInt(request.getParameter("food_c"+i)); // 루프돌면서 c0,c1,c2 데이터 가져옴
		total += quantity * foodCost[i];
		if(quantity>0){
%>
			<%= foodName[i] %> : 
			<%= quantity %>개
			<br>
<%
		}
	}
%>
총지불금액 : <%= String.format("%,d원",total) %>

</body>
</html>