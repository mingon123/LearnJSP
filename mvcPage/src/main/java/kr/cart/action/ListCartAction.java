package kr.cart.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.cart.dao.CartDAO;
import kr.cart.vo.CartVO;
import kr.controller.Action;

public class ListCartAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long user_num = (Long)session.getAttribute("user_num");
		if(user_num == null) { // 로그인이 되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		// 로그인 된 경우
		CartDAO dao = CartDAO.getInstance();
		// 회원번호별 총구매금액
		int all_total = dao.getTotalByMem_num(user_num);
		
		List<CartVO> list = null;
		if(all_total>0) {
			list = dao.getListCart(user_num);
		}
		
		request.setAttribute("all_total", all_total);
		request.setAttribute("list", list);
		
		return "cart/list.jsp";
	}
}
