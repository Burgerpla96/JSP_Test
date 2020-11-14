package test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test_post extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글처리
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		req.setAttribute("method_post", 
				String.format("힘내요!_post<br/>한글이 잘 나와요~:  ID= %s, Password= %s", username,password));
		req.getRequestDispatcher("/Study/Study_201103_1.jsp").forward(req, resp);
	}
}
