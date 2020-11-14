package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.PBKDF2;
import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

// HttpServlet 상속 받아야 컨트롤러가 된다.(즉, 서블릿이 된다.)
public class WriteController extends HttpServlet {
	//입력 폼으로 이동
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//절대경로 지정시 포워딩은 컨텍루트 필요 없고 리다이렉트는 필요함
		req.getRequestDispatcher("/DataRoom14/Write.jsp").forward(req, resp);
	}////////////doGet
	
	//입력처리 즉 파일 업로드 및 데이터 베이스 입력
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		//3) 요청 분석 - 입력처리 요청
		//4) 모델호출 및 결과값 받기
		//파일 업로드와 관련된 모델(비즈니스 로직) 호출
		MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/Upload"));
		//DB입력 성공시에는 1, 실패시에는 0, 파일용량 초과시에는 -1 저장
		int successOrFail;
		//오류시 입력값 보존을 위한 변수 선언
		String name,title,password = null,content;
		if(mr != null) {//파일 업로드 성공일때 DB에 입력처리
			//기타 파라미터 받아서 테이블에 입력처리
			name = mr.getParameter("name");
			title = mr.getParameter("title");
			//비밀번호 암호화는 나중에...  https://gist.github.com/jtan189/3804290
			password = mr.getParameter("password");
			
			//암호화
			try {
				password = PBKDF2.createHash(password);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			
			content = mr.getParameter("content");
			String attachFile = mr.getFilesystemName("attachFile");
			//DB에 CRUD 작업과 관련된 모델 호출
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto = new DataRoomDTO();
			dto.setAttachFile(attachFile);
			dto.setContent(content);
			dto.setName(name);
			dto.setPassword(password);
			dto.setTitle(title);
			
			successOrFail = dao.insert(dto);
			
			if(successOrFail == 0) {//데이터 입력 실패시 업로드된 파일 삭제
				//파일 삭제 로직
				FileUtils.deleteFile(req,"/Upload",attachFile);
			}
			dao.close();
			
		}
		else { //파일 용량 초과시
			successOrFail = -1;
		}
		//5) request 영역에 결과값을 저장
		req.setAttribute("SUCCFAIL", successOrFail);
		//5-2) 컨트롤러 구분용 - 입력:INS, 수정:EDT, 삭제:DEL 속성 설정
		req.setAttribute("WHERE", "INS");
		//6) view 로 이동
		req.getRequestDispatcher("/DataRoom14/Message.jsp").forward(req, resp);
		
		
		//if(successOrFail == 1) {//파일업로드 및 DB입력 성공
			//[이동방법1]-바로 목록으로 이동:반드시 List.jsp가 아닌 List.kosmo로 거쳐서 ListController
			// 를 통해서 가야한다. 그 이유는 list(DB에 저장된 값)를 넘겨주기 위함
			//req.getRequestDispatcher("/DataRoom/List.kosmo").forward(req, resp);	
			//[이동방법2]-메시지 뿌려주는 jsp페이지로 이동후 목록으로 이동
			//req.getRequestDispatcher("/DataRoom13/Message.jsp").forward(req, resp);
		//}
		//else {//파일 용량 초과 혹은 파일업로드는 됬으나 DB입력 실패한 경우
			//[이동방법1]-자스의 history.back()으로 입력폼으로 이동
			//서블릿에서 브라우저로 직접 출력시 -한글처리]
			/*
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out= resp.getWriter();
			out.println("<script>");
			out.println("alert('"+(successOrFail==0 ? "DB입력 실패" : "파일 용량 초과")+"');");
			out.println("history.back()");
			out.println("</script>");
			*/
			//[이동방법2]메시지 뿌려주는 페이지로 이동후 다시 입력폼으로
			//req.getRequestDispatcher("/DataRoom13/Message.jsp").forward(req, resp);
			
			//이동방법3-비추천]비밀번호도 기존값 유지하기 위한 방법-역시 입력폼으로 이동
			//※MultipartRequest가 파라미터를 가로채니까
			//포워드하더라도 전달안됨 그래서 영역에 저장]
			/*
			if(mr == null) {
				//"UTF-8"생략시 파라미터로 받은 한글이 깨짐]
				mr= new MultipartRequest(
						req,
						req.getServletContext().getRealPath("/Upload"),"UTF-8");
				
			}			
			req.setAttribute("name", mr.getParameter("name"));
			req.setAttribute("title", mr.getParameter("title"));
			req.setAttribute("content", mr.getParameter("content"));
			req.setAttribute("pass", mr.getParameter("pass"));
			req.setAttribute("attachfile",mr.getOriginalFileName("attachfile"));
			req.setAttribute("error", sucOrFail==0?"Input Failure":"Exceed File Size");
			req.getRequestDispatcher("/DataRoom13/Write.jsp").forward(req, resp);
			*/		
		
		//}/////else
		
	}//////////////////////////////doPost
	
	
}
