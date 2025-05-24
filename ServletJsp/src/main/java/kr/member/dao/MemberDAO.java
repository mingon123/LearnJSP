package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
	/*
	싱글톤 패턴은 생성자를 private으로 지정해서 외부에서 호출할 수 없도록 처리하고 static 메서드를 호출해서 
	객체가 한 번만 생성되고 생성된 객체를 공유할 수 있도록 처리하는 방식을 의미함.
	*/
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {}
	
	// 회원가입
	public void insertMember(MemberVO member)throws Exception{ // 자바빈에 데이터를 담아서 보내면 매개변수를 전부 입력받지 않고 member 1개만 입력받으면 됨
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			// 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "INSERT INTO smember (num,id,name,passwd,email,phone) VALUES (smember_seq.nextval,?,?,?,?,?)";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(++cnt, member.getId());
			pstmt.setString(++cnt, member.getName());
			pstmt.setString(++cnt, member.getPasswd());
			pstmt.setString(++cnt, member.getEmail());
			pstmt.setString(++cnt, member.getPhone());
			// SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e); // 예외 메세지와 페이지를 전달
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 회원상세정보
	public MemberVO getMember(long num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		MemberVO member = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM smember WHERE num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setLong(1, num);
			// SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				member.setNum(rs.getLong("num"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return member;
	}
	
	// 아이디 중복 체크, 로그인 체크
	public MemberVO checkMember(String id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		MemberVO member = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM smember WHERE id=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩
			pstmt.setString(1, id);
			// SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setNum(rs.getLong("num"));
				member.setPasswd(rs.getString("passwd"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return member;
	}
	
	// 회원정보수정
	public void updateMember(MemberVO member)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
	
		try {
			// 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE smember SET name=?,passwd=?,email=?,phone=? WHERE num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 바인딩
			pstmt.setString(++cnt, member.getName());
			pstmt.setString(++cnt, member.getPasswd());
			pstmt.setString(++cnt, member.getEmail());
			pstmt.setString(++cnt, member.getPhone());
			pstmt.setLong(++cnt, member.getNum());
			// SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e){
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}	
	}
	
	// 회원탈퇴(회원정보 삭제)
	public void deleteMember(long num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// 오토 커밋 해제
			conn.setAutoCommit(false); // 2개 이상인 경우는 이렇게 해야함
			
			// 게시판 데이터 삭제
			sql = "DELETE FROM sboard WHERE num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			// SQL문 반영
			pstmt.executeUpdate();
			
			// 회원정보 삭제
			sql = "DELETE FROM smember WHERE num=?";			
			// PreparedStatement 객체 생성
			pstmt2 = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt2.setLong(1, num);
			// SQL문 실행
			pstmt2.executeUpdate();
			
			// 모든 SQL문이 오류 없이 정상적으로 수행되면 커밋
			conn.commit();
		}catch(Exception e) {
			// SQL문이 하나라도 오류가 있으면 롤백
			conn.rollback();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt2, null); // 2개인 경우 pstmt 순서는 상관 없으나 conn은 마지막에만 정리할 수 있도록 함
			DBUtil.executeClose(null, pstmt, conn);
		}

	}
}
