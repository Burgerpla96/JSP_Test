<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  -->



<%
	//사용자에게 입력값 받기
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	//아이디와 비번따라 분기
	
	//if("KIM".equals(user.trim()) && "1234".equals(pass.trim())){
	//실제 테이블과 연동
	BBSDao dao = new BBSDao(application, "JSP","jsp");
	boolean flag = dao.isMember(user,pass);
	if(flag){		
		//1) 로그인 처리 - session영엯에 속성 (주로 식별자만 )저장
		session.setAttribute("USER_ID", user);
		//2) 로그인 처리후 마이 페이지로 이동
		response.sendRedirect("MyPage.jsp");
		
	}
	else{
		//리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("NOT_LOGIN", "아이디와 비번 불일치");
		//로그인 페이지로 forward
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}


%>