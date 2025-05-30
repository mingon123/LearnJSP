package kr.board.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.board.dao.BoardDAO;
import kr.board.vo.BoardVO;
import kr.controller.Action;

public class WriteAction implements Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 자바빈(VO) 생성
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle(request.getParameter("title"));
		boardVO.setName(request.getParameter("name"));
		boardVO.setPasswd(request.getParameter("passwd"));
		boardVO.setEmail(request.getParameter("email"));
		boardVO.setContent(request.getParameter("content"));
		boardVO.setIp(request.getRemoteAddr());
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.insert(boardVO);
		
		// JSP 경로 반환
		return "write.jsp";
	}
}
