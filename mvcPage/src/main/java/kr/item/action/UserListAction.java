package kr.item.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.item.dao.ItemDAO;
import kr.item.vo.ItemVO;
import kr.util.PagingUtil;

public class UserListAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		ItemDAO dao = ItemDAO.getInstance();
		// status가 0이면 미표시(1), 표시(2) 모두 개수 체크(관리자용)
		// status가 1이면 표시(2)만 읽음(사용자용)
		int count = dao.getItemCount(keyfield, keyword, 1); // 표시 상품만 읽기
		
		PagingUtil page = new PagingUtil(keyfield,keyword,Integer.parseInt(pageNum),count,24,10,"list.do"); // 가로로 디스플레이되기 때문에 24를 변경해서 개수 조정
		
		List<ItemVO> list = null;
		if(count > 0) {
			list = dao.getListItem(page.getStartRow(),page.getEndRow(),keyfield,keyword,1);
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("page", page.getPage());
		
		return "item/user_list.jsp";
	}
}
