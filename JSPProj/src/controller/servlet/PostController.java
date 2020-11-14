package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. HttpServlet 상속
public class PostController extends HttpServlet {
	//2. POST 방식 요청
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글 넘어오면 한글처리도 해야한다.
		//jsp 페이지에서 인코딩은 소용없고 servlet파일에서 인코딩을 바꿔서 넘겨야한다.
		//그래야 파라미터를 가져오고 저장하는 방식이 가능
		req.setCharacterEncoding("UTF-8");
		
		//3. 파라미터 받기
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		//4. 리퀘스트 영역에 데이터 저장
		req.setAttribute("method_post", 
				String.format("POST방식 요청입니다-아이디:%s, 비번:%s", username,password));
		//5. jsp로 포워딩
		req.getRequestDispatcher("/Servlet13/Servlet.jsp").forward(req, resp);
		
	}//////doPost
	
	
}
