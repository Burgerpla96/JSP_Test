package controller.dataroom;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;

public class ViewController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청 분석
		String no = req.getParameter("no");
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		DataRoomDTO dto = dao.selectOne(no);
		dao.close();
		
		//내용 줄바꿈을 여기서 해도된다.
		//dto의 값, setContent로 뒤짚어쓰기
		//list.get(0).setContent(list.get(0).getContent().replace("\r\n", "<br/>"));
		
		//라) request영역에 저장
		req.setAttribute("dto", dto);
		//마) 결과값을 뿌려줄 뷰 포워딩
		//view(.jsp) 선택
		RequestDispatcher dispatcher = req.getRequestDispatcher("/DataRoom14/View.jsp");
		//포워딩
		dispatcher.forward(req, resp);
		
		
	}////////////////doGet
	

}
