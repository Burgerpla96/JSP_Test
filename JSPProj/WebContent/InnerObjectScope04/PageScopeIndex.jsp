<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	page 영역에 저장한 속성은 해당페이지를 벗어나면 소멸된다.
	page 영역에 pageContext객체 존재
	*/
	
	//키값과 밸류값으로 생각하기
	pageContext.setAttribute("pageInteger", new Integer(10));
	pageContext.setAttribute("pageString", "페이지 영역에 저장된 문자열");
	pageContext.setAttribute("pageDate", new Date(new java.util.Date().getTime()));
	pageContext.setAttribute("pageMemberFirst", new MemberDTO("KIM","1234","김길동",null,"20"));
	pageContext.setAttribute("pageMemberSecond", new MemberDTO("PARK","1234","박길동",null,"30"));
	
	//
	

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
		<legend>페이지 영역</legend>
		<h2>Page 영역에 저장된 속성 읽기</h2>
		<%
		Object object = pageContext.getAttribute("pageMemberFirst");
		String firstMemberString = "";
		if(object instanceof MemberDTO){
			firstMemberString = String.format(
					"이름: %s, 아이디: %s, 비번:%s, 나이:%s",
					((MemberDTO)object).getName(),
					((MemberDTO)object).getId(),
					((MemberDTO)object).getPwd(),
					((MemberDTO)object).getAge());
		}
		MemberDTO second = (MemberDTO)pageContext.getAttribute("pageMemberSecond");
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer type: <%= pageContext.getAttribute("pageInteger") %></li>
			<li>String type: <%= pageContext.getAttribute("pageString") %></li>
			<li>Date type: <%= pageContext.getAttribute("pageDate") %></li>
			<li>MemberDTO type1: <%= firstMemberString %></li>
			<li>MemberDTO type2: <%= second %></li>
		</ul>
		
		<h2>Page 영역에 저장된 속성 삭제후 읽기</h2>		
		<%
		//속성명이 틀린경우 삭제가 안된다. 에러는 안난다.
		pageContext.removeAttribute("noKey");
		//존재 하는 키값으로 삭제
		pageContext.removeAttribute("pageInteger");
		//pageContext.removeAttribute("pageString");
		pageContext.removeAttribute("pageDate");
		pageContext.removeAttribute("pageMemberFirst");
		pageContext.removeAttribute("pageMemberSecond");
		
		%>
		<ul style="list-style: upper-roman;">
			<li>Integer type: <%= pageContext.getAttribute("pageInteger") %></li>
			<li>String type: <%= pageContext.getAttribute("pageString") %></li>
			<li>Date type: <%= pageContext.getAttribute("pageDate") %></li>
			<li>MemberDTO type1: <%= firstMemberString %></li>
			<li>MemberDTO type2: <%= second %></li>
		</ul>
		<h2>Page 이동</h2>
		<a href= "PageScopeResult.jsp" >사용자 클릭에 의한 이동</a>	
		
		
	</fieldset>
	<%@ include file="PageScopeIncludePage.jsp" %>
	
	
</body>
</html>