<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.web.member.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 이렇게 추가해줘야 lib에서 값을 읽어올 수 있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set 태그</title>
</head>
<body>
<%-- 		속성명	   속성값	       영역 --%>
<c:set var="msg" value="봄" scope="page"/>
<c:set var="msg2" value="여름" scope="request"/>
<c:set var="msg3" value="가을" scope="session"/>
<c:set var="msg4" value="겨울" scope="application"/>

${pageScope.msg}, ${msg}<br>
${requestScope.msg2}, ${msg2}<br>
${sessionScope.msg3}, ${msg3}<br>
${applicationScope.msg4}, ${msg4}<br>
<%
	Member member = new Member();
%>
<%-- page영역에 Member 객체 저장 --%>
<c:set var="member" value="<%= member %>"/>
<%-- Member 객체의 name 멤버변수에 데이터 저장 --%>
<%--
target : 값을 설정하고자 하는 객체를 명시
property : 값이 저장되는 멤버변수
--%>
<c:set target="${member}" property="name" value="홍길동"/>
회원이름 : ${member.name}<br>
회원이름 : ${member.getName()}<br><!-- 같은 결과이기 때문에 위에처럼 사용하는 것이 좋음(자동으로 get메서드를 찾아서 호출) -->

</body>
</html>