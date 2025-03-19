package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GugudanServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		// 전송된 데이터 반환
				// String(반환형) -> int 변환
		int dan = Integer.parseInt(request.getParameter("dan"));
		
		// HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>구구단</title><head>");
		out.println("<body>");
		out.println(dan + "단<br>");
		out.println("------------------------<br>");
		
		for(int i=1;i<=9;i++) {
			out.println(dan+"*"+i+"="+dan*i+"<br>");
		}
		
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	
}
