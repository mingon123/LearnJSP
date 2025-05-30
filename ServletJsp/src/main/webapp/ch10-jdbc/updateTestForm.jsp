<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 수정</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>성적 수정</h2>
<%
	String user_id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		// Connection 객체 반환
		conn = DBUtil.getConnection();
		// SQL문 작성
		sql = "SELECT * FROM score WHERE id=?";
		// JDBC 수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		// ?에 데이터 바인딩
		pstmt.setString(1, user_id);
		// JDBC 수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		if(rs.next()){
			String id = rs.getString("id");
			String name = rs.getString("name");
			int korean = rs.getInt("korean");
			int english = rs.getInt("english");
			int math = rs.getInt("math");
			
%>
	<form id="myForm" action="updateTest.jsp" method="post">
		<ul>
			<li>
				<label>ID</label>
				<input type="hidden" name="id" value="<%= id %>"><%= id %>
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" value="<%= name %>" size="20" maxlength="10">
			</li>
			<li>
				<label for="korean">국어</label>
				<input type="text" name="korean" id="korean" value="<%= korean %>" min="0" max="100">
			</li>
			<li>
				<label for="english">영어</label>
				<input type="text" name="english" id="english" value="<%= english %>" min="0" max="100">
			</li>
			<li>
				<label for="math">수학</label>
				<input type="text" name="math" id="math" value="<%= math %>" min="0" max="100">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</form>
<%
		}else{
%>
		<div class="result-display">
			<div class="align-center">
				수정할 성적 정보 호출 실패<p>
				<input type="button" value="목록" onclick="loacation.href='selectTest.jsp'">
			</div>
		</div>
<%
		}
	}catch(Exception e){
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 수정할 성적 정보 호출 실패<p>
				<input type="button" value="목록" onclick="loacation.href='selectTest.jsp'">
			</div>
		</div>
<%
		e.printStackTrace();
	}finally{
		// 자원정리
		DBUtil.executeClose(rs, pstmt, conn);
	}
%>	
</div>
</body>
</html>