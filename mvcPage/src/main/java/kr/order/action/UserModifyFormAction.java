package kr.order.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.order.dao.OrderDAO;
import kr.order.vo.OrderVO;

public class UserModifyFormAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long user_num = (Long)session.getAttribute("user_num");
		if(user_num == null) {
			return "redirect:/member/loginForm.do";
		}

		Long order_num = Long.parseLong(request.getParameter("order_num"));
		
		OrderDAO dao = OrderDAO.getInstance();
		// 주문 정보 호출
		OrderVO order = dao.getOrder(order_num);
		if(order.getMem_num()!=user_num) {
			// 구매자 회원번호와 로그인한 회원번호가 불일치할 경우
			return "common/accessDenied.jsp";
		}
		
		// 배송지 수정전 배송상태 체크
		if(order.getStatus()>1) {
			// 배송준비중 이상으로 관리자가 변경한 상품을 주문자가 변경할 수 없음
			request.setAttribute("notice_msg", "배송상태가 변경되어 주문자가 주문정보 변경 불가");
			request.setAttribute("notice_url", request.getContextPath()+"/order/orderList.do");
			return "common/alert_view.jsp";
		}
		
		request.setAttribute("order", order);
		
		return "order/user_modifyForm.jsp";
	}
}
