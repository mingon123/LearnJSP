package kr.news.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class ModifyAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NewsVO vo = new NewsVO();
		vo.setNum(Long.parseLong(request.getParameter("num")));
		vo.setPasswd(request.getParameter("passwd"));

		NewsDAO dao = NewsDAO.getInstance();
		NewsVO db_news = dao.getNews(vo.getNum());
		boolean check = false;
		if(db_news!=null) {
			check = db_news.isCheckedPassword(vo.getPasswd());
		}
		if(check) { // 비밀번호 일치
			// 비밀번호 인증하기 전에 넣으면 쓰레기 파일이 쌓이기 때문에 비밀번호 인증 후 값 넣음
			vo.setTitle(request.getParameter("title"));
			vo.setWriter(request.getParameter("writer"));
			vo.setEmail(request.getParameter("email"));
			vo.setArticle(request.getParameter("article"));
			vo.setFilename(FileUtil.uploadFile(request, "filename"));
			
			dao.updateNews(vo);
			if(vo.getFilename()!=null && vo.getFilename().isEmpty()) {
				// 새 파일로 교체할 때 원래 파일 제거
				FileUtil.removeFile(request, db_news.getFilename());
			}
			
			request.setAttribute("num", vo.getNum());
		}
		request.setAttribute("check", check);

		return "modify.jsp";
	}
}
