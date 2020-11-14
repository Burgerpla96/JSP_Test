<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ForwardActionTagIndex.jsp -->

<%
//페이지 이동전 각 영역에 속성 저장]
	
	/*1]sendRedirect로 페이지 이동-redirect방식
  - request 영역 공유 안함 
  - 새로운 요청
  - URL창에는 마지막 요청 URL이 보임
  - 절대경로로 페이지 이동시에는 Context 루트를 포함한 경로로 지정
	*/
	/*
	2]액션태그가 아닌 자바코드로 포워딩(서블릿에서 사용)-forward방식
	- request영역 공유
	- 같은 요청(하나의 요청)
	- URL창에는 최초 요청한 URL이 보임
	- 절대경로로 지정시 Context루트 제외
	// forward와 include 방식은  Context루트를 제외하고 써야한다.
	*/
	
	
	//페이지 이동전 각 영역에 속성 저장
	pageContext.setAttribute("pageVar", "페이지 영역");
	request.setAttribute("requestVar", "request 영역");
	
	//Model one방식
	
	//redirect방식
	//response.sendRedirect(request.getContextPath()+"/ActionTag07/ForwardActionTagResult.jsp");
	//forward방식
	request.getRequestDispatcher("/ActionTag07/ForwardActionTagResult.jsp").forward(request, response);
	

%>
<!-- //Model two방식 -->
<!-- Action tag이용 -->
<%-- 
<jsp:forward page="/ActionTag07/ForwardActionTagResult.jsp"/>
--%>