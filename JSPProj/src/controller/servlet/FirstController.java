package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력 폼으로 포워드
		req.getRequestDispatcher("/Servlet13/Form.jsp").forward(req, resp);
		
	}/////////////doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//secondController에서 받아서 Servlet.jsp로 넘겨보기
		
		req.setAttribute("test", "405error가 뜨지 않게 해보자.");
		req.getRequestDispatcher("/Servlet13/Servlet.jsp").forward(req, resp);
	}
	
	
	
	
	
}
