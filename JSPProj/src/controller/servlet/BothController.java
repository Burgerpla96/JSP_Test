package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. HttpServlet 상속
public class BothController extends HttpServlet {

	//하나의 컨트롤러로 get 및 post요청 처리하기
	//방법1 service overriding
	/*
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 영역에 데이터 저장
		req.setAttribute("method_both", req.getMethod()+"방식 요청");
		//jsp로 포워딩
		req.getRequestDispatcher("/Servlet13/Servlet.jsp").forward(req, resp);
		
	}////////service
	*/
	
	//방법2  -doGet,doPost overriding해서 한 쪽으로 몰아주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}//////////////doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 영역에 데이터 저장
		req.setAttribute("method_both", req.getMethod()+"방식 요청");
		//jsp로 포워딩
		req.getRequestDispatcher("/Servlet13/Servlet.jsp").forward(req, resp);
	}////////////doPost
	
	
	
	
	
	
			
			
		
	
	
}
