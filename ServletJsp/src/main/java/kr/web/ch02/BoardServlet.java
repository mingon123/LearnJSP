package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet{
	/*
	[실습]게시판에 글쓰기
	[출력예시]
	이름 : 홍길동
	제목 : 봄
	내용 : 봄이 와요 봄봄봄!!
	*/

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		// 전송된 데이터 반호나
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>게시판에 글쓰기</title></head>");
		out.println("<body>");
		out.println("이름 : " + name + "<br>");
		out.println("제목 : " + title + "<br>");
		out.println("내용 : " + content);
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	
}
