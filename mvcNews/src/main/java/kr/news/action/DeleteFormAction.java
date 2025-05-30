package kr.news.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;

public class DeleteFormAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		long num = Long.parseLong(request.getParameter("num"));
		
		request.setAttribute("num", num);

		return "deleteForm.jsp";
	}
}
