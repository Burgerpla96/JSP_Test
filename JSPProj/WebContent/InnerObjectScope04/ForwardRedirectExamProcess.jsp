<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/Common/IsValidate.jsp" %>
<!-- ForwardRedirectExamProcess.jsp -->
<!--  바로 이동 시킬 것이여서 UI가 필요 없다. -->



<%
	//request.setCharacterEncoding("UTF-8");

	//파라미터 받기
	String id = request.getParameter("id");
	if(!isValidate(out,id,"아이디를 입력하세요.")) return;
	String pwd = request.getParameter("pwd");
	if(!isValidate(out,pwd,"비밀번호를 입력하세요.")) return;
	
	
	//리퀘스트 영역에 아이디 비번 저장
	//forward로 전달하는 경우, 불필요
	request.setAttribute("id", id);
	request.setAttribute("pwd", pwd);
	
	
	
	//가정 ID: KIM , pwd: 1234
	if("KIM".equals(id.trim()) && "1234".equals(pwd.trim())){
		//1. sendRedirect 로 페이지 이동하기
		//response.sendRedirect("ForwardRedirectExamMyPage.jsp");
		//2. forward로 이동  이때는 리퀘스트 영역에 저장하기
		request.getRequestDispatcher("ForwardRedirectExamMyPage.jsp").forward(request, response);
	}
	else {//아이디 비번이 불일치
		//1. sendRedirect 로 페이지 이동하기
		//response.sendRedirect("ForwardRedirectExample.jsp");
		//2. forward로 이동   입력한 값을 유지
		request.setAttribute("errorMsg", "아이디와 비번 불일치");
		request.getRequestDispatcher("ForwardRedirectExample.jsp").forward(request, response);
		
	}
	
%>