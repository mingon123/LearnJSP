<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
<%
	// 가격 정보
	HashMap<String,Integer> map = new HashMap<>();
	map.put("가방",200000);
	map.put("신발",100000);
	map.put("옷",50000);
	map.put("식사권",150000);
	// 배송비
	int delivery_fee = 5000;
	// 총구매비용
	int sum = 0;
	/*
	구매 금액이 30만원 미만이면 배송비 5천원이 추가
	[출력예시]
	이름 : 홍길동
	배송희망일 : 2025-03-19
	구매 내용 : 가방,신발
	배송비 : 0원
	총구매비용(배송비포함) : 300,000원
	*/
%>
이름 : <%= request.getParameter("name") %><br>
배송희망일 : <%= request.getParameter("order_date") %><br>
구매 내용 : 
<%
	String[] items = request.getParameterValues("item");
	if(items!=null){
		for(int i=0;i<items.length;i++){
			// 구매 상품 금액 누적
			sum += map.get(items[i]);
			if(i>0) out.print(",");	
%>
			<%= items[i] %>
<%
		} // end of for
		// 배송비 구하기
		if(sum < 300000) sum += delivery_fee;
		else delivery_fee = 0;
%>
	<br>
	배송비 : <%= String.format("%,d원", delivery_fee) %>
	<br>
	총구매비용(배송비포함) : <%= String.format("%,d원", sum) %>
<%
	}
%>
</body>
</html>