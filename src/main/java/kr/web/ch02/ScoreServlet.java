package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/score")
public class ScoreServlet extends HttpServlet{

	/*
	[실습] 성적처리
	[출력예시]
	국어 : 00
	영어 : 00
	수학 : 00
	총점 : 000
	평균 : 00
	등급 : A
	*/
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");

		int korean = Integer.parseInt(request.getParameter("korean"));
		int english = Integer.parseInt(request.getParameter("english"));
		int math = Integer.parseInt(request.getParameter("math"));
		// 총점 구하기
		int sum = korean + english + math;
		// 평균 구하기
		double average = (double)sum/3;
		// 등급 구하기
		char grade = 'F';
		switch ((int)average/10) {
		case 10:
		case 9: grade = 'A'; break;
		case 8:	grade = 'B'; break;
		case 7:	grade = 'C'; break;
		case 6:	grade = 'D'; break;
		}
		
		// HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>성적 처리</title></head>");
		out.println("<body>");		
		out.println("국어 : " + korean + "<br>");
		out.println("영어 : " + english + "<br>");
		out.println("수학 : " + math + "<br>");
		out.println("총점 : " + sum + "<br>");
		out.printf("평균 : %.2f <br>", average);
		out.println("등급 : " + grade + "<br>");		
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
