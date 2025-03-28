package kr.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.employee.vo.EmployeeVO;
import kr.util.DBUtil;

public class EmployeeDAO {
	// 싱글톤 패턴
	private static EmployeeDAO instance = new EmployeeDAO();
	
	public static EmployeeDAO getInstance() {
		return instance;
	}
	
	private EmployeeDAO() {}
	
	// 사원 등록
	public void insertEmployee(EmployeeVO vo)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO semployee (snum,id,name,passwd,salary,job) VALUES (semployee_seq.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, vo.getId());
			pstmt.setString(++cnt, vo.getName());
			pstmt.setString(++cnt, vo.getPasswd());
			pstmt.setInt(++cnt, vo.getSalary());
			pstmt.setString(++cnt, vo.getJob());
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
	}
	
	// 사원상세정보
	public EmployeeVO getEmployee(long snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO vo = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, snum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setSnum(rs.getLong("snum"));
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob(rs.getString("job"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	// 아이디 중복체크, 로그인 체크
	public EmployeeVO checkEmployee(String id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO vo = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setId(rs.getString("id"));
				vo.setSnum(rs.getLong("snum"));
				vo.setPasswd(rs.getString("passwd"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return vo;
	}
	
	// 사원정보 수정
	public void updateEmployee(EmployeeVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE semployee SET name=?,passwd=?,salary=?,job=? WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, vo.getName());
			pstmt.setString(++cnt, vo.getPasswd());
			pstmt.setInt(++cnt, vo.getSalary());
			pstmt.setString(++cnt, vo.getJob());
			pstmt.setLong(++cnt, vo.getSnum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 사원정보 삭제
	public void deleteEmployee(long snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			sql = "DELETE FROM story WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, snum);
			pstmt.executeUpdate();
			
			// 사원정보 삭제
			sql = "DELETE FROM semployee WHERE snum=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setLong(1, snum);
			pstmt2.executeUpdate();
			
			conn.commit();
		}catch(Exception e) {
			// SQL문이 하나라도 오류가 있으면 롤백
			conn.rollback();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt2, null); 
//			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
}
