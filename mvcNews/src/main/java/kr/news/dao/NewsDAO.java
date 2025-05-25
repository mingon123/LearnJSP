package kr.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.news.vo.NewsVO;
import kr.util.DBUtil;

public class NewsDAO {
	// 싱글톤 패턴
	private static NewsDAO instance = new NewsDAO();
	public static NewsDAO getInstance() {
		return instance;
	}
	private NewsDAO() {}
	
	// 뉴스 등록
	public void registerNews(NewsVO vo) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO dailynews (num,title,writer,passwd,email,article,filename) VALUES (dailynews_seq.nextval,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, vo.getTitle());
			pstmt.setString(++cnt, vo.getWriter());
			pstmt.setString(++cnt, vo.getPasswd());
			pstmt.setString(++cnt, vo.getEmail());
			pstmt.setString(++cnt, vo.getArticle());
			pstmt.setString(++cnt, vo.getFilename());
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 뉴스 총 레코드 수
	public int getCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT COUNT(*) FROM dailynews";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	// 뉴스 목록
	public List<NewsVO> getList(int startRow, int endRow) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NewsVO> list = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT * FROM dailynews ORDER BY num DESC)a) WHERE rnum >= ? AND rnum <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			list = new ArrayList<NewsVO>();
			while(rs.next()) {
				NewsVO vo = new NewsVO();
				vo.setNum(rs.getLong("num"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setReg_date(rs.getDate("reg_date"));
				
				list.add(vo);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	
	// 뉴스 상세 정보
	public NewsVO getNews(long num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NewsVO vo = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM dailynews WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new NewsVO();
				vo.setNum(rs.getLong("num"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setEmail(rs.getString("email"));
				vo.setArticle(rs.getString("article"));
				vo.setFilename(rs.getString("filename"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	// 뉴스 수정
	public void updateNews(NewsVO vo) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;
		
		try {
			conn = DBUtil.getConnection();
			if(vo.getFilename()!=null && !vo.getFilename().isEmpty()) { // 가변적인 경우 무조건 cnt를 써야함
				sub_sql += ",filename=?";
			}
			sql = "UPDATE dailynews SET title=?,writer=?,email=?,article=?" +sub_sql+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++cnt, vo.getTitle());
			pstmt.setString(++cnt, vo.getWriter());
			pstmt.setString(++cnt, vo.getEmail());
			pstmt.setString(++cnt, vo.getArticle());
			if(vo.getFilename()!=null && !vo.getFilename().isEmpty()) {
				pstmt.setString(++cnt, vo.getFilename());
			}
			pstmt.setLong(++cnt, vo.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	// 뉴스 삭제
	public void deleteNews(long num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM dailynews WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
