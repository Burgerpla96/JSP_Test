package controller.dataroom;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;


public class ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//가) 사용자 요청받기
		//나) 요청을 분석한다.
		//다) 모델에서 필요한 로직을 호출해서 결과값이 있으면 받기
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		Map map = new HashMap();
		///////////////////////////////////////페이징
		//페이징을 위한 로직 시작)
		//전체 레코드 수
		int totalRecordCount = dao.getTotalRecordCount();
		//페이지 사이즈
		int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
		//blockPage
		int blockPage = Integer.valueOf(this.getInitParameter("BLOCK_PAGE"));
		//전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize); 
		//현재 페이지 번호
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝 ROWNUM 구하기
		int start = (nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		//페이징을 위한 로직 끝)
		map.put("start",start);
		map.put("end",end);
		///////////////////////////////////////페이징
		
		List<DataRoomDTO> list = dao.selectList(map);
		dao.close();
		
		//라) request영역에 저장
		req.setAttribute("list", list);
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/DataRoom/List.kosmo?");
		
		//페이징 속성들 저장
		req.setAttribute("pagingString", pagingString);
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pageSize", pageSize);
		
		
		
		
		
		
		
		//마) 결과값을 뿌려줄 뷰 포워딩
		//view 선택
		RequestDispatcher dispatcher = req.getRequestDispatcher("/DataRoom14/List.jsp");
		//포워딩
		dispatcher.forward(req, resp);
		
		
	}////////////service
}
