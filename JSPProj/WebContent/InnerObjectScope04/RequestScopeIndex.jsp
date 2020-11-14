<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	파라미터로 넘어온 값을 읽을때는 한글처리를 위해서 
	request.setCharacterEncoding("UTF-8")해야한다.
	단, 영역에 저장된 값을 읽을때는 한글처리 불필요
	
	page 영역에 저장한 속성은 해당페이지를 벗어나면 소멸된다.
	page 영역에 pageContext객체 존재
	*/
	
	//리퀘스트 영역에 속성저장
	request.setAttribute("requestInteger", new Integer(10));
	request.setAttribute("requestString", "request 영역에 저장된 문자열");
	request.setAttribute("requestDate", new Date(new java.util.Date().getTime()));
	request.setAttribute("requestMemberFirst", new MemberDTO("KIM","1234","김길동",null,"20"));
	request.setAttribute("requestMemberSecond", new MemberDTO("PARK","1234","박길동",null,"30"));
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeIndex.jsp</title>
</head>
<body>
<!-- 
	- 속성 추가
		setAttribute(String name,Object value): 
		name이라는 이름의 속성에 value값 지정,
		값은 기본 자료형을 제외한 모든 클래스 타입 

	- 속성의 값 얻기
		Object getAttribute(String name): name이라는 이름을 가진 속성의 값을 리턴

	- 속성 삭제
		removeAttribute(String name):name이라는 이름의 속성 삭제

	-속성의 이름 목록 구하기
		java.uti.Enumeration getAttributeNames() :속성의 이름 목록을 리턴
		                                pageContext개체는 이 메서드를 제공하지 않는다.
 -->
	<fieldset>
		<legend>request 영역</legend>
		
		<h2>request 영역에 저장된 속성 읽기</h2>
		<%
		Object object = request.getAttribute("requestMemberFirst");
		String firstMemberString = "";
		if(object instanceof MemberDTO){
			firstMemberString = String.format(
					"이름: %s, 아이디: %s, 비번:%s, 나이:%s",
					((MemberDTO)object).getName(),
					((MemberDTO)object).getId(),
					((MemberDTO)object).getPwd(),
					((MemberDTO)object).getAge());
		}
		MemberDTO second = (MemberDTO)request.getAttribute("requestMemberSecond");
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer type: <%= request.getAttribute("requestInteger") %></li>
			<li>String type: <%= request.getAttribute("requestString") %></li>
			<li>Date type: <%= request.getAttribute("requestDate") %></li>
			<li>MemberDTO type1: <%= firstMemberString %></li>
			<li>MemberDTO type2: <%= second %></li>
		</ul>
		
		<h2>request 영역에 저장된 속성 삭제후 읽기</h2>		
		<%
		//속성명이 틀린경우 삭제가 안된다. 에러는 안난다.
		request.removeAttribute("noKey");
		//존재 하는 키값으로 삭제
		request.removeAttribute("requestInteger");
		//pageContext.removeAttribute("pageString");
		request.removeAttribute("requestDate");
		request.removeAttribute("requestMemberFirst");
		request.removeAttribute("requestMemberSecond");
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer type: <%= request.getAttribute("requestInteger") %></li>
			<li>String type: <%= request.getAttribute("requestString") %></li>
			<li>Date type: <%= request.getAttribute("requestDate") %></li>
			<li>MemberDTO type1: <%= firstMemberString %></li>
			<li>MemberDTO type2: <%= second %></li>
		</ul>
		
		<h2>Page 이동</h2>
		<a href= "RequestScopeResult.jsp" >사용자 클릭에 의한 이동</a>	
		
	</fieldset>
	<script>
		//location.href="https://www.naver.com/";(Redirect로 일단 응답을한다.)
		
	</script>
	
	
	
</body>
</html>
<%
	//자동으로 페이지가 이동되는    forward방식  (redirect방식도 있다.)
	//차이를 기억!!!!!!!!!!!
	
	//자동으로 이동할 페이지설정-forward방식 (절대경로 지정시 컨텍스트 루트는 제외)
	//RequestDispatcher dispatcher = request.getRequestDispatcher("/InnerObjectScope04/RequestScopeResult.jsp");
	//포워드
	//dispatcher.forward(request, response);

	
	//redirect 방식
	/*
	새로운 요청 , 리퀘스트 영역이 공유가 안된다.
	location.href로 이동과 같다.
	절대경로 지정시 컨텍스트 루트 포함
	*/
	response.sendRedirect(request.getContextPath()
			+"/InnerObjectScope04/RequestScopeResult.jsp");
	
	
%>