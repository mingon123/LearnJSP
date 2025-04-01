package kr.web.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// xml에 주소 명시하기 때문에 @WebServlet 제거, 중심 클래스
public class DispatcherServlet extends HttpServlet{
	// get/post 어떤 방식으로 요청할 지 모르기 때문에 어떤 요청에도 에러가 안나게 하기 위해 doGet/doPost 메서드 둘 다 생성
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}
	
	private void requestPro(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		Action com = null; // 모델클래스 객체가 저장되는 변수
		String view = null; // 뷰 경로가 저장되는 변수
		
//		String command = request.getParameter("command"); - 아래처럼 변경(이 줄은 삭제하면됨)
		String command = request.getRequestURI();
		System.out.println("1:" + command);
		
		if(command.indexOf(request.getContextPath())==0) { 					// 컨텍스트 경로가 제일 앞에 있을 때
			command = command.substring(request.getContextPath().length()); // 컨텍스트 경로 제거 /servletJsp 제거
			System.out.println("2:" + command);
		}
		
		if(command.equals("/list.do")) {
			com = new ListAction();
		}else if(command.equals("/write.do")) {
			com = new WriteAction();
		}else if(command.equals("/detail.do")) {
			com = new DetailAction();
		}else if(command.equals("/update.do")) {
			com = new UpdateAction();
		}
		
		try {
			//  데이터 처리 후 뷰 경로 반환
			view = com.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// forward 방식으로 view(jsp) 호출
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	// 호출은 servlet에서 하는데 내용은 jsp파일 내용이 출력됨
}
