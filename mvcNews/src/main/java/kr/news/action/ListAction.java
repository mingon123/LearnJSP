package kr.news.action;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.PagingUtil;

public class ListAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		NewsDAO dao = NewsDAO.getInstance();
		int count = dao.getCount();
		
		PagingUtil page = new PagingUtil(Integer.parseInt(pageNum),count,20,10,"list.do");
		List<NewsVO> list = null;
		if(count>0) {
			list = dao.getList(page.getStartRow(), page.getEndRow());
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("page", page.getPage());
		
		return "list.jsp";
	}
}
