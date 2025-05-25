package kr.order.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.order.dao.OrderDAO;
import kr.order.vo.OrderDetailVO;
import kr.order.vo.OrderVO;

public class UserOrderDetailAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long user_num = (Long)session.getAttribute("user_num");
		if(user_num==null) {
			return "redirect:/member/loginForm.do";
		}
		
		long order_num = Long.parseLong(request.getParameter("order_num"));
		OrderDAO dao = OrderDAO.getInstance();
		// 주문정보 호출
		OrderVO order = dao.getOrder(order_num);
		if(order.getMem_num() != user_num) {
			// 구매자 회원번호와 로그인한 회원번호가 불일치할 경우
			return "common/accessDenied.jsp";
		}
		
		// 주문한 개별상품정보 호출
		List<OrderDetailVO> detailList = dao.getListOrderDetail(order_num);
		
		request.setAttribute("order", order);
		request.setAttribute("detailList", detailList);
		
		return "order/user_detail.jsp";
	}
}
