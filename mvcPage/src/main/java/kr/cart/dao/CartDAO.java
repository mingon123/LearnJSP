package kr.cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.cart.vo.CartVO;
import kr.item.vo.ItemVO;
import kr.util.DBUtil;

public class CartDAO {
	// 싱글톤 패턴
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
		return instance;
	}
	private CartDAO() {}
	
	// 장바구니 등록
	public void insertCart(CartVO cart)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "INSERT INTO zcart (cart_num,item_num,order_quantity,mem_num) VALUES (zcart_seq.nextval,?,?,?)";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setLong(++cnt, cart.getItem_num());
			pstmt.setInt(++cnt, cart.getOrder_quantity());
			pstmt.setLong(++cnt, cart.getMem_num());
			// SQL문 실행
			pstmt.executeUpdate();			
		} catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	// 회원번호(mem_num)별 총구매 금액
	public int getTotalByMem_num(long mem_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int total = 0;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT SUM(sub_total) FROM (SELECT mem_num, order_quantity * price AS sub_total FROM zcart JOIN zitem USING(item_num)) WHERE mem_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setLong(1, mem_num);
			// SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		return total;
	}
	// 장바구니 목록
	public List<CartVO> getListCart(long mem_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CartVO> list = null;
		String sql = null;
		int cnt = 0;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql ="SELECT * FROM zcart JOIN zitem USING(item_num) WHERE mem_num=? ORDER BY cart_num DESC";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setLong(++cnt, mem_num);
			// SQL문 실행
			rs = pstmt.executeQuery();
			list = new ArrayList<CartVO>();
			while(rs.next()) {
				CartVO cart = new CartVO();
				cart.setCart_num(rs.getLong("cart_num"));
				cart.setItem_num(rs.getLong("item_num"));
				cart.setOrder_quantity(rs.getInt("order_quantity"));
				cart.setMem_num(rs.getLong("mem_num"));
				
				// 상품 정보를 담기 위해 ItemVO 객체 생성
				ItemVO item = new ItemVO();
				item.setName(rs.getString("name"));
				item.setPrice(rs.getInt("price"));
				item.setPhoto1(rs.getString("photo1"));
				item.setQuantity(rs.getInt("quantity"));
				item.setStatus(rs.getInt("status"));
				
				// ItemVO를 cartVO에 저장
				cart.setItemVO(item);
				
				// 동일 상품(item_num이 같은 상품)의 총구매 금액 구하기
				cart.setSub_total(cart.getOrder_quantity()*item.getPrice());
				
				list.add(cart);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	// 장바구니 상세
	public CartVO getCart(CartVO cart)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartVO cartSaved = null;
		String sql = null;
		int cnt = 0;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM zcart WHERE item_num=? AND mem_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setLong(++cnt, cart.getItem_num());
			pstmt.setLong(++cnt, cart.getMem_num());
			// SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cartSaved = new CartVO();
				cartSaved.setCart_num(rs.getLong("cart_num"));
				cartSaved.setItem_num(rs.getLong("item_num"));
				cartSaved.setOrder_quantity(rs.getInt("order_quantity"));
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return cartSaved;
	}
	// 장바구니 수정 (개별 상품 수량 수정)
	public void updateCart (CartVO cart)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE zcart SET order_quantity=? WHERE cart_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(++cnt, cart.getOrder_quantity());
			pstmt.setLong(++cnt, cart.getCart_num());
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	// 장바구니 수정 (상품번호와 회원번호별 수정, 동일 상품이 있을 경우 수량을 합산)
	public void updateCartByItem_num(CartVO cart)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int cnt = 0;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE zcart SET order_quantity=? WHERE item_num=? AND mem_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(++cnt, cart.getOrder_quantity());
			pstmt.setLong(++cnt, cart.getItem_num());
			pstmt.setLong(++cnt, cart.getMem_num());
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	// 장바구니 삭제
	public void deleteCart(long cart_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "DELETE FROM zcart WHERE cart_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setLong(1, cart_num);
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
