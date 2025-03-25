<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%
	// 전송된 데이터 반호나
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	String address = request.getParameter("address");
	String blood_type = request.getParameter("blood_type");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	int cnt = 0;
	
	try{
		// Connection 객체 반환
		conn = DBUtil.getConnection();
		// SQL문 작성
		sql = "INSERT INTO people (id,name,job,address,blood_type,reg_date) VALUES (?,?,?,?,?,SYSDATE)";
		// JDBC 수행 3단계 : PreparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		// ?에 데이터 바인딩
		pstmt.setString(++cnt, id);
		pstmt.setString(++cnt, name);
		pstmt.setString(++cnt, job);
		pstmt.setString(++cnt, address);
		pstmt.setString(++cnt, blood_type);
		// JDBC 수행 4단계
		pstmt.executeUpdate();
%>
		{"result":"success"}
<%
	}catch(Exception e){
%>
		{"result":"failure"}
<%
		e.printStackTrace();
	}finally{
		DBUtil.executeClose(null, pstmt, conn);
	}
	

%>