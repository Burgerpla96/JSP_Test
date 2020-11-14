<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ForwardExamProcess.jsp -->


<%
	String name = request.getParameter("user");
	String pass = request.getParameter("pass");
	request.setAttribute("error","틀렸어요");
	
	
	
	String pathString = "";
	//문제)
	//회원인 경우 action tag 로 로그인 처리  아이디 비번처리,
	//로그아웃도 처리
	//비회원인 경우도 처리
	if("KIM".equals(name) && "1234".equals(pass)){
		pathString = "ForwardExamMyPage.jsp";
		session.setAttribute("USER_ID",name); 
		session.setAttribute("USER_PWD",pass); 
	}
	else{
		pathString = "ForwardExamLogin.jsp";
	}
%>

<jsp:forward page="<%= pathString %>"/>


