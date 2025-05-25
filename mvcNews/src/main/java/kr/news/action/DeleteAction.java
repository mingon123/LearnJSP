package kr.news.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class DeleteAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		long num = Long.parseLong(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		
		NewsDAO dao = NewsDAO.getInstance();
		NewsVO db_news = dao.getNews(num);
		boolean check = false;
		if(db_news!=null) {
			check = db_news.isCheckedPassword(passwd);
		}
		if(check) {
			// 글 삭제
			dao.deleteNews(num);
			// 파일 삭제
			FileUtil.removeFile(request, db_news.getFilename());
		}
		
		request.setAttribute("check", check);

		return "delete.jsp";
	}
}
