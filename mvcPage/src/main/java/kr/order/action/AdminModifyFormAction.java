package kr.order.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.controller.Action;
import kr.order.dao.OrderDAO;
import kr.order.vo.OrderVO;

public class AdminModifyFormAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Long user_num = (Long)session.getAttribute("user_num");
		if(user_num == null) { // 로그인되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		Integer user_auth = (Integer)session.getAttribute("user_auth");
		if(user_auth != 9) { // 관리자로 로그인하지 않은 경우
			return "common/accessDenied.jsp";
		}

		long order_num = Long.parseLong(request.getParameter("order_num"));
		
		OrderDAO dao = OrderDAO.getInstance();
		OrderVO order = dao.getOrder(order_num);
		
		// 배송상태가 1이 아닌 경우(사용자가 배송상태를 5로 변경했을 경우(주문취소) 포함)
		if(order.getStatus() > 1) { 
			request.setAttribute("notice_msg", "사용자가 배송상태가 변경되어 관리자가 배송지 정보를 수정할 수 없습니다.");
			request.setAttribute("notice_url", request.getContextPath()+"/order/adminDetail.do?order_num="+order.getOrder_num());
			return "common/alert_view.jsp";
		}
		
		request.setAttribute("order", order);
		
		return "order/admin_modifyForm.jsp";
	}
}
