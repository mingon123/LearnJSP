package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
    
// 서블릿에서 사용 주소 명시
@WebServlet("/hello") // 파일을 그대로 보여주는 것이 아니라 암호화하여 보여줌(사용하지 않으면 tomcat에서 막아 404에러뜸
public class HelloServlet extends HttpServlet{
	
	@Override	// get/post
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ // request, response 객체는 container 가 생성
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		// HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Hello Servlet</title></head>");
		out.println("<body>");
		out.println("처음 작성하는 servlet입니다.");
		out.println("</body>");
		out.println("</html>");
		
		out.close(); // 자원정리(생략 가능)
	}
}
