package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 영역에 결과 값 저장
		req.setAttribute("message", "Hello Servlet!!!");
		//포워드
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);
	
	}///////doGet

	
}
