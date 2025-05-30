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
<title>성적 상세 정보</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h2>성적 상세 정보</h2>
<%
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	int cnt = 0;
	
	try{
		// Connection 객체 반환
		conn = DBUtil.getConnection();
		// SQL문 작성
		sql = "SELECT * FROM score WHERE id=?";
		// JDBC 수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		// ?에 데이터 바인딩
		pstmt.setString(1, id);
		// JDBC 수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		if(rs.next()){	// 데이터가 1개라 if문 사용
			String name = rs.getString("name");
			int korean = rs.getInt("korean");
			int english = rs.getInt("english");
			int math = rs.getInt("math");
			int sum = rs.getInt("sum");
			int avg = rs.getInt("avg");
			String grade = rs.getString("grade");
			Date reg_date = rs.getDate("reg_date");
%>
		<ul>
			<li>ID : <%= id %></li>
			<li>작성자 : <%= name %></li>
			<li>국어 : <%= korean %></li>
			<li>영어 : <%= english %></li>
			<li>수학 : <%= math %></li>
			<li>총점 : <%= sum %></li>
			<li>평균 : <%= avg %></li>
			<li>등급 : <%= grade %></li>
			<li>작성일 : <%= reg_date %></li>
		</ul>
		<div class="align-right">
			<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?id=<%= id %>'">
			<input type="button" value="삭제" id="delete_btn">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
		<script type="text/javascript">
			const delete_btn = document.getElementById('delete_btn');
			// 이벤트 연결
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice) location.replace('deleteTest.jsp?id=<%= id %>');
			};
		</script>
<%
		}else{ // 사용자가 잘못된 데이터를 넣는 경우(정해진 링크 이외에 이상한 링크 검색 시)
%>
		<div class="result-display">
			<div class="align-center">
				성적 상세 정보가 없습니다.<p>
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>		
<%
		}
	}catch(Exception e){
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 성적 상세 정보 호출 실패!<p>
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
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