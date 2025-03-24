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
<title>게시판 목록</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>게시판 목록</h2><%-- 대문페이지에서는 모든 페이지를 링크걸기 때문에 대문페이지(첫페이지) 링크만 알면 됨: 여기서는 selectTest가 대문페이지 --%>
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='insertTestForm.jsp'">
	</div>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	try{
		// Connection 객체 반환
		conn = DBUtil.getConnection();
		// SQL문 작성
		sql = "SELECT * FROM tboard ORDER BY num DESC";
		// JDBC 수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		// JDBC 수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		while(rs.next()){
			int num = rs.getInt("num");
			String name = rs.getString("name");
			String title = rs.getString("title");
			Date reg_date = rs.getDate("reg_date");
			// String으로 날짜를 읽어오면 연월일 시분초까지, Date는 연월일 데이터만 가져옴.
%>
			<tr>
				<td><%= num %></td>
				<td><a href="detailTest.jsp?num=<%= num %>"><%= title %></a></td><%-- title 클릭 시 링크로 이동, 링크는 get방식으로 해당 num 번호로 이동하도록 --%>
				<td><%= name %></td>
				<td><%= reg_date %></td>
			</tr>
<%
			}
	}catch(Exception e){
%>
		<tr>
			<td colspan="4" class="align-center">오류 발생!</td>
		</tr>
<%
		e.printStackTrace();
	}finally{
		// 자원정리
		DBUtil.executeClose(rs, pstmt, conn);
	}
%>
	</table>
</div>
</body>
</html>