package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. HttpServlet 상속
public class GetController extends HttpServlet{
	//2. GET방식으로 요청이 들어옴: doGet오버라이딩
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//3. request영역에 데이터 저장
		req.setAttribute("method_get", "GET방식 요청입니다.");
		//4. view로 (jsp페이지)로 포워딩
		req.getRequestDispatcher("/Servlet13/Servlet.jsp").forward(req, resp);
	}////////doGet
		
}
