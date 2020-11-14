package controller.dataroom;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.FileUtils;

public class PasswordController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//POST방식으로 넘어오는 파라미터의 한글처리
		req.setCharacterEncoding("UTF-8");
		//파라미터 받기
		String no = req.getParameter("no");
		String password = req.getParameter("password");
		String mode = req.getParameter("mode");
		String originalFilename = req.getParameter("originalFilename");
		//모델 호출 및 결과 받기
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		boolean flag = dao.isCorrectPassword(no, password);
		dao.close();
		//View 선택후 포워딩
		//비밀번호가 틀린경우 이전 페이지로 이동
		if(!flag) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않아요');");
			out.print("history.back();");
			out.print("</script>");
			return;
		}
		
		//비밀번호가 일치하는 경우
		if("UPDATE".equals(mode)) { //내용을 담아서 수정폼으로 이동 위해 서블릿으로 이동
			//System.out.println(req.getParameter("nowPage")+"자기야 공부 열심히 해야겠다~");
			req.getRequestDispatcher("/DataRoom/Edit.kosmo?nowPage="+req.getParameter("nowPage")).forward(req, resp);
		}
		else {//삭제를 누른 경우, 목록으로 이동
			dao = new DataRoomDAO(req.getServletContext());
			int succOrFail = dao.delete(no);
			dao.close();
			if(succOrFail==1) {//레코드 삭제 성공시 업로드 파일 삭제
				FileUtils.deleteFile(req, "/Upload", originalFilename);
			}
			req.setAttribute("SUCCFAIL", succOrFail);
			//메세지 뿌려주는 페이지로 이동
			req.getRequestDispatcher("/DataRoom14/Message.jsp").forward(req, resp);
		}
		
		
	}///////////doPost
	
}
