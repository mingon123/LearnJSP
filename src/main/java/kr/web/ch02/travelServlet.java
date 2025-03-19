package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpClient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/travel")
public class travelServlet extends HttpServlet{

	/*
	[실습]
	[출력예시]
	이름 : 홍길동
	여행지 : 서울, 파리 <-- 여행지를 선택한 경우
	여행지 : 집 <-- 여행지를 선택하지 않은 경우
	*/
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		// HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>여행지 선택</title></head>");
		out.println("<body>");
		out.println("<h3>여행지 선택</h3>");
		// 전송된 데이터 반환
		String name = request.getParameter("name");
		
		out.println("이름 : " + name + "<br>");
		out.println("여행지 : ");
		
		// 전송된 데이터를 String 배열로 반환
		String [] values = request.getParameterValues("city");
		if(values!=null) {
			for (int i = 0; i < values.length; i++) {
				if(i>0) out.print(",");
				out.print(values[i]);
//				if(i<values.length-1) out.print(",");
			}
		} else {
			out.println("집");
		}
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
