package kr.news.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class WriteAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NewsVO vo = new NewsVO();
		vo.setTitle(request.getParameter("title"));
		vo.setWriter(request.getParameter("writer"));
		vo.setPasswd(request.getParameter("passwd"));
		vo.setEmail(request.getParameter("email"));
		vo.setArticle(request.getParameter("article"));
		vo.setFilename(FileUtil.uploadFile(request, "filename"));

		NewsDAO dao = NewsDAO.getInstance();
		dao.registerNews(vo);
		
		return "write.jsp";
	}
}
